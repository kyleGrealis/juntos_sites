# Translation configuration for bilingual support (English/Spanish)
#
# This file provides a lookup-based translation system for the Juntos app.
# Three data structures store translations, and helper functions provide
# convenient access. The reactive language state (set via toggle button)
# determines which language to display.
#
# Architecture:
#   1. User clicks language toggle -> updates input$language ("en" or "es")
#   2. Reactive UI elements call t_*() helpers with current language
#   3. Helpers return appropriate translation from lookup tables


#' UI Chrome Text Translations
#'
#' Named list containing translations for user interface elements including
#' buttons, headers, status messages, and modal text. Structured as nested
#' lists with language codes as first-level keys.
#'
#' @format A named list with two elements (`en` and `es`), each containing
#'   named character strings for UI text:
#'   \describe{
#'     \item{welcome_title}{Main welcome modal heading}
#'     \item{filter_services}{Sidebar filter header}
#'     \item{no_filters}{Status text when no filters selected}
#'     \item{get_started}{Welcome modal button text}
#'     \item{...}{Additional UI text keys}
#'   }
#'
#' @examples
#' ui_translations[["en"]][["filter_services"]]
#' # [1] "Filter Services"
#'
#' ui_translations[["es"]][["filter_services"]]
#' # [1] "Filtrar Servicios"
#'
#' @family translation data
ui_translations <- list(
  en = list(
    # Welcome modal
    welcome_title = "Welcome to the Health Services Referral Database",
    welcome_subtitle = "Find Health Services in Your Area",

    about_header = "About This Database",
    about_text = "This database helps you find healthcare sites offering HIV prevention, treatment, and related health services. Search and filter sites to find the services you need.",
    how_to_use = "How to Use",
    how_to_1 = "Use the sidebar filters to select services you need",
    how_to_2 = "Click on any row in the table to view detailed site information",
    how_to_3 = 'Use the "Clear All Filters" button to reset your selection',
    get_started = "Get Started",

    # Language toggle
    lang_english = "English",
    lang_spanish = "Español",

    # Sidebar
    filter_services = "Filter Services",
    no_filters = "No filters active",
    filters_active = "filter(s) active",
    sites = "sites",
    clear_all = "Clear All Filters",

    # Main panel
    healthcare_sites = "Healthcare Sites",
    select_site = "Select a Site",

    # Site modal
    services_offered = "Services Offered",
    address = "Address",
    website = "Website",
    close = "Close",
    contact_footnote = "* Contact site for more information",

    # Footer
    footer_text = "Juntos HIV/Health Services Referral Database",

    # Accordion misc
    select_all = "Select All",

    # Table column headers
    col_site_name = "Site Name",
    col_organization = "Organization",
    col_jurisdiction = "Jurisdiction",
    col_address = "Address",
    col_services = "Services"
  ),

  es = list(
    # Welcome modal
    welcome_title = "Bienvenido a la Base de Datos de Referidos Juntos",
    welcome_subtitle = "Encuentre Servicios de VIH y Salud en Su Área",
    about_header = "Acerca de Esta Base de Datos",
    about_text = "Esta base de datos le ayuda a encontrar sitios de atención médica que ofrecen prevención, tratamiento y servicios de salud relacionados con el VIH. Busque y filtre sitios para encontrar los servicios que necesita.",
    how_to_use = "Cómo Usar",
    how_to_1 = "Use los filtros en la barra lateral para seleccionar los servicios que necesita",
    how_to_2 = "Haga clic en cualquier fila de la tabla para ver información detallada del sitio",
    how_to_3 = 'Use el botón "Borrar Todos los Filtros" para restablecer su selección',
    get_started = "Comenzar",

    # Language toggle
    lang_english = "English",
    lang_spanish = "Español",

    # Sidebar
    filter_services = "Filtrar Servicios",
    no_filters = "Sin filtros activos",
    filters_active = "filtro(s) activo(s)",
    sites = "sitios",
    clear_all = "Borrar Todos los Filtros",

    # Main panel
    healthcare_sites = "Sitios de Atención Médica",
    select_site = "Seleccione un Sitio",

    # Site modal
    services_offered = "Servicios Ofrecidos",
    address = "Dirección",
    website = "Sitio Web",
    close = "Cerrar",
    contact_footnote = "* Contacte al sitio para más información",

    # Footer
    footer_text = "Base de Datos de Referidos de Servicios de VIH/Salud Juntos",

    # Accordion misc
    select_all = "Seleccionar Todo",

    # Table column headers
    col_site_name = "Nombre del Sitio",
    col_organization = "Organización",
    col_jurisdiction = "Jurisdicción",
    col_address = "Dirección",
    col_services = "Servicios"
  )
)


