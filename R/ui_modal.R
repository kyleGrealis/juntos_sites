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

    # Collect services offered in this category
    all_services <- c()

    for (item in hierarchy$items) {
      if (item$type == "simple") {
        # Simple service - check if site offers it
        if (item$id %in% names(site_data) && site_data[[item$id]] == 1) {
          label <- item$label
          if (item$id %in% services_with_asterisk) {
            show_footnote <- TRUE
            label <- paste0(label, "*")
          }
          all_services <- c(all_services, label)
        }
      } else if (item$type == "group") {
        # Group - show parent label if ANY child is offered
        has_any_child <- FALSE
        for (child in item$children) {
          if (child$id %in% names(site_data) && site_data[[child$id]] == 1) {
            has_any_child <- TRUE
            break
          }
        }
        if (has_any_child) {
          all_services <- c(all_services, item$label)
        }
      }
    }

    if (length(all_services) == 0) next

    # Build list items for this category
    service_list_items <- lapply(all_services, tags$li)

    # Create category section (3 columns on large screens)
    category_section <- div(
      class = "col-lg-4 col-md-6 mb-2",
      h5(
        class = "modal-category-header",
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
              strong("Address: "),
              site_data$site_address
            )
          ),

          # Website
          div(
            class = "mb-0",
            p(
              class = "modal-site-info",
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

      # Services header
      h4(
        class = "modal-services-header",
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
            "* Contact site for more information"
          )
        )
      }
    )
  )
}
