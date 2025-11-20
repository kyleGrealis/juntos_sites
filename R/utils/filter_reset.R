# Clear all filters logic

clear_all_filters <- function(session, all_service_cols) {
  # Clear all child checkboxes
  checkbox_ids <- all_service_cols |>
    map_chr(~ paste0("service_", .x))

  checkbox_ids |>
    walk(~ updateCheckboxInput(session, .x, value = FALSE))

  # Clear all parent checkboxes using centralized IDs
  parent_checkbox_ids |>
    walk(~ updateCheckboxInput(session, .x, value = FALSE))
}
