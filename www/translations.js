// Client-side translations for dynamic language switching (English/Spanish)
// This mirrors R/config_translations.R for JavaScript access

const translations = {
  // UI chrome translations
  ui: {
    en: {
      // Welcome modal
      welcome_title: "Welcome to Juntos Referral Database",
      welcome_subtitle: "Find HIV and Health Services in Your Area",
      about_header: "About This Database",
      about_text: "This database helps you find healthcare sites offering HIV prevention, treatment, and related health services. Search and filter sites to find the services you need.",
      how_to_use: "How to Use",
      how_to_1: "Use the sidebar filters to select services you need",
      how_to_2: "Click on any row in the table to view detailed site information",
      how_to_3: 'Use the "Clear All Filters" button to reset your selection',
      get_started: "Get Started",

      // App UI
      filter_services: "Filter Services",
      select_all: "Select All",
      clear_all: "Clear All Filters",
      healthcare_sites: "Healthcare Sites",
      select_site: "Select a Site",

      // Site detail modal
      close: "Close",
      address: "Address: ",
      website: "Website: ",
      services_offered: "Services Offered",
      contact_footnote: "* Contact site for more information"
    },
    es: {
      // Welcome modal
      welcome_title: "Bienvenido a la Base de Datos de Referidos Juntos",
      welcome_subtitle: "Encuentre Servicios de VIH y Salud en Su Área",
      about_header: "Acerca de Esta Base de Datos",
      about_text: "Esta base de datos le ayuda a encontrar sitios de atención médica que ofrecen prevención, tratamiento y servicios de salud relacionados con el VIH. Busque y filtre sitios para encontrar los servicios que necesita.",
      how_to_use: "Cómo Usar",
      how_to_1: "Use los filtros en la barra lateral para seleccionar los servicios que necesita",
      how_to_2: "Haga clic en cualquier fila de la tabla para ver información detallada del sitio",
      how_to_3: 'Use el botón "Borrar Todos los Filtros" para restablecer su selección',
      get_started: "Comenzar",

      // App UI
      filter_services: "Filtrar Servicios",
      select_all: "Seleccionar Todo",
      clear_all: "Borrar Todos los Filtros",
      healthcare_sites: "Sitios de Atención Médica",
      select_site: "Seleccione un Sitio",

      // Site detail modal
      close: "Cerrar",
      address: "Dirección: ",
      website: "Sitio Web: ",
      services_offered: "Servicios Ofrecidos",
      contact_footnote: "* Contacte al sitio para más información"
    }
  },

  // Category translations (accordion headers)
  categories: {
    en: {
      prep: "PrEP",
      pep: "PEP",
      hiv_treatment: "HIV Treatment",
      testing: "HIV/STI Testing",
      mhsu: "Mental Health & Substance Use",
      social_services: "Social Services",
      additional: "Additional Services"
    },
    es: {
      prep: "PrEP",
      pep: "PEP",
      hiv_treatment: "Tratamiento del VIH",
      testing: "Pruebas de VIH/ITS",
      mhsu: "Salud Mental y Uso de Sustancias",
      social_services: "Servicios Sociales",
      additional: "Servicios Adicionales"
    }
  },

  // Checkbox label translations (keyed by checkbox ID)
  checkboxes: {
    en: {
      // PrEP
      pr_ep: "Offers PrEP",
      prep_can_mail_deliver_meds: "Can mail/deliver medications",
      prep_can_mail_deliver_meds_always: "Always",
      prep_can_mail_deliver_meds_sometimes: "Sometimes",
      prep_cost_coverage: "Cost coverage options",
      prep_medication_at_no_cost: "Medication at no cost",
      prep_other_financial_assistance_available: "Other financial assistance available",
      prep_visits_and_labs_at_no_cost: "Visits and labs at no cost",
      prep_rides: "Free or subsidized rides",
      prep_free_rides: "Free rides",
      prep_sometimes_free_subsidized_rides: "Sometimes free/subsidized rides",
      prep_latino_lgbtq_providers_available: "Latino LGBTQ+ providers available",
      prep_lgbtq_providers_available: "LGBTQ+ providers available",
      prep_new_delivery: "New delivery options",
      prep_injectable_pr_ep_available: "Injectable PrEP available",
      prep_pr_ep_on_demand_2_1_1_available: "PrEP on-demand (2-1-1) available",
      prep_on_site_patient_navigators: "On-site patient navigators",
      prep_services_available_nights_evenings: "Services available nights/evenings",
      prep_site_offers_rapid_pr_ep: "Site offers rapid PrEP",
      prep_spanish_speaking_providers: "Spanish-speaking providers",
      prep_telehealth: "Telehealth",
      prep_walk_in_services: "Walk-in services",

      // PEP
      pep: "Offers PEP",
      pep_can_mail_deliver_meds: "Can mail/deliver medications",
      pep_can_mail_deliver_meds_always: "Always",
      pep_can_mail_deliver_meds_sometimes: "Sometimes",
      pep_cost_coverage: "Cost coverage options",
      pep_medication_at_no_cost: "Medication at no cost",
      pep_other_financial_assistance_available: "Other financial assistance available",
      pep_visits_and_labs_at_no_cost: "Visits and labs at no cost",
      pep_rides: "Free or subsidized rides",
      pep_free_rides: "Free rides",
      pep_sometimes_free_subsidized_rides: "Sometimes free/subsidized rides",
      pep_latino_lgbtq_providers_available: "Latino LGBTQ+ providers available",
      pep_lgbtq_providers_available: "LGBTQ+ providers available",
      pep_on_site_patient_navigators: "On-site patient navigators",
      pep_rapid_same_day: "Rapid or same-day services",
      pep_full_supply_available: "Full supply available",
      pep_starter_packs_available: "Starter packs available",
      pep_services_available_nights_evenings: "Services available nights/evenings",
      pep_spanish_speaking_providers: "Spanish-speaking providers",
      pep_telehealth: "Telehealth",
      pep_walk_in_services: "Walk-in services",

      // HIV Treatment
      hiv_treatment: "Offers HIV treatment",
      hiv_can_mail_deliver_meds: "Can mail/deliver medications",
      hiv_can_mail_deliver_meds_always: "Always",
      hiv_can_mail_deliver_meds_sometimes: "Sometimes",
      hiv_cost_coverage: "Cost coverage options",
      hiv_medication_at_no_cost: "Medication at no cost",
      hiv_other_financial_assistance_available: "Other financial assistance available",
      hiv_visits_and_labs_at_no_cost: "Visits and labs at no cost",
      hiv_rides: "Free or subsidized rides",
      hiv_free_rides: "Free rides",
      hiv_sometimes_free_subsidized_rides: "Sometimes free/subsidized rides",
      hiv_injectable_art_available: "Injectable ART available",
      hiv_latino_lgbtq_providers_available: "Latino LGBTQ+ providers available",
      hiv_lgbtq_providers_available: "LGBTQ+ providers available",
      hiv_patient_navigators: "On-site patient navigators",
      hiv_on_site_patient_navigators: "Patient navigators",
      hiv_on_site_ryan_white_patient_navigators: "Ryan White case managers",
      hiv_rapid_hiv_treatment_available: "Rapid HIV treatment available",
      hiv_services_available_nights_evenings: "Services available nights/evenings",
      hiv_spanish_speaking_providers: "Spanish-speaking providers",
      hiv_telehealth: "Telehealth",
      hiv_walk_in_services: "Walk-in services",

      // Testing
      hiv_testing_confirmatory: "HIV testing (confirmatory)",
      hiv_testing_rapid: "HIV testing (rapid)",
      sti_testing: "STI testing",
      sti_treatment: "STI treatment",

      // Mental Health & Substance Use
      mhsu_can_mail_deliver_meds: "Can mail/deliver medications",
      mhsu_can_mail_deliver_meds_always: "Always",
      mhsu_can_mail_deliver_meds_sometimes: "Sometimes",
      mhsu_cost_coverage: "Cost coverage options",
      mhsu_treatment_is_available_at_no_cost: "Treatment available at no cost",
      mhsu_other_financial_assistance_available: "Other financial assistance available",
      mhsu_rides: "Free or subsidized rides",
      mhsu_free_rides: "Free rides",
      mhsu_sometimes_free_subsidized_rides: "Sometimes free/subsidized rides",
      mhsu_latino_lgbtq_providers_available: "Latino LGBTQ+ providers available",
      mhsu_lgbtq_providers_available: "LGBTQ+ providers available",
      mhsu_mental_health_treatment: "Mental health treatment",
      mhsu_psychiatry_or_psychiatric_medication_management: "Psychiatry/medication management",
      mhsu_services_available_nights_evenings: "Services available nights/evenings",
      mhsu_spanish_speaking_providers: "Spanish-speaking providers",
      mhsu_substance_use: "Substance use treatment",
      mhsu_substance_use_treatment: "Substance use treatment",
      mhsu_support_groups: "Support groups",
      mhsu_telehealth: "Telehealth",
      mhsu_walk_in_services: "Walk-in services",

      // Social Services
      housing_assistance: "Housing assistance",
      immigration_assistance: "Immigration assistance",
      job_training_employment_assistance: "Job training & employment assistance",

      // Additional Services
      dental_care: "Dental care",
      on_site_pharmacy: "On-site pharmacy",
      primary_care: "Primary care",
      free_validating_parking: "Free/validated parking"
    },

    es: {
      // PrEP
      pr_ep: "Ofrece PrEP",
      prep_can_mail_deliver_meds: "Puede enviar/entregar medicamentos",
      prep_can_mail_deliver_meds_always: "Siempre",
      prep_can_mail_deliver_meds_sometimes: "A veces",
      prep_cost_coverage: "Opciones de cobertura de costos",
      prep_medication_at_no_cost: "Medicamento sin costo",
      prep_other_financial_assistance_available: "Otra asistencia financiera disponible",
      prep_visits_and_labs_at_no_cost: "Visitas y laboratorios sin costo",
      prep_rides: "Transporte gratis o subsidiado",
      prep_free_rides: "Transporte gratis",
      prep_sometimes_free_subsidized_rides: "A veces transporte gratis/subsidiado",
      prep_latino_lgbtq_providers_available: "Proveedores latinos LGBTQ+ disponibles",
      prep_lgbtq_providers_available: "Proveedores LGBTQ+ disponibles",
      prep_new_delivery: "Nuevas opciones de administración",
      prep_injectable_pr_ep_available: "PrEP inyectable disponible",
      prep_pr_ep_on_demand_2_1_1_available: "PrEP a demanda (2-1-1) disponible",
      prep_on_site_patient_navigators: "Navegadores de pacientes en el sitio",
      prep_services_available_nights_evenings: "Servicios disponibles noches/tardes",
      prep_site_offers_rapid_pr_ep: "El sitio ofrece PrEP rápido",
      prep_spanish_speaking_providers: "Proveedores que hablan español",
      prep_telehealth: "Telesalud",
      prep_walk_in_services: "Servicios sin cita",

      // PEP
      pep: "Ofrece PEP",
      pep_can_mail_deliver_meds: "Puede enviar/entregar medicamentos",
      pep_can_mail_deliver_meds_always: "Siempre",
      pep_can_mail_deliver_meds_sometimes: "A veces",
      pep_cost_coverage: "Opciones de cobertura de costos",
      pep_medication_at_no_cost: "Medicamento sin costo",
      pep_other_financial_assistance_available: "Otra asistencia financiera disponible",
      pep_visits_and_labs_at_no_cost: "Visitas y laboratorios sin costo",
      pep_rides: "Transporte gratis o subsidiado",
      pep_free_rides: "Transporte gratis",
      pep_sometimes_free_subsidized_rides: "A veces transporte gratis/subsidiado",
      pep_latino_lgbtq_providers_available: "Proveedores latinos LGBTQ+ disponibles",
      pep_lgbtq_providers_available: "Proveedores LGBTQ+ disponibles",
      pep_on_site_patient_navigators: "Navegadores de pacientes en el sitio",
      pep_rapid_same_day: "Servicios rápidos o el mismo día",
      pep_full_supply_available: "Suministro completo disponible",
      pep_starter_packs_available: "Paquetes de inicio disponibles",
      pep_services_available_nights_evenings: "Servicios disponibles noches/tardes",
      pep_spanish_speaking_providers: "Proveedores que hablan español",
      pep_telehealth: "Telesalud",
      pep_walk_in_services: "Servicios sin cita",

      // HIV Treatment
      hiv_treatment: "Ofrece tratamiento del VIH",
      hiv_can_mail_deliver_meds: "Puede enviar/entregar medicamentos",
      hiv_can_mail_deliver_meds_always: "Siempre",
      hiv_can_mail_deliver_meds_sometimes: "A veces",
      hiv_cost_coverage: "Opciones de cobertura de costos",
      hiv_medication_at_no_cost: "Medicamento sin costo",
      hiv_other_financial_assistance_available: "Otra asistencia financiera disponible",
      hiv_visits_and_labs_at_no_cost: "Visitas y laboratorios sin costo",
      hiv_rides: "Transporte gratis o subsidiado",
      hiv_free_rides: "Transporte gratis",
      hiv_sometimes_free_subsidized_rides: "A veces transporte gratis/subsidiado",
      hiv_injectable_art_available: "TAR inyectable disponible",
      hiv_latino_lgbtq_providers_available: "Proveedores latinos LGBTQ+ disponibles",
      hiv_lgbtq_providers_available: "Proveedores LGBTQ+ disponibles",
      hiv_patient_navigators: "Navegadores de pacientes en el sitio",
      hiv_on_site_patient_navigators: "Navegadores de pacientes",
      hiv_on_site_ryan_white_patient_navigators: "Administradores de casos Ryan White",
      hiv_rapid_hiv_treatment_available: "Tratamiento rápido del VIH disponible",
      hiv_services_available_nights_evenings: "Servicios disponibles noches/tardes",
      hiv_spanish_speaking_providers: "Proveedores que hablan español",
      hiv_telehealth: "Telesalud",
      hiv_walk_in_services: "Servicios sin cita",

      // Testing
      hiv_testing_confirmatory: "Prueba de VIH (confirmatoria)",
      hiv_testing_rapid: "Prueba de VIH (rápida)",
      sti_testing: "Pruebas de ITS",
      sti_treatment: "Tratamiento de ITS",

      // Mental Health & Substance Use
      mhsu_can_mail_deliver_meds: "Puede enviar/entregar medicamentos",
      mhsu_can_mail_deliver_meds_always: "Siempre",
      mhsu_can_mail_deliver_meds_sometimes: "A veces",
      mhsu_cost_coverage: "Opciones de cobertura de costos",
      mhsu_treatment_is_available_at_no_cost: "Tratamiento disponible sin costo",
      mhsu_other_financial_assistance_available: "Otra asistencia financiera disponible",
      mhsu_rides: "Transporte gratis o subsidiado",
      mhsu_free_rides: "Transporte gratis",
      mhsu_sometimes_free_subsidized_rides: "A veces transporte gratis/subsidiado",
      mhsu_latino_lgbtq_providers_available: "Proveedores latinos LGBTQ+ disponibles",
      mhsu_lgbtq_providers_available: "Proveedores LGBTQ+ disponibles",
      mhsu_mental_health_treatment: "Tratamiento de salud mental",
      mhsu_psychiatry_or_psychiatric_medication_management: "Psiquiatría/manejo de medicamentos",
      mhsu_services_available_nights_evenings: "Servicios disponibles noches/tardes",
      mhsu_spanish_speaking_providers: "Proveedores que hablan español",
      mhsu_substance_use: "Tratamiento de uso de sustancias",
      mhsu_substance_use_treatment: "Tratamiento de uso de sustancias",
      mhsu_support_groups: "Grupos de apoyo",
      mhsu_telehealth: "Telesalud",
      mhsu_walk_in_services: "Servicios sin cita",

      // Social Services
      housing_assistance: "Asistencia de vivienda",
      immigration_assistance: "Asistencia de inmigración",
      job_training_employment_assistance: "Capacitación laboral y asistencia de empleo",

      // Additional Services
      dental_care: "Atención dental",
      on_site_pharmacy: "Farmacia en el sitio",
      primary_care: "Atención primaria",
      free_validating_parking: "Estacionamiento gratis/validado"
    }
  }
};


