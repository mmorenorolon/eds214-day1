#' Cleaning the Dataframe
#'
#' @param df 
#'
#' @returns clean_data
#' @export
#'
#' @examples 
clean_data <- function(df) {
  df %>% 
    #subsetting the variables needed to carry out the moving average
    select(Sample_ID, Sample_Date, K, Mg, Ca, `NH4-N`, `NO3-N`) %>% 
    
    #convert the data frame to long format
    pivot_longer(cols = c(K, Mg, Ca, `NH4-N`, `NO3-N`), names_to = "stream_ion", 
                 values_to = "ion_conc") %>%
    
    #making sure that the Sample_Date column is in format <date> 
    mutate(Sample_Date = as.Date(Sample_Date)) %>%
    
    #remove rows with NA values
    filter(!is.na(ion_conc), ion_conc >= 0) %>% 
    
    #convert dataframe column names to lowercase_snake format
    clean_names() 
}