#' Service Category Label Translations
#'
#' Named list containing translations for the seven service category headers
#' displayed in the accordion sidebar. Keys match the category IDs used in
#' `service_categories` and `checkbox_hierarchy`.
#'
#' @format A named list with two elements (`en` and `es`), each containing
#'   7 named character strings for category labels:
#'   \describe{
#'     \item{prep}{Pre-exposure prophylaxis services}
#'     \item{pep}{Post-exposure prophylaxis services}
#'     \item{hiv_treatment}{HIV treatment services}
#'     \item{testing}{HIV/STI testing services}
#'     \item{mhsu}{Mental health and substance use services}
#'     \item{social_services}{Social support services}
#'     \item{additional}{Additional healthcare services}
#'   }
#'
#' @examples
#' category_translations[["en"]][["mhsu"]]
#' # [1] "Mental Health & Substance Use"
#'
#' category_translations[["es"]][["mhsu"]]
#' # [1] "Salud Mental y Uso de Sustancias"
#'
#' @family translation data
category_translations <- list(
  en = list(
    prep = "PrEP",
    pep = "PEP",
    hiv_treatment = "HIV Treatment",
    testing = "HIV/STI Testing",
    mhsu = "Mental Health & Substance Use",
    social_services = "Social Services",
    additional = "Additional Services"
  ),
  es = list(
    prep = "PrEP",
    pep = "PEP",
    hiv_treatment = "Tratamiento del VIH",
    testing = "Pruebas de VIH/ITS",
    mhsu = "Salud Mental y Uso de Sustancias",
    social_services = "Servicios Sociales",
    additional = "Servicios Adicionales"
  )
)


