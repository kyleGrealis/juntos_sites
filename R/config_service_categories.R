# Service category configuration (labels and colors)
# Column definitions are now in config_checkbox_hierarchy.R

service_categories <- list(
  prep = list(
    label = "PrEP",
    color = "#0d6efd"  # Bootstrap primary blue
  ),
  pep = list(
    label = "PEP",
    color = "#6610f2"  # Bootstrap purple
  ),
  hiv_treatment = list(
    label = "HIV Treatment",
    color = "#d63384"  # Bootstrap pink
  ),
  testing = list(
    label = "HIV/STI Testing",
    color = "#fd7e14"  # Bootstrap orange
  ),
  mhsu = list(
    label = "Mental Health & Substance Use",
    color = "#198754"  # Bootstrap success green
  ),
  social_services = list(
    label = "Social Services",
    color = "#0dcaf0"  # Bootstrap info cyan
  ),
  additional = list(
    label = "Additional Services",
    color = "#6c757d"  # Bootstrap secondary gray
  )
)

# Derive all service columns from checkbox hierarchy
all_service_cols <- get_all_column_ids(checkbox_hierarchy)
