# Filtering functions for service checkboxes

# Generic filter: keep rows where ANY of the selected columns equals 1
filter_by_services <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |>
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Apply all category filters in sequence
apply_service_filters <- function(data, selected_by_category) {
  for (selected in selected_by_category) {
    data <- filter_by_services(data, selected)
  }
  data
}

# Prepare filtered data for table display
prepare_table_data <- function(filtered_data) {
  filtered_data |>
    select(
      site_name,
      org_name,
      jurisdiction,
      site_address,
      total_services
    ) |>
    rename(
      `Site Name` = site_name,
      `Organization` = org_name,
      `Jurisdiction` = jurisdiction,
      `Address` = site_address,
      `Services` = total_services
    ) |>
    arrange(desc(`Services`), `Site Name`)
}

# Get full site details by name
get_site_details <- function(data, selected_site_name) {
  data |>
    filter(site_name == selected_site_name) |>
    slice(1)
}
