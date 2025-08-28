# List of required packages
packages <- c(
  "tidyverse",
  "here",
  "janitor",
  "lubridate", 
  "ggplot2"
)

# Load them
invisible(lapply(packages, library, character.only = TRUE))
