source("R/moving_average.R")

# Load packages
library(stringr)
library(lubridate)
library(tidyverse)
library(here)
library(janitor)

#creating function for loading packages
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}
  

# In data

q1_raw <- read_csv(here("raw_data", "QuebradaCuenca1-Bisley.csv"))
q2_raw <- read_csv(here("raw_data", "QuebradaCuenca2-Bisley.csv"),
                   na = c("", "NA", "NULL"))
q3_raw <- read_csv(here("raw_data", "QuebradaCuenca3-Bisley.csv"),
         na = c("", "NA", "NULL"))
prm_raw <- read_csv(here("raw_data", "RioMameyesPuenteRoto.csv"),
                    na = c("", "NA", "NULL"))

# Join the data
data_joined <- bind_rows(list(q1_raw, q2_raw, q4_raw, prm_raw))

# Clean the data

        #defining column list to pivot longer
parameters <- c("NO3-N", "K", "Mg", "Ca", "NH4-N")


      #use joined data to subset into desired parameters, use pivot_longer() to
      #be able to group into the parameters more easily, and clean names
data_clean <- data_joined %>% 
  select(Sample_ID, Sample_Date, K, Mg, Ca, `NH4-N`, `NO3-N`) %>% 
  pivot_longer(cols = all_of(parameters), names_to = "parameter", 
               values_to = "concentration") %>% 
  mutate(week_number = isoweek(Sample_Date),
         year = year(Sample_Date),
         #I'm trying to see if making a year and week number column
         #will help iterate through the weeks moving average
         sample_week = paste0(year, "_", week_number)) %>% 
  clean_names() 
    #I want to move the new columns after the sample_date column

#q1
q2_raw %>% 
  select(Sample_ID, Sample_Date, K, Mg, Ca, `NH4-N`, `NO3-N`) %>% 
  pivot_longer(cols = c(K, Mg, Ca, `NH4-N`, `NO3-N`), names_to = "stream_ion", 
               values_to = "ion_conc") %>%
  mutate(Sample_Date = as.Date(Sample_Date)) %>%
  filter(!is.na(ion_conc), ion_conc >= 0) %>% 
  clean_names()

# Function

window_size <- 9

moving_average <- function(focal_date, dates, conc, win_size_wks) {
  is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
    (dates < focal_date + (win_size_wks / 2) * 7)
  window_conc <- conc[is_in_window]
  result <- mean(window_conc)
  return(result)
}


#plotting
 
  
plot_figure3 <- function(df) {
  ggplot(df, aes(x = sample_date, y = stream_ma, color = site_id)) +
    geom_line(na.rm = FALSE) +
    geom_vline(xintercept = as.Date("1989-09-18"), linetype = "dashed", color = "black") +  #marking the date that Hurricane Hugo struck Puerto Rico
    facet_wrap(~ stream_ion, scales = "free_y", ncol =1,
               strip.position = "left") +   # stack plots vertically and show y axis names on the left side of the plot. 
    labs(
      x = "Years",
      y = "Moving Average Concentration"
    ) +
    theme_light() +
    theme(panel.spacing = unit(0, "lines"),#get rid of spacing between plots
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()) 
}

