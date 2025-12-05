// Checkbox behavior for Juntos Referral Database
// - "Select All" checks/unchecks all checkboxes in the same accordion panel
// - Parent group checkboxes check/uncheck their children
//
// Uses $(document).on('shiny:connected') to wait for Shiny to be ready
// Uses Shiny.setInputValue to properly notify Shiny of checkbox state changes


// Language toggle handler
// Sets the active language and notifies Shiny
function setLanguage(lang) {
  console.log('setLanguage called with:', lang);

  // Update modal toggle button states
  $('#lang_en, #lang_es, #lang_ht').removeClass('active');
  $('#lang_' + lang).addClass('active');

  // Update app toggle button states
  $('#app_lang_en, #app_lang_es, #app_lang_ht').removeClass('active');
  $('#app_lang_' + lang).addClass('active');

  // Notify Shiny of the language change (only if Shiny is ready)
  if (typeof Shiny !== 'undefined' && Shiny.setInputValue) {
    Shiny.setInputValue('language', lang);
  }

  // Update all translatable UI elements
  if (typeof updateTranslations === 'function') {
    updateTranslations(lang);
  }

  console.log('Language set to:', lang);
}


$(document).on('shiny:connected', function() {
  console.log('Shiny connected - initializing checkbox handlers');

  // Initialize language to English on startup
  Shiny.setInputValue('language', 'en');

  // Fix aria-hidden warning: blur modal buttons before modal hides
  $(document).on('hide.bs.modal', '#shiny-modal', function() {
    $(this).find('.modal-close-button').blur();
  });

  // Translate modal content when it opens (for site detail modals)
  $(document).on('shown.bs.modal', '#shiny-modal', function() {
    // Get current language and apply translations to modal
    const currentLang = Shiny.shinyapp.$inputValues.language || 'en';
    if (typeof updateTranslations === 'function') {
      updateTranslations(currentLang);
    }
  });

  // Helper function to update a checkbox and notify Shiny
  function setCheckbox(id, checked) {
    const $checkbox = $('#' + id);
    if ($checkbox.length === 0) {
      console.log('Checkbox not found:', id);
      return;
    }

    // Update the checkbox state visually
    $checkbox.prop('checked', checked);

    // Notify Shiny of the change
    Shiny.setInputValue(id, checked);
  }

  // Category IDs that have "Select All" checkboxes
  const categories = [
    'prep', 'pep', 'hiv_treatment', 'testing',
    'mhsu', 'social_services', 'additional'
  ];

  // Handle "Select All" checkbox changes using event delegation
  categories.forEach(function(categoryId) {
    const selectAllId = 'select_all_' + categoryId;

    $(document).on('change', '#' + selectAllId, function() {
      console.log('Select All clicked:', selectAllId);
      const isChecked = $(this).prop('checked');

      // Find the accordion panel containing this checkbox
      const $accordionBody = $(this).closest('.accordion-body');

      if ($accordionBody.length === 0) {
        console.log('Could not find accordion-body for', selectAllId);
        return;
      }

      // Find all other checkboxes in this panel (excluding the Select All itself)
      const $otherCheckboxes = $accordionBody.find('input[type="checkbox"]').not(this);
      console.log('Found', $otherCheckboxes.length, 'checkboxes in panel');

      // Check/uncheck all of them
      $otherCheckboxes.each(function() {
        const checkboxId = $(this).attr('id');
        setCheckbox(checkboxId, isChecked);
      });
    });
  });

  // Parent-child relationships for grouped checkboxes
  // Format: { parent_id: [child_service_ids] }
  // Parent IDs do NOT have 'service_' prefix, child IDs DO have 'service_' prefix
  const parentChildMap = {
    // PrEP
    'prep_can_mail_deliver_meds': [
      'service_prep_can_mail_deliver_meds_always',
      'service_prep_can_mail_deliver_meds_sometimes'
    ],
    'prep_cost_coverage': [
      'service_prep_medication_at_no_cost',
      'service_prep_other_financial_assistance_available',
      'service_prep_visits_and_labs_at_no_cost'
    ],
    'prep_rides': [
      'service_prep_free_rides',
      'service_prep_sometimes_free_subsidized_rides'
    ],
    'prep_new_delivery': [
      'service_prep_injectable_pr_ep_available',
      'service_prep_pr_ep_on_demand_2_1_1_available'
    ],

    // PEP
    'pep_can_mail_deliver_meds': [
      'service_pep_can_mail_deliver_meds_always',
      'service_pep_can_mail_deliver_meds_sometimes'
    ],
    'pep_cost_coverage': [
      'service_pep_medication_at_no_cost',
      'service_pep_other_financial_assistance_available',
      'service_pep_visits_and_labs_at_no_cost'
    ],
    'pep_rides': [
      'service_pep_free_rides',
      'service_pep_sometimes_free_subsidized_rides'
    ],
    'pep_rapid_same_day': [
      'service_pep_full_supply_available',
      'service_pep_starter_packs_available'
    ],

    // HIV Treatment
    'hiv_can_mail_deliver_meds': [
      'service_hiv_can_mail_deliver_meds_always',
      'service_hiv_can_mail_deliver_meds_sometimes'
    ],
    'hiv_cost_coverage': [
      'service_hiv_medication_at_no_cost',
      'service_hiv_other_financial_assistance_available',
      'service_hiv_visits_and_labs_at_no_cost'
    ],
    'hiv_rides': [
      'service_hiv_free_rides',
      'service_hiv_sometimes_free_subsidized_rides'
    ],
    'hiv_patient_navigators': [
      'service_hiv_on_site_patient_navigators',
      'service_hiv_on_site_ryan_white_patient_navigators'
    ],

    // Mental Health & Substance Use
    'mhsu_can_mail_deliver_meds': [
      'service_mhsu_can_mail_deliver_meds_always',
      'service_mhsu_can_mail_deliver_meds_sometimes'
    ],
    'mhsu_cost_coverage': [
      'service_mhsu_treatment_is_available_at_no_cost',
      'service_mhsu_other_financial_assistance_available'
    ],
    'mhsu_rides': [
      'service_mhsu_free_rides',
      'service_mhsu_sometimes_free_subsidized_rides'
    ],
    'mhsu_substance_use': [
      'service_mhsu_substance_use_treatment',
      'service_mhsu_support_groups'
    ]
  };

  // Handle parent checkbox changes using event delegation
  Object.keys(parentChildMap).forEach(function(parentId) {
    const childIds = parentChildMap[parentId];

    // Listen for parent checkbox changes
    $(document).on('change', '#' + parentId, function() {
      const isChecked = $(this).prop('checked');

      // Check or uncheck all children based on parent state
      childIds.forEach(function(childId) {
        setCheckbox(childId, isChecked);
      });
    });

    // Listen for child checkbox changes
    childIds.forEach(function(childId) {
      $(document).on('change', '#' + childId, function() {
        // When user manually changes a child, uncheck the parent
        setCheckbox(parentId, false);
      });
    });
  });

  console.log('Checkbox handlers initialized');
});
