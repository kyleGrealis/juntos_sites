# Setup script - installs missing R packages only
# Run with: Rscript scripts/setup.R

required_packages <- c(
  "tidyverse",
  "shiny",
  "bslib",
  "janitor",
  "reactable",
  "shinyjs",
  "glue",
  "readxl"
)

# Find which packages are missing
installed <- rownames(installed.packages())
missing <- required_packages[!required_packages %in% installed]

if (length(missing) == 0) {
  message("All required packages are already installed.")
} else {
  message("Installing missing packages: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
  message("Done.")
}
