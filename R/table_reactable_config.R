# Reactable table configuration for sites table

create_sites_reactable <- function(table_data, lang = "en") {
  reactable(
    table_data,
    selection = "single",
    onClick = "select",
    # Show all rows (no pagination)
    defaultPageSize = nrow(table_data),
    pagination = FALSE,
    searchable = TRUE,
    highlight = TRUE,
    bordered = TRUE,
    striped = TRUE,
    compact = FALSE,
    # Dynamic height to fill viewport
    height = "calc(100vh - 340px)",
    theme = reactableTheme(
      borderColor = "#dfe2e5",
      highlightColor = "#f0f5ff",
      cellPadding = "8px 12px",
      style = list(fontSize = "13px")
    ),
    defaultColDef = colDef(
      headerStyle = list(
        background = "#f8f9fa",
        fontWeight = 600,
        fontSize = "13px"
      )
    ),
    columns = list(
      `Site Name` = colDef(
        name = t_ui("col_site_name", lang),
        minWidth = 200,
        style = list(fontWeight = 500)
      ),
      Organization = colDef(
        name = t_ui("col_organization", lang),
        minWidth = 180
      ),
      Jurisdiction = colDef(
        name = t_ui("col_jurisdiction", lang),
        minWidth = 120
      ),
      Address = colDef(
        name = t_ui("col_address", lang),
        minWidth = 250
      )
    )
  )
}
