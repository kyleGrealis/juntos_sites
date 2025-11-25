# Checkbox hierarchy for nested filtering UI
# Items are ordered exactly as they should appear in the UI
# Each item is either type="simple" or type="group"

checkbox_hierarchy <- list(
  prep = list(
    items = list(
      list(
        type = "simple",
        id = "pr_ep",
        label = "Offers PrEP"
      ),
      list(
        type = "group",
        id = "prep_can_mail_deliver_meds",
        label = "Can mail/deliver medications",
        children = list(
          list(
            id = "prep_can_mail_deliver_meds_always",
            label = "Always"
          ),
          list(
            id = "prep_can_mail_deliver_meds_sometimes",
            label = "Sometimes"
          )
        )
      ),
      list(
        type = "group",
        id = "prep_cost_coverage",
        label = "Cost coverage options",
        children = list(
          list(
            id = "prep_medication_at_no_cost",
            label = "Medication at no cost"
          ),
          list(
            id = "prep_other_financial_assistance_available",
            label = "Other financial assistance available"
          ),
          list(
            id = "prep_visits_and_labs_at_no_cost",
            label = "Visits and labs at no cost"
          )
        )
      ),
      list(
        type = "group",
        id = "prep_rides",
        label = "Free or subsidized rides",
        children = list(
          list(
            id = "prep_free_rides",
            label = "Free rides"
          ),
          list(
            id = "prep_sometimes_free_subsidized_rides",
            label = "Sometimes free/subsidized rides"
          )
        )
      ),
      list(
        type = "simple",
        id = "prep_latino_lgbtq_providers_available",
        label = "Latino LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "prep_lgbtq_providers_available",
        label = "LGBTQ+ providers available"
      ),
      list(
        type = "group",
        id = "prep_new_delivery",
        label = "New delivery options",
        children = list(
          list(
            id = "prep_injectable_pr_ep_available",
            label = "Injectable PrEP available"
          ),
          list(
            id = "prep_pr_ep_on_demand_2_1_1_available",
            label = "PrEP on-demand (2-1-1) available"
          )
        )
      ),
      list(
        type = "simple",
        id = "prep_on_site_patient_navigators",
        label = "On-site patient navigators"
      ),
      list(
        type = "simple",
        id = "prep_services_available_nights_evenings",
        label = "Services available nights/evenings"
      ),
      list(
        type = "simple",
        id = "prep_site_offers_rapid_pr_ep",
        label = "Site offers rapid PrEP"
      ),
      list(
        type = "simple",
        id = "prep_spanish_speaking_providers",
        label = "Spanish-speaking providers"
      ),
      list(
        type = "simple",
        id = "prep_telehealth",
        label = "Telehealth"
      ),
      list(
        type = "simple",
        id = "prep_walk_in_services",
        label = "Walk-in services"
      )
    )
  ),

  pep = list(
    items = list(
      list(
        type = "simple",
        id = "pep",
        label = "Offers PEP"
      ),
      list(
        type = "group",
        id = "pep_can_mail_deliver_meds",
        label = "Can mail/deliver medications",
        children = list(
          list(
            id = "pep_can_mail_deliver_meds_always",
            label = "Always"
          ),
          list(
            id = "pep_can_mail_deliver_meds_sometimes",
            label = "Sometimes"
          )
        )
      ),
      list(
        type = "group",
        id = "pep_cost_coverage",
        label = "Cost coverage options",
        children = list(
          list(
            id = "pep_medication_at_no_cost",
            label = "Medication at no cost"
          ),
          list(
            id = "pep_other_financial_assistance_available",
            label = "Other financial assistance available"
          ),
          list(
            id = "pep_visits_and_labs_at_no_cost",
            label = "Visits and labs at no cost"
          )
        )
      ),
      list(
        type = "group",
        id = "pep_rides",
        label = "Free or subsidized rides",
        children = list(
          list(
            id = "pep_free_rides",
            label = "Free rides"
          ),
          list(
            id = "pep_sometimes_free_subsidized_rides",
            label = "Sometimes free/subsidized rides"
          )
        )
      ),
      list(
        type = "simple",
        id = "pep_latino_lgbtq_providers_available",
        label = "Latino LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "pep_lgbtq_providers_available",
        label = "LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "pep_on_site_patient_navigators",
        label = "On-site patient navigators"
      ),
      list(
        type = "group",
        id = "pep_rapid_same_day",
        label = "Rapid or same-day services",
        children = list(
          list(
            id = "pep_full_supply_available",
            label = "Full supply available"
          ),
          list(
            id = "pep_starter_packs_available",
            label = "Starter packs available"
          )
        )
      ),
      list(
        type = "simple",
        id = "pep_services_available_nights_evenings",
        label = "Services available nights/evenings"
      ),
      list(
        type = "simple",
        id = "pep_spanish_speaking_providers",
        label = "Spanish-speaking providers"
      ),
      list(
        type = "simple",
        id = "pep_telehealth",
        label = "Telehealth"
      ),
      list(
        type = "simple",
        id = "pep_walk_in_services",
        label = "Walk-in services"
      )
    )
  ),

  hiv_treatment = list(
    items = list(
      list(
        type = "simple",
        id = "hiv_treatment",
        label = "Offers HIV treatment"
      ),
      list(
        type = "group",
        id = "hiv_can_mail_deliver_meds",
        label = "Can mail/deliver medications",
        children = list(
          list(
            id = "hiv_can_mail_deliver_meds_always",
            label = "Always"
          ),
          list(
            id = "hiv_can_mail_deliver_meds_sometimes",
            label = "Sometimes"
          )
        )
      ),
      list(
        type = "group",
        id = "hiv_cost_coverage",
        label = "Cost coverage options",
        children = list(
          list(
            id = "hiv_medication_at_no_cost",
            label = "Medication at no cost"
          ),
          list(
            id = "hiv_other_financial_assistance_available",
            label = "Other financial assistance available"
          ),
          list(
            id = "hiv_visits_and_labs_at_no_cost",
            label = "Visits and labs at no cost"
          )
        )
      ),
      list(
        type = "group",
        id = "hiv_rides",
        label = "Free or subsidized rides",
        children = list(
          list(
            id = "hiv_free_rides",
            label = "Free rides"
          ),
          list(
            id = "hiv_sometimes_free_subsidized_rides",
            label = "Sometimes free/subsidized rides"
          )
        )
      ),
      list(
        type = "simple",
        id = "hiv_injectable_art_available",
        label = "Injectable ART available"
      ),
      list(
        type = "simple",
        id = "hiv_latino_lgbtq_providers_available",
        label = "Latino LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "hiv_lgbtq_providers_available",
        label = "LGBTQ+ providers available"
      ),
      list(
        type = "group",
        id = "hiv_patient_navigators",
        label = "On-site patient navigators",
        children = list(
          list(
            id = "hiv_on_site_patient_navigators",
            label = "Patient navigators"
          ),
          list(
            id = "hiv_on_site_ryan_white_patient_navigators",
            label = "Ryan White case managers"
          )
        )
      ),
      list(
        type = "simple",
        id = "hiv_rapid_hiv_treatment_available",
        label = "Rapid HIV treatment available"
      ),
      list(
        type = "simple",
        id = "hiv_services_available_nights_evenings",
        label = "Services available nights/evenings"
      ),
      list(
        type = "simple",
        id = "hiv_spanish_speaking_providers",
        label = "Spanish-speaking providers"
      ),
      list(
        type = "simple",
        id = "hiv_telehealth",
        label = "Telehealth"
      ),
      list(
        type = "simple",
        id = "hiv_walk_in_services",
        label = "Walk-in services"
      )
    )
  ),

  testing = list(
    items = list(
      list(
        type = "simple",
        id = "hiv_testing_confirmatory",
        label = "HIV testing (confirmatory)"
      ),
      list(
        type = "simple",
        id = "hiv_testing_rapid",
        label = "HIV testing (rapid)"
      ),
      list(
        type = "simple",
        id = "sti_testing",
        label = "STI testing"
      ),
      list(
        type = "simple",
        id = "sti_treatment",
        label = "STI treatment"
      )
    )
  ),

  mhsu = list(
    items = list(
      list(
        type = "group",
        id = "mhsu_can_mail_deliver_meds",
        label = "Can mail/deliver medications",
        children = list(
          list(
            id = "mhsu_can_mail_deliver_meds_always",
            label = "Always"
          ),
          list(
            id = "mhsu_can_mail_deliver_meds_sometimes",
            label = "Sometimes"
          )
        )
      ),
      list(
        type = "group",
        id = "mhsu_cost_coverage",
        label = "Cost coverage options",
        children = list(
          list(
            id = "mhsu_treatment_is_available_at_no_cost",
            label = "Treatment available at no cost"
          ),
          list(
            id = "mhsu_other_financial_assistance_available",
            label = "Other financial assistance available"
          )
        )
      ),
      list(
        type = "group",
        id = "mhsu_rides",
        label = "Free or subsidized rides",
        children = list(
          list(
            id = "mhsu_free_rides",
            label = "Free rides"
          ),
          list(
            id = "mhsu_sometimes_free_subsidized_rides",
            label = "Sometimes free/subsidized rides"
          )
        )
      ),
      list(
        type = "simple",
        id = "mhsu_latino_lgbtq_providers_available",
        label = "Latino LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "mhsu_lgbtq_providers_available",
        label = "LGBTQ+ providers available"
      ),
      list(
        type = "simple",
        id = "mhsu_mental_health_treatment",
        label = "Mental health treatment"
      ),
      list(
        type = "simple",
        id = "mhsu_psychiatry_or_psychiatric_medication_management",
        label = "Psychiatry/medication management"
      ),
      list(
        type = "simple",
        id = "mhsu_services_available_nights_evenings",
        label = "Services available nights/evenings"
      ),
      list(
        type = "simple",
        id = "mhsu_spanish_speaking_providers",
        label = "Spanish-speaking providers"
      ),
      list(
        type = "group",
        id = "mhsu_substance_use",
        label = "Substance use treatment",
        children = list(
          list(
            id = "mhsu_substance_use_treatment",
            label = "Substance use treatment"
          ),
          list(
            id = "mhsu_support_groups",
            label = "Support groups"
          )
        )
      ),
      list(
        type = "simple",
        id = "mhsu_telehealth",
        label = "Telehealth"
      ),
      list(
        type = "simple",
        id = "mhsu_walk_in_services",
        label = "Walk-in services"
      )
    )
  ),

  social_services = list(
    items = list(
      list(
        type = "simple",
        id = "housing_assistance",
        label = "Housing assistance"
      ),
      list(
        type = "simple",
        id = "immigration_assistance",
        label = "Immigration assistance"
      ),
      list(
        type = "simple",
        id = "job_training_employment_assistance",
        label = "Job training & employment assistance"
      )
    )
  ),

  additional = list(
    items = list(
      list(
        type = "simple",
        id = "dental_care",
        label = "Dental care"
      ),
      list(
        type = "simple",
        id = "on_site_pharmacy",
        label = "On-site pharmacy"
      ),
      list(
        type = "simple",
        id = "primary_care",
        label = "Primary care"
      ),
      list(
        type = "simple",
        id = "free_validating_parking",
        label = "Free/validated parking"
      )
    )
  )
)

# Helper: Extract all column IDs from hierarchy (for filtering)
get_all_column_ids <- function(hierarchy) {
  ids <- c()
  for (category in hierarchy) {
    for (item in category$items) {
      if (item$type == "simple") {
        ids <- c(ids, item$id)
      } else if (item$type == "group") {
        for (child in item$children) {
          ids <- c(ids, child$id)
        }
      }
    }
  }
  unique(ids)
}

# Helper: Get all column IDs for a specific category
get_category_column_ids <- function(category_items) {
  ids <- c()
  for (item in category_items) {
    if (item$type == "simple") {
      ids <- c(ids, item$id)
    } else if (item$type == "group") {
      for (child in item$children) {
        ids <- c(ids, child$id)
      }
    }
  }
  ids
}
