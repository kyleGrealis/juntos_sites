# UI helper functions for building accordion panels and checkboxes

# Create accordion panel with service checkboxes (in correct order)
# Returns NULL if no services in category are available in the data
create_service_accordion <- function(category_id, category_config, all_columns) {
  hierarchy <- checkbox_hierarchy[[category_id]]
  if (is.null(hierarchy)) return(NULL)

  # Get available columns from data
  # Only include checkboxes for columns that exist in juntos_data
  category_cols <- get_category_column_ids(hierarchy$items)
  available_cols <- category_cols[category_cols %in% all_columns]

  if (length(available_cols) == 0) return(NULL)

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

  # Iterate through items in order
  # Two checkbox types: "simple" (standalone) and "group" (parent with children)
  for (item in hierarchy$items) {
    if (item$type == "simple") {
      # Simple checkbox (e.g., "Telehealth")
      if (item$id %in% available_cols) {
        checkbox_id <- paste0("service_", item$id)
        checkboxes <- append(
          checkboxes,
          list(
            checkboxInput(
              inputId = checkbox_id,
              label = item$label,
              value = FALSE
            )
          )
        )
      }
    } else if (item$type == "group") {
      # Group with parent + children (e.g., "Cost coverage options")
      # Only show group if at least one child exists in data
      available_children <- item$children[
        sapply(item$children, function(c) c$id %in% available_cols)
      ]

      if (length(available_children) > 0) {
        # Parent checkbox (clicking this updates children via JS)
        parent_checkbox <- checkboxInput(
          inputId = item$id,
          label = item$label,
          value = FALSE
        )
        checkboxes <- append(checkboxes, list(parent_checkbox))

        # Child checkboxes (indented)
        for (child in available_children) {
          child_checkbox <- div(
            style = "margin-left: 20px;",
            checkboxInput(
              inputId = paste0("service_", child$id),
              label = child$label,
              value = FALSE
            )
          )
          checkboxes <- append(checkboxes, list(child_checkbox))
        }
      }
    }
  }

  # Title with colored badge
  badge_style <- glue(
    "display: inline-block; width: 8px; height: 8px; ",
    "border-radius: 50%; background-color: {category_config$color}; ",
    "margin-right: 8px;"
  )

  title_with_color <- div(
    span(style = badge_style),
    category_config$label
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
  accordion_list <- list()

  for (category_id in names(service_categories)) {
    category_config <- service_categories[[category_id]]
    panel <- create_service_accordion(category_id, category_config, all_columns)
    if (!is.null(panel)) {
      accordion_list <- append(accordion_list, list(panel))
    }
  }

  accordion_list
}

# Count active filters
# Only counts actual service checkboxes, not parent/group checkboxes
count_active_filters <- function(input, all_service_cols) {
  count <- 0
  for (col in all_service_cols) {
    input_id <- paste0("service_", col)
    if (isTRUE(input[[input_id]])) {
      count <- count + 1
    }
  }
  count
}

# Get selected services organized by category
# Returns a named list where each element is a character vector of selected column IDs
get_selected_services <- function(input, all_service_cols) {
  result <- list()

  for (category_id in names(service_categories)) {
    hierarchy <- checkbox_hierarchy[[category_id]]
    if (is.null(hierarchy)) next

    # Get all possible column IDs for this category
    category_cols <- get_category_column_ids(hierarchy$items)
    selected <- c()

    # Check which checkboxes are actually selected
    for (col in category_cols) {
      input_id <- paste0("service_", col)
      if (isTRUE(input[[input_id]])) {
        selected <- c(selected, col)
      }
    }

    result[[category_id]] <- selected
  }

  result
}
