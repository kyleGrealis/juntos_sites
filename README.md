# Juntos Referral Database

A Shiny web application for exploring HIV and health services across healthcare
sites in South Florida.

## What It Does

This app helps users find healthcare sites offering specific services like PrEP,
PEP, HIV treatment, STI testing, mental health services, and more. Filter by
service categories to narrow down sites that meet your needs, view detailed
information about each location, and access contact information.

## Requirements

### R Version

R 4.0 or higher recommended.

### Required Packages

Install all required packages with:

```r
install.packages(c(
  "tidyverse",
  "shiny",
  "bslib",
  "janitor",
  "reactable",
  "shinyjs",
  "glue",
  "readxl"
))
```

| Package     | Purpose                                      |
|-------------|----------------------------------------------|
| tidyverse   | Data manipulation (dplyr, tidyr, stringr)    |
| shiny       | Web application framework                    |
| bslib       | Bootstrap 5 theming                          |
| janitor     | Data cleaning utilities                      |
| reactable   | Interactive data tables                      |
| shinyjs     | JavaScript operations in Shiny               |
| glue        | String interpolation                         |
| readxl      | Read Excel files                             |

## Running the App

From the project directory:

```r
# Option 1: Using shiny::runApp()
shiny::runApp()

# Option 2: Run on a specific port
shiny::runApp(port = 3838)

# Option 3: From RStudio
# Open app.R and click "Run App"
```

The app will open in your default web browser.

## How to Use

1. Use the sidebar filters to select services you're interested in
2. Browse the table of matching sites
3. Click on any site row and press "View [Site Name]" to see full details
4. Clear filters anytime with the "Clear All Filters" button

## Project Structure

```
juntos_site/
├── app.R                 # App entry point
├── R/
│   ├── _libraries.R      # Package imports and options
│   ├── config_*.R        # Service definitions and categories
│   ├── server.R          # Server logic
│   ├── ui.R              # UI definition
│   ├── ui_*.R            # UI helper functions
│   ├── table_*.R         # Table configuration and data
│   └── utils.R           # Utility functions
├── data/
│   └── Juntos_data_english.xlsx  # Site data
└── www/
    ├── custom.css        # Custom styles
    └── checkbox_handlers.js  # JavaScript for checkbox behavior
```

## Data

The app reads site data from `data/Juntos_data_english.xlsx`. This Excel file
contains information about healthcare sites and the services they offer.
