# Server logic for Juntos Referral Database

build_server <- function(all_service_cols) {
  function(input, output, session) {

    # Show welcome modal on startup
    showModal(build_welcome_modal())

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

    # REACTIVE: Filter count (with translation)
    output$filter_count <- renderText({
      lang <- input$language %||% "en"
      count <- count_active_filters(input, all_service_cols)
      if (count == 0) {
        t_ui("no_filters", lang)
      } else {
        paste(count, t_ui("filters_active", lang))
      }
    })

    # REACTIVE: Site count (with translation)
    output$site_count <- renderText({
      lang <- input$language %||% "en"
      paste(nrow(filtered_data()), t_ui("sites", lang))
    })

    # Render table using configuration
    output$sites_table <- renderReactable({
      create_sites_reactable(table_data())
    })

    # Handle table row selection - open modal directly
    observeEvent(getReactableState("sites_table", "selected"), {
      row_index <- getReactableState("sites_table", "selected")

      if (length(row_index) > 0) {
        site_name <- table_data()$`Site Name`[row_index]
        selected_row(site_name)

        # Open modal directly when row is selected
        site_data <- filtered_data() |>
          filter(site_name == selected_row()) |>
          slice(1)

        if (nrow(site_data) > 0) {
          showModal(build_site_modal(site_data, all_service_cols))
        }
      } else {
        selected_row(NULL)
      }
    })

    # Clear all filters
    observeEvent(input$clear_filters, {
      clear_all_filters(session, all_service_cols)
      selected_row(NULL)
    })
  }
}
