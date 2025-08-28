#' Clean Dataframe
#'
#' @param df 
#'
#' @returns clean_data
#' @export
#'
#' @examples 
clean_data <- function(df) {
  df %>% 
    select(Sample_ID, Sample_Date, K, Mg, Ca, `NH4-N`, `NO3-N`) %>% 
    pivot_longer(cols = c(K, Mg, Ca, `NH4-N`, `NO3-N`), names_to = "stream_ion", 
                 values_to = "ion_conc") %>%
    mutate(Sample_Date = as.Date(Sample_Date)) %>%
    filter(!is.na(ion_conc), ion_conc >= 0) %>% 
    clean_names() 
}