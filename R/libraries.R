library(tidyverse)
library(shiny)
library(bslib)
library(janitor)
library(reactable)
library(shinyjs)
library(glue)
library(readxl)

# set output options
shiny::devmode(devmode = TRUE)
options(bslib.color_contrast_warnings = FALSE)
options(bslib.precompiled = TRUE)
options(sass.cache = TRUE)
options(shiny.minified = TRUE)

# Helper function to create human-readable labels from column names
format_service_label <- function(col_name) {
  col_name |>
    str_remove("^(prep|pep|hiv|mhsu|sti)_") |>
    str_replace_all("_", " ") |>
    str_to_title()
}
