# Create accordion panel with service checkboxes
create_service_accordion <- function(category_id, category_config, all_columns) {

  # Get the checkbox hierarchy for this category (has beautiful labels!)
  hierarchy <- CHECKBOX_HIERARCHY[[category_id]]

  if (is.null(hierarchy)) {
    return(NULL)
  }

  # Get available columns from config that exist in data
  available_cols <- category_config$columns |>
    keep(~ .x %in% all_columns)

  # Build checkboxes list
  checkboxes <- list()

  # Add "Select All" checkbox at the top
  select_all_id <- paste0("select_all_", category_id)
  checkboxes <- append(
    checkboxes,
    list(
      div(
        class = "mb-2 pb-2 border-bottom",
        checkboxInput(
          inputId = select_all_id,
          label = strong("Select All"),
          value = FALSE
        )
      )
    )
  )

  # Add simple checkboxes (with beautiful labels from CHECKBOX_HIERARCHY!)
  for (col_name in names(hierarchy$simple)) {
    if (col_name %in% available_cols) {
      checkbox_id <- paste0("service_", col_name)
      label <- hierarchy$simple[[col_name]]  # Use the beautiful label!
      checkboxes <- append(
        checkboxes,
        list(checkboxInput(
          inputId = checkbox_id,
          label = label,
          value = FALSE
        ))
      )
    }
  }

  # Add grouped checkboxes (parent-child) with beautiful labels
  for (group in hierarchy$groups) {
    parent_info <- group$parent
    child_labels <- group$children
    child_cols <- names(child_labels)

    # Only create group if at least one child exists in data
    available_children <- child_cols |>
      keep(~ .x %in% available_cols)

    if (length(available_children) > 0) {

      # Create parent checkbox with beautiful label
      parent_id <- parent_info$id
      parent_label <- parent_info$label

      parent_checkbox <- checkboxInput(
        inputId = parent_id,
        label = parent_label,
        value = FALSE
      )

      # Create child checkboxes with indentation and beautiful labels
      child_checkboxes <- list()
      for (child_col in available_children) {
        child_id <- paste0("service_", child_col)
        child_label <- child_labels[[child_col]]  # Use the beautiful label!

        child_checkboxes <- append(
          child_checkboxes,
          list(div(
            style = "margin-left: 20px;",
            checkboxInput(
              inputId = child_id,
              label = child_label,
              value = FALSE
            )
          ))
        )
      }

      # Add parent and children to main checkboxes list
      checkboxes <- append(checkboxes, list(parent_checkbox))
      checkboxes <- append(checkboxes, child_checkboxes)
    }
  }

  # Count available checkboxes
  checkbox_count <- length(available_cols)

  # Add colored badge and count to title
  title_with_color <- div(
    span(
      style = glue("display: inline-block; width: 8px; height: 8px; border-radius: 50%; background-color: {category_config$color}; margin-right: 8px;")
    ),
    glue("{category_config$label} ({checkbox_count})")
  )

  accordion_panel(
    title = title_with_color,
    icon = NULL,
    value = category_id,
    checkboxes
  )
}

# Create all accordion panels
create_all_accordions <- function(all_columns) {
  SERVICE_CATEGORIES |>
    imap(~ create_service_accordion(.y, .x, all_columns))
}

# Count active filters
count_active_filters <- function(input, all_service_cols) {
  all_service_cols |>
    map_chr(~ paste0("service_", .x)) |>
    map_lgl(~ isTRUE(input[[.x]])) |>
    sum()
}

# Get selected services organized by category
get_selected_services <- function(input, all_service_cols) {
  SERVICE_CATEGORIES |>
    imap(function(category, category_id) {
      selected <- category$columns |>
        keep(~ {
          input_id <- paste0("service_", .x)
          isTRUE(input[[input_id]])
        })
      selected  # Return vector directly, no extra list wrapper!
    }) |>
    set_names(names(SERVICE_CATEGORIES))
}

# Create service badges for modal
create_service_badges <- function(site_data, all_service_cols) {
  SERVICE_CATEGORIES |>
    imap(function(category, category_id) {
      offered_services <- category$columns |>
        keep(~ {
          .x %in% all_service_cols &&
          .x %in% names(site_data) &&
          site_data[[.x]] == 1
        })

      if (length(offered_services) == 0) return(NULL)

      badges <- offered_services |>
        map(~ {
          tags$span(
            class = "badge me-1 mb-1",
            style = paste0("background-color: ", category$color, ";"),
            format_service_label(.x)
          )
        })

      div(
        class = "mb-3",
        h5(category$label),
        div(class = "d-flex flex-wrap", badges)
      )
    }) |>
    compact()
}
