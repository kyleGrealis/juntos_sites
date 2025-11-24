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

  # Track if we need to show footnote
  show_footnote <- FALSE

  # Build service sections for each category
  service_sections <- list()

  # Get category IDs from service_categories
  category_ids <- names(service_categories)

  # Loop through each category
  for (i in seq_along(category_ids)) {
    category_id <- category_ids[i]
    category <- service_categories[[category_id]]

    # Get hierarchy for this category
    hierarchy <- checkbox_hierarchy[[category_id]]

    # Skip if no hierarchy
    if (is.null(hierarchy)) {
      next
    }

    # Collect services offered in this category
    all_services <- c()

    # Process simple services
    simple_col_names <- names(hierarchy$simple)
    for (col_name in simple_col_names) {
      # Check if site offers this service
      if (col_name %in% names(site_data) && site_data[[col_name]] == 1) {
        label <- hierarchy$simple[[col_name]]

        # Add asterisk if needed
        if (col_name %in% services_with_asterisk) {
          show_footnote <- TRUE
          label <- paste0(label, "*")
        }

        all_services <- c(all_services, label)
      }
    }

    # Process grouped services (show parent label if ANY child is offered)
    groups <- hierarchy$groups
    for (group in groups) {
      # Get child column names
      child_cols <- names(group$children)

      # Check if ANY child in this group is offered
      has_any_child <- FALSE
      for (child_col in child_cols) {
        if (child_col %in% names(site_data) && site_data[[child_col]] == 1) {
          has_any_child <- TRUE
          break
        }
      }

      # If any child is offered, add the parent label
      if (has_any_child) {
        all_services <- c(all_services, group$parent$label)
      }
    }

    # Skip category if no services
    if (length(all_services) == 0) {
      next
    }

    # Build list items for this category
    service_list_items <- list()
    for (service in all_services) {
      service_list_items <- append(service_list_items, list(tags$li(service)))
    }

    # Create category section (in a column - 3 columns on large screens)
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

    # Add to service sections
    service_sections <- append(service_sections, list(category_section))
  }

  # Return the modal dialog
  modalDialog(
    title = NULL,
    size = "xl",  # Extra large for 3 columns
    easyClose = TRUE,
    footer = tags$button(
      type = "button",
      class = "btn btn-secondary modal-close-button",
      `data-bs-dismiss` = "modal",
      "Close"
    ),

    div(
      class = "modal-container-wrapper",

      # Header section with gray background (site info only)
      div(
        class = "modal-header-block",

        # Content block - centered but left-aligned within
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

      # Services header (outside gray box)
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
