# Juntos Referral Database

A Shiny web application for exploring HIV and health services across healthcare sites in South Florida. Users can filter by service categories (PrEP, PEP, HIV treatment, STI testing, mental health, etc.) to find sites that meet their needs.

## Requirements

R 4.0 or higher recommended.

Install required packages:

```r
install.packages(c(
  'tidyverse',
  'shiny',
  'bslib',
  'janitor',
  'reactable',
  'shinyjs',
  'glue',
  'readxl'
))
```

## Running the App

From the project directory:

```r
# Using shiny
shiny::runApp()

# From RStudio: Open app.R and click 'Run App'
```

The app will open in your default web browser.

## Usage

1. Use sidebar filters to select services
2. Browse the table of matching sites
3. Click a site row and press 'View [Site Name]' for full details
4. Clear filters with 'Clear All Filters' button

## Data

Site data is stored in `data/Juntos_data_english.xlsx`. This Excel file contains healthcare site information and services offered.
