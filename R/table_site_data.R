# Load and prepare site data with service counts

# Load raw data
juntos_data <- read_excel('data/Juntos_data_english.xlsx') |>
  clean_names()

# Helper to count services in a category
count_category_services <- function(data, category_items) {
  cols <- get_category_column_ids(category_items)
  rowSums(
    across(any_of(cols), ~ replace_na(.x, 0))
  )
}

# Calculate service counts for each category using the checkbox hierarchy
juntos_with_counts <- juntos_data |>
  mutate(
    prep_count = count_category_services(
      .data,
      checkbox_hierarchy$prep$items
    ),
    pep_count = count_category_services(
      .data,
      checkbox_hierarchy$pep$items
    ),
    hiv_treatment_count = count_category_services(
      .data,
      checkbox_hierarchy$hiv_treatment$items
    ),
    testing_count = count_category_services(
      .data,
      checkbox_hierarchy$testing$items
    ),
    mhsu_count = count_category_services(
      .data,
      checkbox_hierarchy$mhsu$items
    ),
    social_count = count_category_services(
      .data,
      checkbox_hierarchy$social_services$items
    ),
    additional_count = count_category_services(
      .data,
      checkbox_hierarchy$additional$items
    ),
    total_services = prep_count + pep_count + hiv_treatment_count +
      testing_count + mhsu_count + social_count + additional_count
  )

# Keep all columns for filtering
juntos_reduced <- juntos_with_counts
