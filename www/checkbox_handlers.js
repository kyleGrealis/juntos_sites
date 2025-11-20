// Parent-child checkbox behavior
// When parent checked -> check all children
// When parent unchecked -> uncheck all children
// When user manually checks/unchecks a child -> parent stays unchecked

$(document).ready(function() {

  // Define "Select All" category relationships
  // When "Select All" is checked, check all checkboxes in that category
  const selectAllHandlers = {
    'select_all_prep': 'prep',
    'select_all_pep': 'pep',
    'select_all_hiv_treatment': 'hiv_treatment',
    'select_all_testing': 'testing',
    'select_all_mhsu': 'mhsu',
    'select_all_social_services': 'social_services',
    'select_all_additional': 'additional'
  };

  // Handle "Select All" checkbox changes
  Object.keys(selectAllHandlers).forEach(function(selectAllId) {
    const categoryPrefix = selectAllHandlers[selectAllId];

    $('#' + selectAllId).on('change', function() {
      const isChecked = $(this).prop('checked');

      // Find all checkboxes that start with 'service_' + category prefix
      // AND all parent checkboxes for this category
      const categoryCheckboxes = $('input[type="checkbox"]').filter(function() {
        const id = $(this).attr('id');
        return (id && id.startsWith('service_' + categoryPrefix)) ||
               (id && id.startsWith('parent_' + categoryPrefix));
      });

      // Check or uncheck all checkboxes in this category
      categoryCheckboxes.prop('checked', isChecked);
      categoryCheckboxes.trigger('change');
    });
  });

  // Define parent-child relationships
  // Format: { parent_id: [child_ids] }
  const parentChildMap = {
    // PrEP
    'parent_prep_can_mail_deliver_meds': [
      'service_prep_can_mail_deliver_meds_always',
      'service_prep_can_mail_deliver_meds_sometimes'
    ],
    'parent_prep_cost_coverage': [
      'service_prep_medication_at_no_cost',
      'service_prep_other_financial_assistance_available',
      'service_prep_visits_and_labs_at_no_cost'
    ],
    'parent_prep_rides': [
      'service_prep_free_rides',
      'service_prep_sometimes_free_subsidized_rides'
    ],
    'parent_prep_new_delivery': [
      'service_prep_injectable_pr_ep_available',
      'service_prep_pr_ep_on_demand_2_1_1_available'
    ],

    // PEP
    'parent_pep_can_mail_deliver_meds': [
      'service_pep_can_mail_deliver_meds_always',
      'service_pep_can_mail_deliver_meds_sometimes'
    ],
    'parent_pep_cost_coverage': [
      'service_pep_medication_at_no_cost',
      'service_pep_other_financial_assistance_available',
      'service_pep_visits_and_labs_at_no_cost'
    ],
    'parent_pep_rides': [
      'service_pep_free_rides',
      'service_pep_sometimes_free_subsidized_rides'
    ],
    'parent_pep_rapid_same_day': [
      'service_pep_full_supply_available',
      'service_pep_starter_packs_available'
    ],

    // HIV Treatment
    'parent_hiv_treatment_can_mail_deliver_meds': [
      'service_hiv_can_mail_deliver_meds_always',
      'service_hiv_can_mail_deliver_meds_sometimes'
    ],
    'parent_hiv_treatment_cost_coverage': [
      'service_hiv_medication_at_no_cost',
      'service_hiv_other_financial_assistance_available',
      'service_hiv_visits_and_labs_at_no_cost'
    ],
    'parent_hiv_treatment_rides': [
      'service_hiv_free_rides',
      'service_hiv_sometimes_free_subsidized_rides'
    ],
    'parent_hiv_treatment_on_site_navigators': [
      'service_hiv_on_site_patient_navigators',
      'service_hiv_on_site_ryan_white_patient_navigators'
    ],

    // Mental Health & Substance Use
    'parent_mhsu_can_mail_deliver_meds': [
      'service_mhsu_can_mail_deliver_meds_always',
      'service_mhsu_can_mail_deliver_meds_sometimes'
    ],
    'parent_mhsu_cost_coverage': [
      'service_mhsu_treatment_is_available_at_no_cost',
      'service_mhsu_other_financial_assistance_available'
    ],
    'parent_mhsu_rides': [
      'service_mhsu_free_rides',
      'service_mhsu_sometimes_free_subsidized_rides'
    ],
    'parent_mhsu_substance_use': [
      'service_mhsu_substance_use_treatment',
      'service_mhsu_support_groups'
    ]
  };

  // Handle parent checkbox changes
  Object.keys(parentChildMap).forEach(function(parentId) {
    const childIds = parentChildMap[parentId];

    // Listen for parent checkbox changes
    $('#' + parentId).on('change', function() {
      const isChecked = $(this).prop('checked');

      // Check or uncheck all children based on parent state
      childIds.forEach(function(childId) {
        $('#' + childId).prop('checked', isChecked);
        $('#' + childId).trigger('change');
      });
    });

    // Listen for child checkbox changes
    childIds.forEach(function(childId) {
      $('#' + childId).on('change', function() {
        // When user manually changes a child, uncheck the parent
        // This indicates the user made a specific choice
        $('#' + parentId).prop('checked', false);
      });
    });
  });

});
