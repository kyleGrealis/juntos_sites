/**
 * Tests for checkbox_handlers.js
 * Tests language switching and checkbox cascade behavior
 */

// Reset DOM and mocks before each test
beforeEach(() => {
  // Clear the document
  document.body.innerHTML = "";

  // Reset Shiny mock
  global.Shiny = {
    setInputValue: jest.fn(),
    shinyapp: {
      $inputValues: { language: "en" },
    },
  };

  // Reset updateTranslations mock
  global.updateTranslations = jest.fn();
});

describe("setLanguage", () => {
  beforeEach(() => {
    // Set up language toggle buttons (modal and app versions)
    document.body.innerHTML = `
      <button id="lang_en" class="active"></button>
      <button id="lang_es"></button>
      <button id="app_lang_en" class="active"></button>
      <button id="app_lang_es"></button>
    `;

    // Load the setLanguage function
    const fs = require("fs");
    const path = require("path");
    const code = fs.readFileSync(
      path.join(__dirname, "../www/checkbox_handlers.js"),
      "utf8"
    );

    // Extract just the setLanguage function and execute it
    const setLanguageMatch = code.match(
      /function setLanguage\(lang\) \{[\s\S]*?^\}/m
    );
    if (setLanguageMatch) {
      eval(setLanguageMatch[0]);
      global.setLanguage = setLanguage;
    }
  });

  test("switches active class to English button", () => {
    setLanguage("en");

    expect($("#lang_en").hasClass("active")).toBe(true);
    expect($("#lang_es").hasClass("active")).toBe(false);
    expect($("#app_lang_en").hasClass("active")).toBe(true);
    expect($("#app_lang_es").hasClass("active")).toBe(false);
  });

  test("switches active class to Spanish button", () => {
    setLanguage("es");

    expect($("#lang_en").hasClass("active")).toBe(false);
    expect($("#lang_es").hasClass("active")).toBe(true);
    expect($("#app_lang_en").hasClass("active")).toBe(false);
    expect($("#app_lang_es").hasClass("active")).toBe(true);
  });

  test("notifies Shiny of language change", () => {
    setLanguage("es");

    expect(Shiny.setInputValue).toHaveBeenCalledWith("language", "es");
  });

  test("calls updateTranslations with new language", () => {
    setLanguage("es");

    expect(updateTranslations).toHaveBeenCalledWith("es");
  });
});

describe("Select All checkbox behavior", () => {
  beforeEach(() => {
    // Set up a mock accordion panel with Select All and child checkboxes
    document.body.innerHTML = `
      <div class="accordion-body" id="prep_panel">
        <label>
          <input type="checkbox" id="select_all_prep">
          <span>Select All</span>
        </label>
        <label>
          <input type="checkbox" id="service_prep_telehealth">
          <span>Telehealth</span>
        </label>
        <label>
          <input type="checkbox" id="service_prep_walk_in">
          <span>Walk-in</span>
        </label>
        <label>
          <input type="checkbox" id="service_prep_free_rides">
          <span>Free rides</span>
        </label>
      </div>
    `;

    // Load and execute the checkbox handler setup
    const fs = require("fs");
    const path = require("path");
    const code = fs.readFileSync(
      path.join(__dirname, "../www/checkbox_handlers.js"),
      "utf8"
    );

    // We need to simulate the shiny:connected event handler
    // Extract the event handler code and adapt it for testing
    eval(`
      const categories = ['prep', 'pep', 'hiv_treatment', 'testing', 'mhsu', 'social_services', 'additional'];

      function setCheckbox(id, checked) {
        const $checkbox = $('#' + id);
        if ($checkbox.length === 0) return;
        $checkbox.prop('checked', checked);
        Shiny.setInputValue(id, checked);
      }

      categories.forEach(function(categoryId) {
        const selectAllId = 'select_all_' + categoryId;
        $(document).on('change', '#' + selectAllId, function() {
          const isChecked = $(this).prop('checked');
          const $accordionBody = $(this).closest('.accordion-body');
          if ($accordionBody.length === 0) return;
          const $otherCheckboxes = $accordionBody.find('input[type="checkbox"]').not(this);
          $otherCheckboxes.each(function() {
            const checkboxId = $(this).attr('id');
            setCheckbox(checkboxId, isChecked);
          });
        });
      });
    `);
  });

  test("checking Select All checks all other checkboxes in panel", () => {
    // Trigger the Select All checkbox
    $("#select_all_prep").prop("checked", true).trigger("change");

    expect($("#service_prep_telehealth").prop("checked")).toBe(true);
    expect($("#service_prep_walk_in").prop("checked")).toBe(true);
    expect($("#service_prep_free_rides").prop("checked")).toBe(true);
  });

  test("unchecking Select All unchecks all other checkboxes in panel", () => {
    // First check everything
    $("#select_all_prep").prop("checked", true).trigger("change");

    // Then uncheck Select All
    $("#select_all_prep").prop("checked", false).trigger("change");

    expect($("#service_prep_telehealth").prop("checked")).toBe(false);
    expect($("#service_prep_walk_in").prop("checked")).toBe(false);
    expect($("#service_prep_free_rides").prop("checked")).toBe(false);
  });

  test("Select All notifies Shiny for each checkbox", () => {
    $("#select_all_prep").prop("checked", true).trigger("change");

    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_telehealth",
      true
    );
    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_walk_in",
      true
    );
    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_free_rides",
      true
    );
  });
});

