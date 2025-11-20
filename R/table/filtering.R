# Filtering functions for service checkboxes
# 

# Filter by PrEP services
filter_by_prep <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by PEP services
filter_by_pep <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by HIV Treatment services
filter_by_hiv_treatment <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by HIV/STI Testing services
filter_by_testing <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by Mental Health & Substance Use services
filter_by_mhsu <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by Social Services
filter_by_social_services <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Filter by Additional Services
filter_by_additional_services <- function(data, selected_checkboxes) {
  if (length(selected_checkboxes) == 0) return(data)
  data |> 
    filter(if_any(all_of(selected_checkboxes), ~ .x == 1))
}

# Main filtering function: apply all category filters in sequence
apply_service_filters <- function(
  data, 
  prep_selected, pep_selected, hiv_selected,
  testing_selected, mhsu_selected, social_selected,
  additional_selected
) {
  data |>
    filter_by_prep(prep_selected) |>
    filter_by_pep(pep_selected) |>
    filter_by_hiv_treatment(hiv_selected) |>
    filter_by_testing(testing_selected) |>
    filter_by_mhsu(mhsu_selected) |>
    filter_by_social_services(social_selected) |>
    filter_by_additional_services(additional_selected)
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
