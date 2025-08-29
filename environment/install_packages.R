#List of packages that are required for this project
packages <- c(
  "lubridate",
  "here",
  "tidyverse",
  "janitor",
  "ggplot2"
)

#' Function to install and load any missing packages
#'
#' @param package #list vector
#'
#' @returns message indicating successful download and loading of the package
#' @export
#'
#' @examples
install_load_pckg <- function(package) {
  
  #if package is not downloaded, download and load
  if (!requireNamespace(package)) {
    
    install.packages(package, dependencies = TRUE)
    library(package, character.only = TRUE) #input is of type 'character'
    print(paste0(package, " was succesfully installed and loaded."))
    #
  } else {
    #If already installed, load it only
    library(package, character.only = TRUE)
    print(paste0(package, " has been loaded."))
  }
}

# Install and load each package
lapply(packages, install_load_pckg)

