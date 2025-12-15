# Start script - launches Shiny app with browser support across platforms
# Handles WSL, Mac, Linux, and Windows

# Detect WSL and set appropriate browser
if (Sys.info()["sysname"] == "Linux" && grepl("microsoft|wsl", tolower(Sys.info()["release"]))) {
  if (Sys.which("wslview") != "") {
    options(browser = "wslview")
  } else {
    # Fallback: use PowerShell to open URL
    options(browser = function(url) {
      system(paste0('powershell.exe -Command "Start-Process ', shQuote(url), '"'))
    })
  }
}

# Run the app
shiny::runApp(launch.browser = TRUE)
