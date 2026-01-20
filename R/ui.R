# UI definition for Juntos Referral Database

build_ui <- function(all_service_cols) {
  tagList(
    # These go in the HTML <head>
    # JavaScript files handle bilingual translation and checkbox parent/child logic
    tags$head(
      tags$link(rel = "stylesheet", href = "custom.css"),
      tags$script(src = "translations.js"),
      tags$script(src = "checkbox_handlers.js")
    ),
    shinyjs::useShinyjs(),

    page_navbar(
      title = div(
        class = "navbar-brand-wrapper d-flex align-items-center",
        tags$img(
          src = "logos/logo.png",
          alt = "Juntos Health Services Logo",
          class = "navbar-logo"
        ),
        span(
          "Health Services Referral Database",
          class = "navbar-title-text"
        )
      ),
      theme = bs_theme(
        version = 5,
        bootswatch = "flatly",
        brand = TRUE,
        font_scale = 1.15
      ),

      sidebar = sidebar(
        id = "filter_sidebar",
        width = 350,
        position = "left",

        div(
          class = "mb-3 pb-3 border-bottom",
          h4("Filter Services", class = "mb-2", `data-i18n` = "filter_services"),
          div(
            class = "d-flex justify-content-between text-muted small",
            div(
              icon("filter"),
              textOutput("filter_count", inline = TRUE)
            ),
            div(
              icon("location-dot"),
              textOutput("site_count", inline = TRUE)
            )
          )
        ),

        actionButton(
          "clear_filters",
          "Clear All Filters",
          class = "btn-outline-secondary btn-sm w-100 mb-3",
          icon = icon("xmark")
        ),

        # Service filter accordion panels
        # Dynamically created based on checkbox_hierarchy config
        accordion(
          id = "service_accordion",
          multiple = TRUE,
          open = FALSE,
          create_all_accordions(all_service_cols)
        )
      ),

      nav_panel(
        title = "",

        div(
          class = "d-flex justify-content-between align-items-center mb-1",
          # style = "height: 100px;",
          # tags$img(
          #   src = "logos/juntos.png",
          #   alt = "Juntos Health Services",
          #   class = "content-logo",
          #   height = "150px"
          # ),
          div(
            class = "referral-text",
            h4("Health Services Referral Database")
          ),

          # Right side: language toggle + Select a Site button
          div(
            class = "d-flex align-items-center gap-3",

            # Language toggle
            # Handled by JavaScript (translations.js) - does not trigger Shiny reactives
            div(
              class = "btn-group lang-toggle",
              role = "group",
              `aria-label` = "Language selection",
              tags$button(
                type = "button",
                id = "app_lang_en",
                class = "btn btn-outline-secondary btn-sm active",
                onclick = "setLanguage('en')",
                "English"
              ),
              tags$button(
                type = "button",
                id = "app_lang_es",
                class = "btn btn-outline-secondary btn-sm",
                onclick = "setLanguage('es')",
                "Español"
              )
            ),

            # Select a Site button (placeholder, always disabled)
            # Actual site selection happens by clicking table rows
            tags$button(
              type = "button",
              class = "btn btn-primary disabled",
              disabled = "disabled",
              `data-i18n` = "select_site",
              icon("info-circle"),
              "Select a Site"
            )
          )
        ),

        reactableOutput("sites_table")
      ),

      # footer = div(
      #   class = "text-center py-3 the-footer",
      #   "Health Services Referral Database"
      # )
    )
  )
}
