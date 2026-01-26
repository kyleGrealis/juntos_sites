suppressPackageStartupMessages({
  library(brand.yml)
  library(bslib)
  library(glue)
  library(janitor)
  library(reactable)
  library(readxl)
  library(shiny)
  library(shinyjs)
  library(tidyverse)
  library(yaml)
})

# set output options
# shiny::devmode(devmode = TRUE)
options(bslib.color_contrast_warnings = FALSE)
options(bslib.precompiled = TRUE)
options(sass.cache = TRUE)
options(shiny.minified = TRUE)
