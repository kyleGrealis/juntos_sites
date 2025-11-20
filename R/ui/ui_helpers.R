# Create accordion panel with service checkboxes
create_service_accordion <- function(category_id, category_config, all_columns) {

  # Get the checkbox hierarchy for this category (has beautiful labels!)
  hierarchy <- checkbox_hierarchy[[category_id]]

  if (is.null(hierarchy)) {
    return(NULL)
  }

  # Get available columns from config that exist in data
  available_cols <- c()
  for (col in category_config$columns) {
    if (col %in% all_columns) {
      available_cols <- c(available_cols, col)
    }
  }

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

  # Add simple checkboxes (with beautiful labels from checkbox_hierarchy!)
  simple_col_names <- names(hierarchy$simple)
  for (col_name in simple_col_names) {
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
  groups <- hierarchy$groups
  for (group in groups) {
    parent_info <- group$parent
    child_labels <- group$children
    child_cols <- names(child_labels)

    # Only create group if at least one child exists in data
    available_children <- c()
    for (child_col in child_cols) {
      if (child_col %in% available_cols) {
        available_children <- c(available_children, child_col)
      }
    }

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
  accordion_list <- list()

  category_ids <- names(service_categories)
  for (category_id in category_ids) {
    category_config <- service_categories[[category_id]]
    accordion_panel <- create_service_accordion(category_id, category_config, all_columns)
    if (!is.null(accordion_panel)) {
      accordion_list <- append(accordion_list, list(accordion_panel))
    }
  }

  return(accordion_list)
}

# Count active filters
count_active_filters <- function(input, all_service_cols) {
  count <- 0

  for (col in all_service_cols) {
    input_id <- paste0("service_", col)
    if (isTRUE(input[[input_id]])) {
      count <- count + 1
    }
  }

  return(count)
}

# Get selected services organized by category
get_selected_services <- function(input, all_service_cols) {
  result <- list()

  category_ids <- names(service_categories)
  for (category_id in category_ids) {
    category <- service_categories[[category_id]]
    selected <- c()

    for (col in category$columns) {
      input_id <- paste0("service_", col)
      if (isTRUE(input[[input_id]])) {
        selected <- c(selected, col)
      }
    }

    result[[category_id]] <- selected
  }

  return(result)
}
