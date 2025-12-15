# Modal builders for Juntos app

#' Build Welcome Modal
#'
#' Creates a startup modal that introduces users to the app and provides
#' basic usage instructions. Language toggle is controlled via JavaScript.
#'
#' @return A modalDialog object to be shown with showModal()
build_welcome_modal <- function() {
  modalDialog(
    title = NULL,
    size = 'l',
    easyClose = TRUE,
    footer = div(
      class = "d-flex justify-content-between align-items-center w-100",

      # Language toggle (left side)
      div(
        class = "btn-group lang-toggle",
        role = "group",
        `aria-label` = "Language selection",
        tags$button(
          type = "button",
          id = "lang_en",
          class = "btn btn-outline-secondary btn-sm active",
          onclick = "setLanguage('en')",
          "English"
        ),
        tags$button(
          type = "button",
          id = "lang_es",
          class = "btn btn-outline-secondary btn-sm",
          onclick = "setLanguage('es')",
          "Español"
        ),
        tags$button(
          type = "button",
          id = "lang_ht",
          class = "btn btn-outline-secondary btn-sm",
          onclick = "setLanguage('ht')",
          "Kreyòl"
        )
      ),

      # Get Started button (right side)
      tags$button(
        type = 'button',
        class = 'btn btn-primary modal-close-button',
        `data-bs-dismiss` = 'modal',
        `data-i18n` = 'get_started',
        'Get Started'
      )
    ),

    div(
      class = 'modal-container-wrapper',

      # Welcome header
      div(
        class = 'modal-header-block',
        div(
          class = 'modal-content-block text-center',
          h3(
            class = 'modal-site-name',
            `data-i18n` = 'welcome_title',
            'Welcome to the Health Services Referral Database'
          ),
          p(
            class = 'modal-organization',
            `data-i18n` = 'welcome_subtitle',
            'Find Health Services in Your Area'
          )
        )
      ),

      # About section
      div(
        class = 'mt-3',
        h5(
          class = 'modal-services-header',
          `data-i18n` = 'about_header',
          'About This Database'
        ),
        p(
          class = 'modal-site-info',
          `data-i18n` = 'about_text',
          'This database helps you find healthcare sites offering HIV prevention,
          treatment, and related health services. Search and filter sites to find
          the services you need.'
        )
      ),

      # How to use section
      div(
        class = 'mt-3',
        h5(
          class = 'modal-services-header',
          `data-i18n` = 'how_to_use',
          'How to Use'
        ),
        tags$ul(
          class = 'modal-service-list',
          tags$li(`data-i18n` = 'how_to_1', 'Use the sidebar filters to select services you need'),
          tags$li(`data-i18n` = 'how_to_2', 'Click on any row in the table to view detailed site information'),
          tags$li(`data-i18n` = 'how_to_3', 'Use the "Clear All Filters" button to reset your selection')
        )
      )
    )
  )
}

# Modal builder for site details

build_site_modal <- function(site_data, all_service_cols) {

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

  show_footnote <- FALSE
  service_sections <- list()

  # Loop through each category
  for (category_id in names(service_categories)) {
    category <- service_categories[[category_id]]
    hierarchy <- checkbox_hierarchy[[category_id]]

    if (is.null(hierarchy)) next

    # Collect services offered in this category (labels and IDs for translation)
    all_services <- c()
    all_service_ids <- c()

    for (item in hierarchy$items) {
      if (item$type == "simple") {
        # Simple service - check if site offers it (value == 1)
        if (item$id %in% names(site_data) && site_data[[item$id]] == 1) {
          label <- item$label
          if (item$id %in% services_with_asterisk) {
            show_footnote <- TRUE
            label <- paste0(label, "*")
          }
          all_services <- c(all_services, label)
          all_service_ids <- c(all_service_ids, item$id)
        }
      } else if (item$type == "group") {
        # Group - show parent label if ANY child is offered
        # This displays "Cost coverage options" instead of listing all 3 child options
        has_any_child <- FALSE
        for (child in item$children) {
          if (child$id %in% names(site_data) && site_data[[child$id]] == 1) {
            has_any_child <- TRUE
            break
          }
        }
        if (has_any_child) {
          all_services <- c(all_services, item$label)
          all_service_ids <- c(all_service_ids, item$id)
        }
      }
    }

    if (length(all_services) == 0) next

    # Build list items for this category with data-i18n for translation
    # Each <li> has data-i18n attribute for JavaScript translation
    service_list_items <- lapply(seq_along(all_services), function(i) {
      service_id <- all_service_ids[[i]]
      tags$li(`data-i18n` = service_id, all_services[[i]])
    })

    # Create category section (3 columns on large screens)
    category_section <- div(
      class = "col-lg-4 col-md-6 mb-2",
      h5(
        class = "modal-category-header",
        `data-i18n-category` = category_id,
        category$label
      ),
      tags$ul(
        class = "modal-service-list",
        service_list_items
      )
    )

    service_sections <- append(service_sections, list(category_section))
  }

  # Build and return the modal dialog
  modalDialog(
    title = NULL,
    size = "xl",
    easyClose = TRUE,
    footer = tags$button(
      type = "button",
      class = "btn btn-secondary modal-close-button",
      `data-bs-dismiss` = "modal",
      `data-i18n` = "close",
      "Close"
    ),

    div(
      class = "modal-container-wrapper",

      # Header section with site info
      div(
        class = "modal-header-block",
        div(
          class = "modal-content-block",

          # Site name and organization
          div(
            class = "mb-2",
            h3(
              class = "modal-site-name",
              tags$a(
                href = site_data$website,
                target = "_blank",
                site_data$site_name
              )
            ),
            p(
              class = "modal-organization",
              site_data$org_name
            )
          ),

          # Address
          div(
            class = "mb-1",
            p(
              class = "modal-site-info",
              strong(`data-i18n` = "address", "Address: "),
              site_data$site_address
            )
          ),

          # Website
          div(
            class = "mb-0",
            p(
              class = "modal-site-info",
              strong(`data-i18n` = "website", "Website: "),
              tags$a(
                href = site_data$website,
                target = "_blank",
                site_data$website
              )
            )
          )
        )
      ),

      # Services header
      h4(
        class = "modal-services-header",
        `data-i18n` = "services_offered",
        "Services Offered"
      ),

      # Service sections in 3-column grid
      div(
        class = "row",
        service_sections
      ),

      # Footnote if any services have asterisks
      if (show_footnote) {
        div(
          class = "mt-3",
          p(
            class = "modal-footnote",
            `data-i18n` = "contact_footnote",
            "* Contact site for more information"
          )
        )
      }
    )
  )
}
