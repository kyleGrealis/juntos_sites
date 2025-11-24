# Checkbox hierarchy for nested filtering UI
# Parent checkboxes check/uncheck all children
# Children can be selected independently

checkbox_hierarchy <- list(
  prep = list(
    simple = list(
      pr_ep = "Offers PrEP",
      prep_medication_at_no_cost = "Medication at no cost",
      prep_other_financial_assistance_available = "Other financial assistance",
      prep_visits_and_labs_at_no_cost = "Visits and labs at no cost",
      prep_injectable_pr_ep_available = "Injectable PrEP available",
      prep_pr_ep_on_demand_2_1_1_available = "PrEP on-demand (2-1-1) available",
      prep_on_site_patient_navigators = "On-site patient navigators",
      prep_services_available_nights_evenings = "Services available nights/evenings",
      prep_site_offers_rapid_pr_ep = "Offers rapid PrEP",
      prep_spanish_speaking_providers = "Spanish-speaking providers",
      prep_telehealth = "Telehealth available",
      prep_walk_in_services = "Walk-in services"
    ),
    groups = list(
      list(
        parent = list(
          id = "prep_can_mail_deliver_meds",
          label = "Can mail/deliver medications"
        ),
        children = list(
          prep_can_mail_deliver_meds_always = "Always",
          prep_can_mail_deliver_meds_sometimes = "Sometimes"
        )
      ),
      list(
        parent = list(
          id = "prep_rides",
          label = "Transportation assistance"
        ),
        children = list(
          prep_free_rides = "Free rides",
          prep_subsidized_rides = "Subsidized rides",
          prep_sometimes_free_subsidized_rides = "Sometimes free/subsidized"
        )
      ),
      list(
        parent = list(
          id = "prep_providers",
          label = "Specialized providers"
        ),
        children = list(
          prep_latino_lgbtq_providers_available = "Latino LGBTQ+",
          prep_lgbtq_providers_available = "LGBTQ+"
        )
      )
    )
  ),

  pep = list(
    simple = list(
      pep = "Offers PEP",
      pep_medication_at_no_cost = "Medication at no cost",
      pep_other_financial_assistance_available = "Other financial assistance",
      pep_visits_and_labs_at_no_cost = "Visits and labs at no cost",
      pep_on_site_patient_navigators = "On-site patient navigators",
      pep_rapid_same_day_services = "Rapid/same-day services",
      pep_full_supply_available = "Full supply available",
      pep_starter_packs_available = "Starter packs available",
      pep_services_available_nights_evenings = "Services available nights/evenings",
      pep_spanish_speaking_providers = "Spanish-speaking providers",
      pep_telehealth = "Telehealth available",
      pep_walk_in_services = "Walk-in services"
    ),
    groups = list(
      list(
        parent = list(
          id = "pep_can_mail_deliver_meds",
          label = "Can mail/deliver medications"
        ),
        children = list(
          pep_can_mail_deliver_meds_always = "Always",
          pep_can_mail_deliver_meds_sometimes = "Sometimes"
        )
      ),
      list(
        parent = list(
          id = "pep_rides",
          label = "Transportation assistance"
        ),
        children = list(
          pep_free_rides = "Free rides",
          pep_sometimes_free_subsidized_rides = "Sometimes free/subsidized",
          pep_subsidized_rides = "Subsidized rides"
        )
      ),
      list(
        parent = list(
          id = "pep_providers",
          label = "Specialized providers"
        ),
        children = list(
          pep_latino_lgbtq_providers_available = "Latino LGBTQ+",
          pep_lgbtq_providers_available = "LGBTQ+"
        )
      )
    )
  ),

  hiv_treatment = list(
    simple = list(
      hiv_treatment = "Offers HIV treatment",
      hiv_medication_at_no_cost = "Medication at no cost",
      hiv_other_financial_assistance_available = "Other financial assistance",
      hiv_visits_and_labs_at_no_cost = "Visits and labs at no cost",
      hiv_injectable_art_available = "Injectable ART available",
      hiv_on_site_patient_navigators = "On-site patient navigators",
      hiv_on_site_ryan_white_patient_navigators = "On-site Ryan White patient navigators",
      hiv_rapid_hiv_treatment_available = "Rapid HIV treatment available",
      hiv_services_available_nights_evenings = "Services available nights/evenings",
      hiv_spanish_speaking_providers = "Spanish-speaking providers",
      hiv_telehealth = "Telehealth available",
      hiv_walk_in_services = "Walk-in services"
    ),
    groups = list(
      list(
        parent = list(
          id = "hiv_can_mail_deliver_meds",
          label = "Can mail/deliver medications"
        ),
        children = list(
          hiv_can_mail_deliver_meds_always = "Always",
          hiv_can_mail_deliver_meds_sometimes = "Sometimes"
        )
      ),
      list(
        parent = list(
          id = "hiv_rides",
          label = "Transportation assistance"
        ),
        children = list(
          hiv_free_rides = "Free rides",
          hiv_subsidized_rides = "Subsidized rides",
          hiv_sometimes_free_subsidized_rides = "Sometimes free/subsidized"
        )
      ),
      list(
        parent = list(
          id = "hiv_providers",
          label = "Specialized providers"
        ),
        children = list(
          hiv_latino_lgbtq_providers_available = "Latino LGBTQ+",
          hiv_lgbtq_providers_available = "LGBTQ+"
        )
      )
    )
  ),

  testing = list(
    simple = list(
      hiv_testing_confirmatory = "HIV testing (confirmatory)",
      hiv_testing_rapid = "HIV testing (rapid)",
      sti_testing = "STI testing",
      sti_treatment = "STI treatment"
    ),
    groups = list()
  ),

  mhsu = list(
    simple = list(
      mhsu_treatment_is_available_at_no_cost = "Treatment available at no cost",
      mhsu_other_financial_assistance_available = "Other financial assistance",
      mhsu_mental_health_treatment = "Mental health treatment",
      mhsu_psychiatry_or_psychiatric_medication_management = "Psychiatry/medication management",
      mhsu_services_available_nights_evenings = "Services available nights/evenings",
      mhsu_spanish_speaking_providers = "Spanish-speaking providers",
      mhsu_substance_use_treatment = "Substance use treatment",
      mhsu_support_groups = "Support groups",
      mhsu_telehealth = "Telehealth available",
      mhsu_walk_in_services = "Walk-in services"
    ),
    groups = list(
      list(
        parent = list(
          id = "mhsu_can_mail_deliver_meds",
          label = "Can mail/deliver medications"
        ),
        children = list(
          mhsu_can_mail_deliver_meds_always = "Always",
          mhsu_can_mail_deliver_meds_sometimes = "Sometimes"
        )
      ),
      list(
        parent = list(
          id = "mhsu_rides",
          label = "Transportation assistance"
        ),
        children = list(
          mhsu_free_rides = "Free rides",
          mhsu_subsidized_rides = "Subsidized rides",
          mhsu_sometimes_free_subsidized_rides = "Sometimes free/subsidized"
        )
      ),
      list(
        parent = list(
          id = "mhsu_providers",
          label = "Specialized providers"
        ),
        children = list(
          mhsu_latino_lgbtq_providers_available = "Latino LGBTQ+",
          mhsu_lgbtq_providers_available = "LGBTQ+"
        )
      )
    )
  ),

  social_services = list(
    simple = list(
      housing_assistance = "Housing assistance",
      immigration_assistance = "Immigration assistance",
      job_training_employment_assistance = "Job training/employment assistance"
    ),
    groups = list()
  ),

  additional = list(
    simple = list(
      dental_care = "Dental care",
      on_site_pharmacy = "On-site pharmacy",
      primary_care = "Primary care",
      free_validating_parking = "Free/validating parking"
    ),
    groups = list()
  )
)