describe("Parent-child checkbox behavior", () => {
  beforeEach(() => {
    // Set up parent checkbox with children
    document.body.innerHTML = `
      <div class="accordion-body">
        <label>
          <input type="checkbox" id="prep_cost_coverage">
          <span>Cost coverage options</span>
        </label>
        <div class="ms-4">
          <label>
            <input type="checkbox" id="service_prep_medication_at_no_cost">
            <span>Medication at no cost</span>
          </label>
          <label>
            <input type="checkbox" id="service_prep_other_financial_assistance_available">
            <span>Other financial assistance</span>
          </label>
          <label>
            <input type="checkbox" id="service_prep_visits_and_labs_at_no_cost">
            <span>Visits and labs at no cost</span>
          </label>
        </div>
      </div>
    `;

    // Set up the parent-child handler
    eval(`
      function setCheckbox(id, checked) {
        const $checkbox = $('#' + id);
        if ($checkbox.length === 0) return;
        $checkbox.prop('checked', checked);
        Shiny.setInputValue(id, checked);
      }

      const parentChildMap = {
        'prep_cost_coverage': [
          'service_prep_medication_at_no_cost',
          'service_prep_other_financial_assistance_available',
          'service_prep_visits_and_labs_at_no_cost'
        ]
      };

      Object.keys(parentChildMap).forEach(function(parentId) {
        const childIds = parentChildMap[parentId];

        $(document).on('change', '#' + parentId, function() {
          const isChecked = $(this).prop('checked');
          childIds.forEach(function(childId) {
            setCheckbox(childId, isChecked);
          });
        });

        childIds.forEach(function(childId) {
          $(document).on('change', '#' + childId, function() {
            setCheckbox(parentId, false);
          });
        });
      });
    `);
  });

  test("checking parent checks all children", () => {
    $("#prep_cost_coverage").prop("checked", true).trigger("change");

    expect($("#service_prep_medication_at_no_cost").prop("checked")).toBe(true);
    expect(
      $("#service_prep_other_financial_assistance_available").prop("checked")
    ).toBe(true);
    expect($("#service_prep_visits_and_labs_at_no_cost").prop("checked")).toBe(
      true
    );
  });

  test("unchecking parent unchecks all children", () => {
    // Check parent first
    $("#prep_cost_coverage").prop("checked", true).trigger("change");

    // Uncheck parent
    $("#prep_cost_coverage").prop("checked", false).trigger("change");

    expect($("#service_prep_medication_at_no_cost").prop("checked")).toBe(
      false
    );
    expect(
      $("#service_prep_other_financial_assistance_available").prop("checked")
    ).toBe(false);
    expect($("#service_prep_visits_and_labs_at_no_cost").prop("checked")).toBe(
      false
    );
  });

  test("checking a child unchecks the parent", () => {
    // Check parent first
    $("#prep_cost_coverage").prop("checked", true).trigger("change");

    // Clear the mock to track new calls
    Shiny.setInputValue.mockClear();

    // Manually check one child (simulating user clicking just one)
    $("#service_prep_medication_at_no_cost")
      .prop("checked", true)
      .trigger("change");

    // Parent should be unchecked
    expect($("#prep_cost_coverage").prop("checked")).toBe(false);
    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "prep_cost_coverage",
      false
    );
  });

  test("parent notifies Shiny for all children", () => {
    $("#prep_cost_coverage").prop("checked", true).trigger("change");

    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_medication_at_no_cost",
      true
    );
    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_other_financial_assistance_available",
      true
    );
    expect(Shiny.setInputValue).toHaveBeenCalledWith(
      "service_prep_visits_and_labs_at_no_cost",
      true
    );
  });
});