// Debug function to inspect DOM structure (call from browser console)
function debugSelectors() {
  console.log('=== DEBUG: Inspecting DOM structure ===');

  // Check checkbox structure
  const firstCheckbox = $('input[type="checkbox"]').first();
  if (firstCheckbox.length > 0) {
    console.log('First checkbox ID:', firstCheckbox.attr('id'));
    console.log('First checkbox parent HTML:', firstCheckbox.parent().prop('outerHTML').substring(0, 500));
    const label = $('label[for="' + firstCheckbox.attr('id') + '"]');
    console.log('Label found:', label.length > 0);
    if (label.length > 0) {
      console.log('Label HTML:', label.prop('outerHTML'));
    }
  }

  // Check accordion structure
  const accordionBtns = $('.accordion-button');
  console.log('Accordion buttons found:', accordionBtns.length);
  if (accordionBtns.length > 0) {
    console.log('First accordion button HTML:', accordionBtns.first().prop('outerHTML').substring(0, 500));
    console.log('First accordion button attributes:', {
      'aria-controls': accordionBtns.first().attr('aria-controls'),
      'data-bs-target': accordionBtns.first().attr('data-bs-target'),
      'data-value': accordionBtns.first().attr('data-value')
    });
  }

  console.log('=== DEBUG complete ===');
}

