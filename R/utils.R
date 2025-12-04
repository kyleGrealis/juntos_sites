# Utility functions for Juntos app

# Helper function to create human-readable labels from column names
# Removes category prefix and converts underscores to spaces with title case
format_service_label <- function(col_name) {
  col_name |>
    str_remove("^(prep|pep|hiv|mhsu|sti)_") |>
    str_replace_all("_", " ") |>
    str_to_title()
}

# Get all parent checkbox IDs from hierarchy (for clearing filters)
# Includes both group parent checkboxes and "select all" checkboxes
get_all_parent_ids <- function() {
  parent_ids <- c()
  for (category_id in names(checkbox_hierarchy)) {
    hierarchy <- checkbox_hierarchy[[category_id]]
    for (item in hierarchy$items) {
      # Group checkboxes like "prep_cost_coverage" (parent of child checkboxes)
      if (item$type == "group") {
        parent_ids <- c(parent_ids, item$id)
      }
    }
    # Also add the "select all" checkbox for each category
    parent_ids <- c(parent_ids, paste0("select_all_", category_id))
  }
  parent_ids
}

# Clear all filters
clear_all_filters <- function(session, all_service_cols) {
  # Clear all service checkboxes
  for (col in all_service_cols) {
    updateCheckboxInput(session, paste0("service_", col), value = FALSE)
  }

  # Clear all parent/group checkboxes
  for (parent_id in get_all_parent_ids()) {
    updateCheckboxInput(session, parent_id, value = FALSE)
  }
}
