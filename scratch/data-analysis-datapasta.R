source("R/moving_average.R")
#load packages
library(stringr)
library(lubridate)
library(tidyverse)
library(here)
library(janitor)

#read in data

Q1_raw <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"),
               na = c("", "NA", "NULL"))
Q2_raw <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"),
                   na = c("", "NA", "NULL"))
Q3_raw <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"),
         na = c("", "NA", "NULL"))
PRM_raw <- read_csv(here("data", "RioMameyesPuenteRoto.csv"),
                    na = c("", "NA", "NULL"))

#Join the data
data_joined <- bind_rows(list(Q1_raw, Q2_raw, Q3_raw, PRM_raw))

#clean the data

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

#Calculate the weekly average of each parameter by stream
data_weekly <- data_clean %>% 
  group_by(sample_id, parameter, sample_week) %>% 
  summarise(weekly_mean = round(mean(concentration, na.rm = TRUE), 2)) %>% 
  ungroup()

#approach 1 to calculating moving average:

  #create an empty column to store in 
moving_avg <- vector(mode = "numeric", length = length(data_weekly))
  #defining moving average width f 9 weeks
window_size <- 9

i <- 1 #starting index
  
  # a loop to iterate through every moving 9 weeks.

for (i in (1:length(data_weekly) - window_size + 1)) {
  
  window <- data_weekly$weekly_mean[i : i + window_size]
  #Attempting to calculate the moving average
  #the elements in the dataframe to call the interval we want
  window_avg <- round(sum(window[i:i + window_size], 
                          na.rm = TRUE) / 
                            window_size, 2)
  
  #store values in the empty vector
  data_weekly$moving_avg[i] <- window_avg
  
  # Shift the starting value in interval to the right by one position
  i + 1
  
  print(moving_avg)
} 

# Approach 2 to calculating moving average
library(zoo)

data_weekly %>% 
  rollmean(data_weekly$k = 9, fill = , align = "left")

# Approach 3