// Update all translatable UI elements based on language
function updateTranslations(lang) {
  console.log('=== updateTranslations called with:', lang, '===');

  // Update elements with data-i18n attribute (UI text)
  $('[data-i18n]').each(function() {
    const $el = $(this);
    const key = $el.attr('data-i18n');

    // Try UI translations first, then checkbox translations
    let translation = translations.ui[lang][key];
    if (!translation) {
      translation = translations.checkboxes[lang][key];
    }

    if (translation) {
      // Check if element has an icon child to preserve
      const $icon = $el.find('i, svg').first();
      if ($icon.length > 0) {
        const iconHtml = $icon.prop('outerHTML');
        $el.html(iconHtml + ' ' + translation);
      } else {
        $el.text(translation);
      }
      console.log('Updated [data-i18n="' + key + '"] to:', translation);
    }
  });

  // Update modal category headers (data-i18n-category attribute)
  $('[data-i18n-category]').each(function() {
    const $el = $(this);
    const categoryId = $el.attr('data-i18n-category');
    const translation = translations.categories[lang][categoryId];
    if (translation) {
      $el.text(translation);
      console.log('Updated modal category:', categoryId);
    }
  });

  // Update "Clear All Filters" button
  const $clearBtn = $('#clear_filters');
  if ($clearBtn.length > 0) {
    const $icon = $clearBtn.find('i, svg').first();
    const iconHtml = $icon.length > 0 ? $icon.prop('outerHTML') + ' ' : '';
    $clearBtn.html(iconHtml + translations.ui[lang].clear_all);
    console.log('Updated #clear_filters');
  }

  // Update checkbox labels
  // Shiny checkboxes: <label><input id="..."><span>Label Text</span></label>
  let checkboxCount = 0;
  Object.keys(translations.checkboxes[lang]).forEach(function(key) {
    // Try with service_ prefix (most checkboxes)
    let $input = $('#service_' + key);
    if ($input.length > 0) {
      const $span = $input.siblings('span').first();
      if ($span.length > 0) {
        $span.text(translations.checkboxes[lang][key]);
        checkboxCount++;
      }
    }

    // Try without prefix (parent group checkboxes)
    $input = $('#' + key);
    if ($input.length > 0 && !key.startsWith('service_')) {
      const $span = $input.siblings('span').first();
      if ($span.length > 0) {
        $span.text(translations.checkboxes[lang][key]);
        checkboxCount++;
      }
    }
  });
  console.log('Updated', checkboxCount, 'checkbox labels');

  // Update "Select All" labels
  const categories = ['prep', 'pep', 'hiv_treatment', 'testing', 'mhsu', 'social_services', 'additional'];
  categories.forEach(function(cat) {
    const $input = $('#select_all_' + cat);
    if ($input.length > 0) {
      const $span = $input.siblings('span').first();
      if ($span.length > 0) {
        $span.html('<strong>' + translations.ui[lang].select_all + '</strong>');
      }
    }
  });

  // Update accordion headers (category labels)
  // bslib uses random IDs, so we find by matching current text content
  const categoryLabelsEn = {
    'PrEP': 'prep',
    'PEP': 'pep',
    'HIV Treatment': 'hiv_treatment',
    'HIV/STI Testing': 'testing',
    'Mental Health & Substance Use': 'mhsu',
    'Social Services': 'social_services',
    'Additional Services': 'additional'
  };
  const categoryLabelsEs = {
    'Tratamiento del VIH': 'hiv_treatment',
    'Pruebas de VIH/ITS': 'testing',
    'Salud Mental y Uso de Sustancias': 'mhsu',
    'Servicios Sociales': 'social_services',
    'Servicios Adicionales': 'additional'
  };
  const allCategoryLabels = Object.assign({}, categoryLabelsEn, categoryLabelsEs);

  $('.accordion-button').each(function() {
    const $btn = $(this);
    const $titleDiv = $btn.find('.accordion-title > div').first();

    if ($titleDiv.length > 0) {
      const currentText = $titleDiv.text().trim();
      // Extract category name (before the count in parentheses)
      const match = currentText.match(/^(.+?)\s*\((\d+)\)$/);

      if (match) {
        const categoryName = match[1].trim();
        const count = match[2];

        // Find which category this is
        const categoryId = allCategoryLabels[categoryName];

        if (categoryId) {
          const $dotSpan = $titleDiv.find('span').first();
          if ($dotSpan.length > 0) {
            const spanHtml = $dotSpan.prop('outerHTML');
            $titleDiv.html(spanHtml + translations.categories[lang][categoryId] + ' (' + count + ')');
            console.log('Updated accordion header:', categoryId);
          }
        }
      }
    }
  });

  console.log('=== updateTranslations complete ===');
}
