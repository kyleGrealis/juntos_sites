# Refer to services_grouped.txt for original site groupings
# Each category has simple checkboxes and grouped (parent-child) checkboxes
# The original site had these grouped checkboxes on the "View Filters" tab

# PrEP Services (services_grouped.txt lines 5-27)
prep_services <- list(
  simple = c(
    "pr_ep",
    "prep_latino_lgbtq_providers_available",
    "prep_lgbtq_providers_available",
    "prep_on_site_patient_navigators",
    "prep_services_available_nights_evenings",
    "prep_site_offers_rapid_pr_ep",
    "prep_spanish_speaking_providers",
    "prep_telehealth",
    "prep_walk_in_services"
  ),
  grouped = list(
    can_mail_deliver_meds = c(
      "prep_can_mail_deliver_meds_always",
      "prep_can_mail_deliver_meds_sometimes"
    ),
    cost_coverage = c(
      "prep_medication_at_no_cost",
      "prep_other_financial_assistance_available",
      "prep_visits_and_labs_at_no_cost"
    ),
    rides = c(
      "prep_free_rides",
      "prep_sometimes_free_subsidized_rides"
    ),
    new_delivery = c(
      "prep_injectable_pr_ep_available",
      "prep_pr_ep_on_demand_2_1_1_available"
    )
  )
)

# PEP Services (services_grouped.txt lines 29-50)
pep_services <- list(
  simple = c(
    "pep",
    "pep_latino_lgbtq_providers_available",
    "pep_lgbtq_providers_available",
    "pep_on_site_patient_navigators",
    "pep_services_available_nights_evenings",
    "pep_spanish_speaking_providers",
    "pep_telehealth",
    "pep_walk_in_services"
  ),
  grouped = list(
    can_mail_deliver_meds = c(
      "pep_can_mail_deliver_meds_always",
      "pep_can_mail_deliver_meds_sometimes"
    ),
    cost_coverage = c(
      "pep_medication_at_no_cost",
      "pep_other_financial_assistance_available",
      "pep_visits_and_labs_at_no_cost"
    ),
    rides = c(
      "pep_free_rides",
      "pep_sometimes_free_subsidized_rides"
    ),
    rapid_same_day = c(
      "pep_full_supply_available",
      "pep_starter_packs_available"
    )
  )
)

# HIV Treatment Services (services_grouped.txt lines 52-74)
hiv_treatment_services <- list(
  simple = c(
    "hiv_treatment",
    "hiv_injectable_art_available",
    "hiv_latino_lgbtq_providers_available",
    "hiv_lgbtq_providers_available",
    "hiv_rapid_hiv_treatment_available",
    "hiv_services_available_nights_evenings",
    "hiv_spanish_speaking_providers",
    "hiv_telehealth",
    "hiv_walk_in_services"
  ),
  grouped = list(
    can_mail_deliver_meds = c(
      "hiv_can_mail_deliver_meds_always",
      "hiv_can_mail_deliver_meds_sometimes"
    ),
    cost_coverage = c(
      "hiv_medication_at_no_cost",
      "hiv_other_financial_assistance_available",
      "hiv_visits_and_labs_at_no_cost"
    ),
    rides = c(
      "hiv_free_rides",
      "hiv_sometimes_free_subsidized_rides"
    ),
    on_site_navigators = c(
      "hiv_on_site_patient_navigators",
      "hiv_on_site_ryan_white_patient_navigators"
    )
  )
)

# HIV/STI Testing Services (services_grouped.txt lines 76-81)
testing_services <- list(
  simple = c(
    "hiv_testing_confirmatory",
    "hiv_testing_rapid",
    "sti_testing",
    "sti_treatment"
  ),
  grouped = list()
)

# Mental Health & Substance Use Services (services_grouped.txt lines 83-104)
mhsu_services <- list(
  simple = c(
    "mhsu_latino_lgbtq_providers_available",
    "mhsu_lgbtq_providers_available",
    "mhsu_mental_health_treatment",
    "mhsu_psychiatry_or_psychiatric_medication_management",
    "mhsu_services_available_nights_evenings",
    "mhsu_spanish_speaking_providers",
    "mhsu_telehealth",
    "mhsu_walk_in_services"
  ),
  grouped = list(
    can_mail_deliver_meds = c(
      "mhsu_can_mail_deliver_meds_always",
      "mhsu_can_mail_deliver_meds_sometimes"
    ),
    cost_coverage = c(
      "mhsu_treatment_is_available_at_no_cost",
      "mhsu_other_financial_assistance_available"
    ),
    rides = c(
      "mhsu_free_rides",
      "mhsu_sometimes_free_subsidized_rides"
    ),
    substance_use = c(
      "mhsu_substance_use_treatment",
      "mhsu_support_groups"
    )
  )
)

# Social Services (services_grouped.txt lines 106-110)
social_services <- list(
  simple = c(
    "housing_assistance",
    "immigration_assistance",
    "job_training_employment_assistance"
  ),
  grouped = list()
)

# Additional Health Care Services (services_grouped.txt lines 112-116)
additional_services <- list(
  simple = c(
    "dental_care",
    "on_site_pharmacy",
    "primary_care"
  ),
  grouped = list()
)

# Other Site Information (services_grouped.txt lines 118-126)
# Note: reputation columns don't exist in data yet - placeholders only
other_site_info <- list(
  simple = c(
    "free_validating_parking"
  ),
  grouped = list(
    site_reputation = c(
      "reputation_general_organization",
      "reputation_hiv_related_services",
      "reputation_services_latino_lgbtq",
      "reputation_services_lgbtq",
      "reputation_services_immigration_status"
    )
  )
)
