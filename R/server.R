# Server logic for Juntos Referral Database

build_server <- function(all_service_cols) {
  function(input, output, session) {

    # Show welcome modal on startup
    showModal(build_welcome_modal())

    selected_row <- reactiveVal(NULL)

    # REACTIVE: Filtered data based on checkbox selections
    # Returns list with one element per category, each containing selected column names
    filtered_data <- reactive({
      selected <- get_selected_services(input, all_service_cols)
      # Apply filters sequentially by category (AND logic across categories)
      juntos_reduced |> apply_service_filters(selected)
    })

    # REACTIVE: Table data prepared for display
    # Subset to display columns and sort by service count
    table_data <- reactive({
      prepare_table_data(filtered_data())
    })

    # REACTIVE: Filter count (with translation)
    # Uses %||% to default to "en" if input$language is NULL (on first load)
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
    # Re-renders when language changes to update column headers
    output$sites_table <- renderReactable({
      lang <- input$language %||% "en"
      create_sites_reactable(table_data(), lang)
    })

    # Handle table row selection - open modal directly
    observeEvent(getReactableState("sites_table", "selected"), {
      row_index <- getReactableState("sites_table", "selected")

      if (length(row_index) > 0) {
        # Extract site name from display table (not filtered_data, which has raw column names)
        site_name <- table_data()$`Site Name`[row_index]
        selected_row(site_name)

        # Open modal directly when row is selected
        # Use filtered_data() to get full site details with all service columns
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
