# Health Services Referral Database

A Shiny web application for exploring HIV and health services across healthcare sites in South Florida. Users can filter by service categories (PrEP, PEP, HIV treatment, STI testing, mental health, etc.) to find sites that meet their needs. Supports English and Spanish.

## Requirements

[R](https://cran.r-project.org/) 4.0+ required. Install packages:

```r
install.packages(c(
  'tidyverse', 'shiny', 'bslib', 'janitor',
  'reactable', 'shinyjs', 'glue', 'readxl'
))
```

## Running the App

```r
shiny::runApp()
```

Or from RStudio: open `app.R` and click "Run App".

### Alternative: npm workflow

If you have [Node.js](https://nodejs.org/) installed:

```bash
npm install        # JS dev dependencies
npm run setup      # Install R packages (skips existing)
npm start          # Launch app
```

## Usage

1. Use sidebar filters to select services
2. Browse the table of matching sites
3. Click a site row to view full details
4. Clear filters with 'Clear All Filters' button

## Data

Site data is stored in `data/Juntos_data_english.xlsx`. This Excel file contains healthcare site information and services offered.

## Development

JavaScript linting and tests require Node.js:

```bash
npm install        # Install dev dependencies
npm run build      # Run lint + tests
```

CI runs automatically on pushes and PRs to `main` and `bilingual` branches.