#' Checkbox Label Translations
#'
#' Named list containing translations for all checkbox options in the service
#' filter accordion. Keys match the checkbox IDs defined in `checkbox_hierarchy`.
#' Includes both simple checkboxes and parent group labels.
#'
#' @format A named list with two elements (`en` and `es`), each containing
#'   approximately 80 named character strings for checkbox labels. Keys follow
#'   the pattern `{category}_{service}` (e.g., `prep_telehealth`).
#'
#' @examples
#' checkbox_translations[["en"]][["prep_telehealth"]]
#' # [1] "Telehealth"
#'
#' checkbox_translations[["es"]][["prep_telehealth"]]
#' # [1] "Telesalud"
#'
#' @family translation data
checkbox_translations <- list(
  en = list(
    # PrEP
    pr_ep = "Offers PrEP",
    prep_can_mail_deliver_meds = "Can mail/deliver medications",
    prep_can_mail_deliver_meds_always = "Always",
    prep_can_mail_deliver_meds_sometimes = "Sometimes",
    prep_cost_coverage = "Cost coverage options",
    prep_medication_at_no_cost = "Medication at no cost",
    prep_other_financial_assistance_available = "Other financial assistance available",
    prep_visits_and_labs_at_no_cost = "Visits and labs at no cost",
    prep_rides = "Free or subsidized rides",
    prep_free_rides = "Free rides",
    prep_sometimes_free_subsidized_rides = "Sometimes free/subsidized rides",
    prep_latino_lgbtq_providers_available = "Latino LGBTQ+ providers available",
    prep_lgbtq_providers_available = "LGBTQ+ providers available",
    prep_new_delivery = "New delivery options",
    prep_injectable_pr_ep_available = "Injectable PrEP available",
    prep_pr_ep_on_demand_2_1_1_available = "PrEP on-demand (2-1-1) available",
    prep_on_site_patient_navigators = "On-site patient navigators",
    prep_services_available_nights_evenings = "Services available nights/evenings",
    prep_site_offers_rapid_pr_ep = "Site offers rapid PrEP",
    prep_spanish_speaking_providers = "Spanish-speaking providers",
    prep_telehealth = "Telehealth",
    prep_walk_in_services = "Walk-in services",

    # PEP
    pep = "Offers PEP",
    pep_can_mail_deliver_meds = "Can mail/deliver medications",
    pep_can_mail_deliver_meds_always = "Always",
    pep_can_mail_deliver_meds_sometimes = "Sometimes",
    pep_cost_coverage = "Cost coverage options",
    pep_medication_at_no_cost = "Medication at no cost",
    pep_other_financial_assistance_available = "Other financial assistance available",
    pep_visits_and_labs_at_no_cost = "Visits and labs at no cost",
    pep_rides = "Free or subsidized rides",
    pep_free_rides = "Free rides",
    pep_sometimes_free_subsidized_rides = "Sometimes free/subsidized rides",
    pep_latino_lgbtq_providers_available = "Latino LGBTQ+ providers available",
    pep_lgbtq_providers_available = "LGBTQ+ providers available",
    pep_on_site_patient_navigators = "On-site patient navigators",
    pep_rapid_same_day = "Rapid or same-day services",
    pep_full_supply_available = "Full supply available",
    pep_starter_packs_available = "Starter packs available",
    pep_services_available_nights_evenings = "Services available nights/evenings",
    pep_spanish_speaking_providers = "Spanish-speaking providers",
    pep_telehealth = "Telehealth",
    pep_walk_in_services = "Walk-in services",

    # HIV Treatment
    hiv_treatment = "Offers HIV treatment",
    hiv_can_mail_deliver_meds = "Can mail/deliver medications",
    hiv_can_mail_deliver_meds_always = "Always",
    hiv_can_mail_deliver_meds_sometimes = "Sometimes",
    hiv_cost_coverage = "Cost coverage options",
    hiv_medication_at_no_cost = "Medication at no cost",
    hiv_other_financial_assistance_available = "Other financial assistance available",
    hiv_visits_and_labs_at_no_cost = "Visits and labs at no cost",
    hiv_rides = "Free or subsidized rides",
    hiv_free_rides = "Free rides",
    hiv_sometimes_free_subsidized_rides = "Sometimes free/subsidized rides",
    hiv_injectable_art_available = "Injectable ART available",
    hiv_latino_lgbtq_providers_available = "Latino LGBTQ+ providers available",
    hiv_lgbtq_providers_available = "LGBTQ+ providers available",
    hiv_patient_navigators = "On-site patient navigators",
    hiv_on_site_patient_navigators = "Patient navigators",
    hiv_on_site_ryan_white_patient_navigators = "Ryan White case managers",
    hiv_rapid_hiv_treatment_available = "Rapid HIV treatment available",
    hiv_services_available_nights_evenings = "Services available nights/evenings",
    hiv_spanish_speaking_providers = "Spanish-speaking providers",
    hiv_telehealth = "Telehealth",
    hiv_walk_in_services = "Walk-in services",

    # Testing
    hiv_testing_confirmatory = "HIV testing (confirmatory)",
    hiv_testing_rapid = "HIV testing (rapid)",
    sti_testing = "STI testing",
    sti_treatment = "STI treatment",

    # Mental Health & Substance Use
    mhsu_can_mail_deliver_meds = "Can mail/deliver medications",
    mhsu_can_mail_deliver_meds_always = "Always",
    mhsu_can_mail_deliver_meds_sometimes = "Sometimes",
    mhsu_cost_coverage = "Cost coverage options",
    mhsu_treatment_is_available_at_no_cost = "Treatment available at no cost",
    mhsu_other_financial_assistance_available = "Other financial assistance available",
    mhsu_rides = "Free or subsidized rides",
    mhsu_free_rides = "Free rides",
    mhsu_sometimes_free_subsidized_rides = "Sometimes free/subsidized rides",
    mhsu_latino_lgbtq_providers_available = "Latino LGBTQ+ providers available",
    mhsu_lgbtq_providers_available = "LGBTQ+ providers available",
    mhsu_mental_health_treatment = "Mental health treatment",
    mhsu_psychiatry_or_psychiatric_medication_management = "Psychiatry/medication management",
    mhsu_services_available_nights_evenings = "Services available nights/evenings",
    mhsu_spanish_speaking_providers = "Spanish-speaking providers",
    mhsu_substance_use = "Substance use treatment",
    mhsu_substance_use_treatment = "Substance use treatment",
    mhsu_support_groups = "Support groups",
    mhsu_telehealth = "Telehealth",
    mhsu_walk_in_services = "Walk-in services",

    # Social Services
    housing_assistance = "Housing assistance",
    immigration_assistance = "Immigration assistance",
    job_training_employment_assistance = "Job training & employment assistance",

    # Additional Services
    dental_care = "Dental care",
    on_site_pharmacy = "On-site pharmacy",
    primary_care = "Primary care",
    free_validating_parking = "Free/validated parking"
  ),

  es = list(
    # PrEP
    pr_ep = "Ofrece PrEP",
    prep_can_mail_deliver_meds = "Puede enviar/entregar medicamentos",
    prep_can_mail_deliver_meds_always = "Siempre",
    prep_can_mail_deliver_meds_sometimes = "A veces",
    prep_cost_coverage = "Opciones de cobertura de costos",
    prep_medication_at_no_cost = "Medicamento sin costo",
    prep_other_financial_assistance_available = "Otra asistencia financiera disponible",
    prep_visits_and_labs_at_no_cost = "Visitas y laboratorios sin costo",
    prep_rides = "Transporte gratis o subsidiado",
    prep_free_rides = "Transporte gratis",
    prep_sometimes_free_subsidized_rides = "A veces transporte gratis/subsidiado",
    prep_latino_lgbtq_providers_available = "Proveedores latinos LGBTQ+ disponibles",
    prep_lgbtq_providers_available = "Proveedores LGBTQ+ disponibles",
    prep_new_delivery = "Nuevas opciones de administración",
    prep_injectable_pr_ep_available = "PrEP inyectable disponible",
    prep_pr_ep_on_demand_2_1_1_available = "PrEP a demanda (2-1-1) disponible",
    prep_on_site_patient_navigators = "Navegadores de pacientes en el sitio",
    prep_services_available_nights_evenings = "Servicios disponibles noches/tardes",
    prep_site_offers_rapid_pr_ep = "El sitio ofrece PrEP rápido",
    prep_spanish_speaking_providers = "Proveedores que hablan español",
    prep_telehealth = "Telesalud",
    prep_walk_in_services = "Servicios sin cita",

    # PEP
    pep = "Ofrece PEP",
    pep_can_mail_deliver_meds = "Puede enviar/entregar medicamentos",
    pep_can_mail_deliver_meds_always = "Siempre",
    pep_can_mail_deliver_meds_sometimes = "A veces",
    pep_cost_coverage = "Opciones de cobertura de costos",
    pep_medication_at_no_cost = "Medicamento sin costo",
    pep_other_financial_assistance_available = "Otra asistencia financiera disponible",
    pep_visits_and_labs_at_no_cost = "Visitas y laboratorios sin costo",
    pep_rides = "Transporte gratis o subsidiado",
    pep_free_rides = "Transporte gratis",
    pep_sometimes_free_subsidized_rides = "A veces transporte gratis/subsidiado",
    pep_latino_lgbtq_providers_available = "Proveedores latinos LGBTQ+ disponibles",
    pep_lgbtq_providers_available = "Proveedores LGBTQ+ disponibles",
    pep_on_site_patient_navigators = "Navegadores de pacientes en el sitio",
    pep_rapid_same_day = "Servicios rápidos o el mismo día",
    pep_full_supply_available = "Suministro completo disponible",
    pep_starter_packs_available = "Paquetes de inicio disponibles",
    pep_services_available_nights_evenings = "Servicios disponibles noches/tardes",
    pep_spanish_speaking_providers = "Proveedores que hablan español",
    pep_telehealth = "Telesalud",
    pep_walk_in_services = "Servicios sin cita",

    # HIV Treatment
    hiv_treatment = "Ofrece tratamiento del VIH",
    hiv_can_mail_deliver_meds = "Puede enviar/entregar medicamentos",
    hiv_can_mail_deliver_meds_always = "Siempre",
    hiv_can_mail_deliver_meds_sometimes = "A veces",
    hiv_cost_coverage = "Opciones de cobertura de costos",
    hiv_medication_at_no_cost = "Medicamento sin costo",
    hiv_other_financial_assistance_available = "Otra asistencia financiera disponible",
    hiv_visits_and_labs_at_no_cost = "Visitas y laboratorios sin costo",
    hiv_rides = "Transporte gratis o subsidiado",
    hiv_free_rides = "Transporte gratis",
    hiv_sometimes_free_subsidized_rides = "A veces transporte gratis/subsidiado",
    hiv_injectable_art_available = "TAR inyectable disponible",
    hiv_latino_lgbtq_providers_available = "Proveedores latinos LGBTQ+ disponibles",
    hiv_lgbtq_providers_available = "Proveedores LGBTQ+ disponibles",
    hiv_patient_navigators = "Navegadores de pacientes en el sitio",
    hiv_on_site_patient_navigators = "Navegadores de pacientes",
    hiv_on_site_ryan_white_patient_navigators = "Administradores de casos Ryan White",
    hiv_rapid_hiv_treatment_available = "Tratamiento rápido del VIH disponible",
    hiv_services_available_nights_evenings = "Servicios disponibles noches/tardes",
    hiv_spanish_speaking_providers = "Proveedores que hablan español",
    hiv_telehealth = "Telesalud",
    hiv_walk_in_services = "Servicios sin cita",

    # Testing
    hiv_testing_confirmatory = "Prueba de VIH (confirmatoria)",
    hiv_testing_rapid = "Prueba de VIH (rápida)",
    sti_testing = "Pruebas de ITS",
    sti_treatment = "Tratamiento de ITS",

    # Mental Health & Substance Use
    mhsu_can_mail_deliver_meds = "Puede enviar/entregar medicamentos",
    mhsu_can_mail_deliver_meds_always = "Siempre",
    mhsu_can_mail_deliver_meds_sometimes = "A veces",
    mhsu_cost_coverage = "Opciones de cobertura de costos",
    mhsu_treatment_is_available_at_no_cost = "Tratamiento disponible sin costo",
    mhsu_other_financial_assistance_available = "Otra asistencia financiera disponible",
    mhsu_rides = "Transporte gratis o subsidiado",
    mhsu_free_rides = "Transporte gratis",
    mhsu_sometimes_free_subsidized_rides = "A veces transporte gratis/subsidiado",
    mhsu_latino_lgbtq_providers_available = "Proveedores latinos LGBTQ+ disponibles",
    mhsu_lgbtq_providers_available = "Proveedores LGBTQ+ disponibles",
    mhsu_mental_health_treatment = "Tratamiento de salud mental",
    mhsu_psychiatry_or_psychiatric_medication_management = "Psiquiatría/manejo de medicamentos",
    mhsu_services_available_nights_evenings = "Servicios disponibles noches/tardes",
    mhsu_spanish_speaking_providers = "Proveedores que hablan español",
    mhsu_substance_use = "Tratamiento de uso de sustancias",
    mhsu_substance_use_treatment = "Tratamiento de uso de sustancias",
    mhsu_support_groups = "Grupos de apoyo",
    mhsu_telehealth = "Telesalud",
    mhsu_walk_in_services = "Servicios sin cita",

    # Social Services
    housing_assistance = "Asistencia de vivienda",
    immigration_assistance = "Asistencia de inmigración",
    job_training_employment_assistance = "Capacitación laboral y asistencia de empleo",

    # Additional Services
    dental_care = "Atención dental",
    on_site_pharmacy = "Farmacia en el sitio",
    primary_care = "Atención primaria",
    free_validating_parking = "Estacionamiento gratis/validado"
  )
)


