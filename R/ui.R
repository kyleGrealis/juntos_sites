# UI definition for Juntos Referral Database

build_ui <- function(all_service_cols) {
  page_navbar(
    title = "Juntos Referral Database",
    theme = bs_theme(
      version = 5,
      bootswatch = "cosmo",
      primary = "#0d6efd",
      base_font = font_google("Inter")
    ),

    header = tagList(
      shinyjs::useShinyjs(),
      tags$head(
        tags$link(rel = "stylesheet", href = "custom.css"),
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
      title = "",
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
}
