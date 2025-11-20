# Juntos Referral Database

ui <- page_navbar(
  title = "Juntos Referral Database",
  theme = bs_theme(
    version = 5,
    bootswatch = "cosmo",
    primary = "#0d6efd",
    base_font = font_google("Inter")
  ) |> bs_add_rules("
    .accordion-button {
      font-size: 0.85rem;
      padding: 0.5rem 0.75rem;
    }
    .accordion-body {
      padding: 0.5rem 0.75rem;
      font-size: 0.85rem;
    }
    .modal-backdrop {
      z-index: 1050 !important;
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      background-color: rgba(0, 0, 0, 0.6) !important;
    }
    .modal {
      z-index: 1055 !important;
    }
    /* Tighter checkbox spacing */
    .form-check {
      margin-bottom: 0.25rem;
    }
    /* Indent checkboxes so they're not aligned with accordion header */
    .accordion-body .form-check {
      padding-left: 1.75rem;
    }
  "),

  header = tagList(
    shinyjs::useShinyjs(),
    tags$head(
      tags$script(src = "checkbox_handlers.js")
    )
  ),

  sidebar = sidebar(
    id = "filter_sidebar",
    width = 350,
    position = "left",

    div(
      class = "mb-3 pb-3 border-bottom",
      h4("Filter Services", class = "mb-2"),
      div(
        class = "d-flex justify-content-between text-muted small",
        div(
          icon("filter"),
          textOutput("filter_count", inline = TRUE)
        ),
        div(
          icon("location-dot"),
          textOutput("site_count", inline = TRUE),
          " sites"
        )
      )
    ),

    actionButton(
      "clear_filters",
      "Clear All Filters",
      class = "btn-outline-secondary btn-sm w-100 mb-3",
      icon = icon("xmark")
    ),

    accordion(
      id = "service_accordion",
      multiple = TRUE,
      open = FALSE,
      create_all_accordions(all_service_cols)
    )
  ),

  nav_panel(
    title = "Sites",
    icon = icon("table"),

    div(
      class = "d-flex justify-content-between align-items-center mb-3",
      h4("Healthcare Sites", class = "mb-0"),
      actionButton(
        "view_site",
        "Select a Site",
        class = "btn-primary",
        icon = icon("info-circle"),
        disabled = NA
      )
    ),

    reactableOutput("sites_table")
  ),

  footer = div(
    class = "text-center text-muted py-3",
    "Juntos HIV/Health Services Referral Database"
  )
)

server <- function(input, output, session) {

  selected_row <- reactiveVal(NULL)

  # REACTIVE: Filtered data based on checkbox selections
  filtered_data <- reactive({
    # Get selected services by category
    selected <- get_selected_services(input, all_service_cols)

    # Apply filters using the filtering functions
    juntos_reduced |>
      apply_service_filters(
        prep_selected = selected$prep,
        pep_selected = selected$pep,
        hiv_selected = selected$hiv_treatment,
        testing_selected = selected$testing,
        mhsu_selected = selected$mhsu,
        social_selected = selected$social_services,
        additional_selected = selected$additional
      )
  })

  # REACTIVE: Table data prepared for display
  table_data <- reactive({
    prepare_table_data(filtered_data())
  })

  # REACTIVE: Filter count
  output$filter_count <- renderText({
    count <- count_active_filters(input, all_service_cols)
    if (count == 0) {
      "No filters active"
    } else {
      paste(count, "filter(s) active")
    }
  })

  # REACTIVE: Site count
  output$site_count <- renderText({
    nrow(filtered_data())
  })

  output$sites_table <- renderReactable({
    reactable(
      table_data(),  # Use reactive data!
      selection = "single",
      onClick = "select",
      defaultPageSize = nrow(table_data()),  # Use reactive data!
      pagination = FALSE,
      searchable = TRUE,
      highlight = TRUE,
      bordered = TRUE,
      striped = TRUE,
      compact = FALSE,
      height = "calc(100vh - 280px)",
      theme = reactableTheme(
        borderColor = "#dfe2e5",
        highlightColor = "#f0f5ff",
        cellPadding = "8px 12px",
        style = list(fontSize = "13px")
      ),
      defaultColDef = colDef(
        headerStyle = list(
          background = "#f8f9fa",
          fontWeight = 600,
          fontSize = "13px"
        )
      ),
      columns = list(
        `Site Name` = colDef(
          minWidth = 200,
          style = list(fontWeight = 500)
        ),
        Organization = colDef(minWidth = 180),
        Jurisdiction = colDef(minWidth = 120),
        Address = colDef(minWidth = 250),
        Services = colDef(
          width = 100,
          align = "center",
          style = function(value) {
            color <- if (value >= 20) "#198754" else if (value >= 10) "#0dcaf0" else "#6c757d"
            list(fontWeight = 600, color = color)
          }
        )
      )
    )
  })

  observeEvent(getReactableState("sites_table", "selected"), {
    row_index <- getReactableState("sites_table", "selected")

    if (length(row_index) > 0) {
      site_name <- table_data()$`Site Name`[row_index]  # Use reactive data!
      selected_row(site_name)
      updateActionButton(session, "view_site", label = paste("View", site_name))
    } else {
      selected_row(NULL)
      updateActionButton(session, "view_site", label = "Select a Site")
    }
  })

  observeEvent(input$view_site, {
    req(selected_row())

    # Get full site data from filtered data
    site_data <- filtered_data() |>
      filter(site_name == selected_row()) |>
      slice(1)

    if (nrow(site_data) == 0) return()

    # Services that need asterisk (contact site for more info)
    services_with_asterisk <- c(
      "prep_other_financial_assistance_available",
      "prep_site_offers_rapid_pr_ep",
      "pep_other_financial_assistance_available",
      "pep_full_supply_available",
      "pep_starter_packs_available",
      "hiv_other_financial_assistance_available",
      "hiv_rapid_hiv_treatment_available",
      "mhsu_other_financial_assistance_available"
    )

    # Track if we need to show footnote
    show_footnote <- FALSE

    # Build service sections for each category
    service_sections <- SERVICE_CATEGORIES |>
      imap(function(category, category_id) {
        hierarchy <- CHECKBOX_HIERARCHY[[category_id]]
        if (is.null(hierarchy)) return(NULL)

        # Get offered services from simple checkboxes
        simple_services <- names(hierarchy$simple) |>
          keep(~ .x %in% names(site_data) && site_data[[.x]] == 1) |>
          map(function(col_name) {
            label <- hierarchy$simple[[col_name]]
            if (col_name %in% services_with_asterisk) {
              show_footnote <<- TRUE
              paste0(label, "*")
            } else {
              label
            }
          })

        # Get offered services from grouped checkboxes (show parent label if ANY child is offered)
        grouped_services <- hierarchy$groups |>
          map(function(group) {
            # Check if ANY child in this group is offered
            child_cols <- names(group$children)
            has_any_child <- any(child_cols %in% names(site_data) & site_data[child_cols] == 1, na.rm = TRUE)

            if (has_any_child) {
              group$parent$label  # Return parent label like "Can mail/deliver medications"
            } else {
              NULL
            }
          }) |>
          keep(~ !is.null(.x)) |>
          unlist()

        all_services <- c(simple_services, grouped_services)

        if (length(all_services) == 0) return(NULL)

        # Return the category section (in a column - 3 columns on large screens)
        div(
          class = "col-lg-4 col-md-6 mb-2",
          h5(
            style = "font-weight: 600; margin-bottom: 0.25rem; font-size: 0.95rem;",
            category$label
          ),
          tags$ul(
            style = "margin-bottom: 0; padding-left: 1.25rem; font-size: 0.8rem; line-height: 1.3;",
            map(all_services, ~ tags$li(style = "margin-bottom: 0.1rem;", .x))
          )
        )
      }) |>
      compact()

    # Show modal with site details
    showModal(
      modalDialog(
        title = NULL,
        size = "xl",  # Extra large for 3 columns
        easyClose = TRUE,
        footer = tags$button(
          type = "button",
          class = "btn btn-secondary",
          `data-bs-dismiss` = "modal",
          style = "background-color: #6c757d; border-color: #6c757d;",
          "Close"
        ),

        div(
          style = "max-width: 1200px; margin: 0 auto;",  # Center container, left-align content

          # Header section with gray background (site info only)
          div(
            style = "background-color: #e9ecef; padding: 1rem; margin: -1rem -1rem 0 -1rem; border-radius: 0.25rem; display: flex; justify-content: center;",

            # Content block - centered but left-aligned within
            div(
              style = "text-align: left;",

              # Site name and organization (larger font, tighter spacing)
              div(
                class = "mb-2",
                h3(
                  style = "font-size: 1.5rem; font-weight: 600; margin-bottom: 0.1rem;",
                  tags$a(
                    href = site_data$website,
                    target = "_blank",
                    site_data$site_name
                  )
                ),
                p(
                  style = "font-size: 1.1rem; color: #6c757d; margin-bottom: 0;",
                  site_data$org_name
                )
              ),

              # Address (compact)
              div(
                class = "mb-1",
                p(
                  style = "margin-bottom: 0; font-size: 0.9rem;",
                  strong("Address: "),
                  site_data$site_address
                )
              ),

              # Website (compact)
              div(
                class = "mb-0",
                p(
                  style = "margin-bottom: 0; font-size: 0.9rem;",
                  strong("Website: "),
                  tags$a(
                    href = site_data$website,
                    target = "_blank",
                    site_data$website
                  )
                )
              )
            )
          ),

          # Services header (outside gray box)
          h4(
            style = "font-weight: 600; margin-bottom: 0.5rem; margin-top: 0.75rem; font-size: 1.1rem;",
            "Services Offered"
          ),

          # Service sections in 2-column grid
          div(
            class = "row",
            service_sections
          ),

          # Footnote if any services have asterisks
          if (show_footnote) {
            div(
              class = "mt-3",
              p(
                style = "font-size: 0.75rem; color: #6c757d; font-style: italic; margin-bottom: 0;",
                "* Contact site for more information"
              )
            )
          }
        )
      )
    )
  })

  observeEvent(input$clear_filters, {
    # Clear all child checkboxes
    checkbox_ids <- all_service_cols |>
      map_chr(~ paste0("service_", .x))

    checkbox_ids |>
      walk(~ updateCheckboxInput(session, .x, value = FALSE))

    # Clear all parent checkboxes
    parent_ids <- c(
      # PrEP
      "parent_prep_can_mail_deliver_meds",
      "parent_prep_cost_coverage",
      "parent_prep_rides",
      "parent_prep_new_delivery",
      # PEP
      "parent_pep_can_mail_deliver_meds",
      "parent_pep_cost_coverage",
      "parent_pep_rides",
      "parent_pep_rapid_same_day",
      # HIV Treatment
      "parent_hiv_treatment_can_mail_deliver_meds",
      "parent_hiv_treatment_cost_coverage",
      "parent_hiv_treatment_rides",
      "parent_hiv_treatment_on_site_navigators",
      # Mental Health & Substance Use
      "parent_mhsu_can_mail_deliver_meds",
      "parent_mhsu_cost_coverage",
      "parent_mhsu_rides",
      "parent_mhsu_substance_use"
    )

    parent_ids |>
      walk(~ updateCheckboxInput(session, .x, value = FALSE))

    selected_row(NULL)
    updateActionButton(session, "view_site", label = "Select a Site")
  })

  observe({
    if (is.null(selected_row())) {
      shinyjs::disable("view_site")
    } else {
      shinyjs::enable("view_site")
    }
  })
}

shinyApp(ui = ui, server = server)