# Helper Functions ---------------------------------------------------------

#' Get Translation for a Specific Key
#'
#' Core translation lookup function that retrieves translated text from one of
#' the three translation lists based on the specified type. Returns the key
#' itself as a fallback when no translation is found.
#'
#' @param key Character. The lookup key for the translation.
#' @param lang Character. Language code: `"en"` (English) or `"es"` (Spanish).
#'   Default: `"en"`.
#' @param type Character. Translation type: `"ui"`, `"category"`, or
#'
#' @return Character string with translated text, or `key` if not found.
#'
#' @examples
#' get_translation("filter_services", lang = "es", type = "ui")
#' # [1] "Filtrar Servicios"
#'
#' get_translation("prep", lang = "es", type = "category")
#' # [1] "PrEP"
#'
#' @family translation functions
get_translation <- function(key, lang = "en", type = "ui") {

  translations <- switch(
    type,
    "ui" = ui_translations,
    "category" = category_translations,
    "checkbox" = checkbox_translations
  )

  result <- translations[[lang]][[key]]
  if (is.null(result)) key else result
}


#' Get UI Text Translation
#'
#' Convenience wrapper for UI chrome text lookups. Use for buttons, headers,
#' status messages, and other interface elements.
#'
#' @param key Character. UI text key from `ui_translations`.
#' @param lang Character. Language code: `"en"` or `"es"`.
#'
#' @return Character string with translated UI text.
#'
#' @examples
#' t_ui("get_started", "es")
#' # [1] "Comenzar"
#'
#' # In reactive context:
#' # h4(t_ui("filter_services", input$language))
#'
#' @family translation functions
t_ui <- function(key, lang) {
  get_translation(key, lang, "ui")
}


#' Get Category Label Translation
#'
#' Convenience wrapper for service category label lookups. Keys match the
#' category IDs in `service_categories`.
#'
#' @param category_id Character. Category ID (e.g., `"prep"`, `"mhsu"`).
#' @param lang Character. Language code: `"en"` or `"es"`.
#'
#' @return Character string with translated category label.
#'
#' @examples
#' t_category("hiv_treatment", "es")
#' # [1] "Tratamiento del VIH"
#'
#' @family translation functions
t_category <- function(category_id, lang) {
  get_translation(category_id, lang, "category")
}


#' Get Checkbox Label Translation
#'
#' Convenience wrapper for checkbox label lookups. Keys match the checkbox
#' IDs defined in `checkbox_hierarchy`.
#'
#' @param checkbox_id Character. Checkbox ID (e.g., `"prep_telehealth"`).
#' @param lang Character. Language code: `"en"` or `"es"`.
#'
#' @return Character string with translated checkbox label.
#'
#' @examples
#' t_checkbox("prep_walk_in_services", "es")
#' # [1] "Servicios sin cita"
#'
#' @family translation functions
t_checkbox <- function(checkbox_id, lang) {
  get_translation(checkbox_id, lang, "checkbox")
}
