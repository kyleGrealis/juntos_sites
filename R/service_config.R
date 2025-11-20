SERVICE_CATEGORIES <- list(
  prep = list(
    label = "PrEP",
    color = "#0d6efd",  # Bootstrap primary blue
    columns = c(
      "pr_ep",
      "prep_can_mail_deliver_meds_always",
      "prep_can_mail_deliver_meds_sometimes",
      "prep_medication_at_no_cost",
      "prep_other_financial_assistance_available",
      "prep_visits_and_labs_at_no_cost",
      "prep_free_rides",
      "prep_subsidized_rides",
      "prep_sometimes_free_subsidized_rides",
      "prep_latino_lgbtq_providers_available",
      "prep_lgbtq_providers_available",
      "prep_injectable_pr_ep_available",
      "prep_pr_ep_on_demand_2_1_1_available",
      "prep_on_site_patient_navigators",
      "prep_services_available_nights_evenings",
      "prep_site_offers_rapid_pr_ep",
      "prep_spanish_speaking_providers",
      "prep_telehealth",
      "prep_walk_in_services"
    )
  ),

  pep = list(
    label = "PEP",
    color = "#6610f2",  # Bootstrap purple
    columns = c(
      "pep",
      "pep_can_mail_deliver_meds_always",
      "pep_can_mail_deliver_meds_sometimes",
      "pep_medication_at_no_cost",
      "pep_other_financial_assistance_available",
      "pep_visits_and_labs_at_no_cost",
      "pep_free_rides",
      "pep_sometimes_free_subsidized_rides",
      "pep_subsidized_rides",
      "pep_latino_lgbtq_providers_available",
      "pep_lgbtq_providers_available",
      "pep_on_site_patient_navigators",
      "pep_rapid_same_day_services",
      "pep_full_supply_available",
      "pep_starter_packs_available",
      "pep_services_available_nights_evenings",
      "pep_spanish_speaking_providers",
      "pep_telehealth",
      "pep_walk_in_services"
    )
  ),

  hiv_treatment = list(
    label = "HIV Treatment",
    color = "#d63384",  # Bootstrap pink
    columns = c(
      "hiv_treatment",
      "hiv_can_mail_deliver_meds_always",
      "hiv_can_mail_deliver_meds_sometimes",
      "hiv_medication_at_no_cost",
      "hiv_other_financial_assistance_available",
      "hiv_visits_and_labs_at_no_cost",
      "hiv_free_rides",
      "hiv_subsidized_rides",
      "hiv_sometimes_free_subsidized_rides",
      "hiv_injectable_art_available",
      "hiv_latino_lgbtq_providers_available",
      "hiv_lgbtq_providers_available",
      "hiv_on_site_patient_navigators",
      "hiv_on_site_ryan_white_patient_navigators",
      "hiv_rapid_hiv_treatment_available",
      "hiv_services_available_nights_evenings",
      "hiv_spanish_speaking_providers",
      "hiv_telehealth",
      "hiv_walk_in_services"
    )
  ),

  testing = list(
    label = "HIV/STI Testing",
    color = "#fd7e14",  # Bootstrap orange
    columns = c(
      "hiv_testing_confirmatory",
      "hiv_testing_rapid",
      "sti_testing",
      "sti_treatment"
    )
  ),

  mhsu = list(
    label = "Mental Health & Substance Use",
    color = "#198754",  # Bootstrap success green
    columns = c(
      "mhsu_can_mail_deliver_meds_always",
      "mhsu_can_mail_deliver_meds_sometimes",
      "mhsu_other_financial_assistance_available",
      "mhsu_treatment_is_available_at_no_cost",
      "mhsu_free_rides",
      "mhsu_subsidized_rides",
      "mhsu_sometimes_free_subsidized_rides",
      "mhsu_latino_lgbtq_providers_available",
      "mhsu_lgbtq_providers_available",
      "mhsu_mental_health_treatment",
      "mhsu_psychiatry_or_psychiatric_medication_management",
      "mhsu_services_available_nights_evenings",
      "mhsu_spanish_speaking_providers",
      "mhsu_substance_use_treatment",
      "mhsu_support_groups",
      "mhsu_telehealth",
      "mhsu_walk_in_services"
    )
  ),

  social_services = list(
    label = "Social Services",
    color = "#0dcaf0",  # Bootstrap info cyan
    columns = c(
      "housing_assistance",
      "immigration_assistance",
      "job_training_employment_assistance"
    )
  ),

  additional = list(
    label = "Additional Services",
    color = "#6c757d",  # Bootstrap secondary gray
    columns = c(
      "dental_care",
      "on_site_pharmacy",
      "primary_care",
      "free_validating_parking"
    )
  )
)

# Extract all service columns from configuration
all_service_cols <- SERVICE_CATEGORIES |>
  map("columns") |>
  reduce(c) |>
  unique()
