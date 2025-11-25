# Reactable table configuration for sites table

create_sites_reactable <- function(table_data) {
  reactable(
    table_data,
    selection = "single",
    onClick = "select",
    defaultPageSize = nrow(table_data),
    pagination = FALSE,
    searchable = TRUE,
    highlight = TRUE,
    bordered = TRUE,
    striped = TRUE,
    compact = FALSE,
    height = "calc(100vh - 280px)",
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
        minWidth = 200,
        style = list(fontWeight = 500)
      ),
      Organization = colDef(minWidth = 180),
      Jurisdiction = colDef(minWidth = 120),
      Address = colDef(minWidth = 250),
      Services = colDef(
        width = 100,
        align = "center",
        style = function(value) {
          color <- if (value >= 20) {
            "#198754"
          } else if (value >= 10) {
            "#0dcaf0"
          } else {
            "#6c757d"
          }
          list(fontWeight = 600, color = color)
        }
      )
    )
  )
}
