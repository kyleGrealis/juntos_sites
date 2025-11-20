# Juntos Referral Database

ui <- build_ui(all_service_cols)
server <- build_server(all_service_cols)

shinyApp(ui = ui, server = server)
