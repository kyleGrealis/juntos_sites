# Load and prepare site data with service counts

# Load raw data
juntos_data <- read_excel('data/Juntos_data_english.xlsx') |>
  clean_names()

# names(juntos_data)
# nrow(juntos_data)  # 61

# Calculate service counts for each category
# Note: service_definitions are loaded automatically from config_service_definitions.R
# These are just lists of "simple" or "grouped".
#   - Simple: a standalone service with no subgroups from original site
#   - Grouped: grouped checkboxes with a parent checkbox and child checkbox(es)

# Add up simple services + grouped services for each category
juntos_with_counts <- juntos_data |>
  mutate(
    # PrEP services count
    prep_count = rowSums(
        across(all_of(prep_services$simple), ~ replace_na(.x, 0))
      ) + 
        rowSums(
          across(all_of(unlist(prep_services$grouped)), ~ replace_na(.x, 0))
        ),

    # PEP services count
    pep_count = rowSums(
        across(all_of(pep_services$simple), ~ replace_na(.x, 0))
      ) + 
        rowSums(
          across(all_of(unlist(pep_services$grouped)), ~ replace_na(.x, 0))
        ),

    # HIV Treatment services count
    hiv_treatment_count = rowSums(
        across(all_of(hiv_treatment_services$simple), ~ replace_na(.x, 0))
      ) +
        rowSums(
          across(all_of(unlist(hiv_treatment_services$grouped)), ~ replace_na(.x, 0))
        ),

    # HIV/STI Testing services count (no grouped services)
    testing_count = rowSums(
      across(all_of(testing_services$simple), ~ replace_na(.x, 0))
    ),

    # Mental Health & Substance Use services count
    mhsu_count = rowSums(
        across(all_of(mhsu_services$simple), ~ replace_na(.x, 0))
      ) +
        rowSums(
          across(all_of(unlist(mhsu_services$grouped)), ~ replace_na(.x, 0))
        ),

    # Social Services count (no grouped services)
    social_count = rowSums(
        across(all_of(social_services$simple), ~ replace_na(.x, 0))
      ),

    # Additional Services count (no grouped services)
    additional_count = rowSums(
        across(all_of(additional_services$simple), ~ replace_na(.x, 0))
      ),

    # Total services across all categories
    total_services = prep_count + pep_count + hiv_treatment_count + testing_count +
      mhsu_count + social_count + additional_count
  )

# names(juntos_with_counts)
# nrow(juntos_with_counts)  # 61

# Create dataset for display: keep ALL columns for filtering
# Don't drop individual service columns - filtering needs them!
juntos_reduced <- juntos_with_counts

# view(juntos_reduced)
