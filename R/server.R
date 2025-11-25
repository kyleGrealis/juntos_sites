# Server logic for Juntos Referral Database

build_server <- function(all_service_cols) {
  function(input, output, session) {

    selected_row <- reactiveVal(NULL)

    # REACTIVE: Filtered data based on checkbox selections
    filtered_data <- reactive({
      selected <- get_selected_services(input, all_service_cols)
      juntos_reduced |> apply_service_filters(selected)
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

    # Render table using configuration
    output$sites_table <- renderReactable({
      create_sites_reactable(table_data())
    })

    # Handle table row selection
    observeEvent(getReactableState("sites_table", "selected"), {
      row_index <- getReactableState("sites_table", "selected")

      if (length(row_index) > 0) {
        site_name <- table_data()$`Site Name`[row_index]
        selected_row(site_name)
        updateActionButton(session, "view_site", label = paste("View", site_name))
      } else {
        selected_row(NULL)
        updateActionButton(session, "view_site", label = "Select a Site")
      }
    })

    # Show site modal
    observeEvent(input$view_site, {
      req(selected_row())

      site_data <- filtered_data() |>
        filter(site_name == selected_row()) |>
        slice(1)

      if (nrow(site_data) == 0) return()

      showModal(build_site_modal(site_data, all_service_cols))
    })

    # Clear all filters
    observeEvent(input$clear_filters, {
      clear_all_filters(session, all_service_cols)
      selected_row(NULL)
      updateActionButton(session, "view_site", label = "Select a Site")
    })

    # Enable/disable view button
    observe({
      if (is.null(selected_row())) {
        shinyjs::disable("view_site")
      } else {
        shinyjs::enable("view_site")
      }
    })
  }
}
