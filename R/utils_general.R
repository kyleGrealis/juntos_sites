# Utility functions for Juntos app

# Helper function to create human-readable labels from column names
format_service_label <- function(col_name) {
  col_name |>
    str_remove("^(prep|pep|hiv|mhsu|sti)_") |>
    str_replace_all("_", " ") |>
    str_to_title()
}
