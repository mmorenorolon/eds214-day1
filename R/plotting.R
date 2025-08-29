#' Time-series plots of ion concentrations
#'The purpose of this function is to plot the processed data and use the moving averages that were obtained to create the output of Figure 3. 
#' @param df A data frame containing the following columns:
#'            sample_date: Date of sample collection (class: Date)
#'            stream_ma: Moving average concentration values (numeric)
#'            site_id: Identifier for each sampling site (character)
#'            stream_ion: Ion name (character) that is used for faceting
#' @returns the ggplot object showing the faceted time-series plot
#'
#' @export
#'
#' @examples
plot_figure3 <- function(df) {
  ggplot(df, aes(x = sample_date, y = stream_ma, color = site_id)) +
    
    #plot smoothed ion concentrations over time for each site
    geom_line(na.rm = FALSE) +
    
    #vertical reference line for Hurricane Hugo (Sept 18, 1989)
    geom_vline(xintercept = as.Date("1989-09-18"), linetype = "dashed", color = "black") +
    
    #create separate panels for each ion and stack vertically
    facet_wrap(~ stream_ion, scales = "free_y", ncol =1,
    
               #show y axis names on the left side of the plot
               strip.position = "left") + 
    #axis labels
    labs(
      x = "Years",
      y = "Moving Average Concentration"
    ) +
    theme_light() +
  
  #remove spacing and gridlines for clarity
  theme(panel.spacing = unit(0, "lines"),#get rid of spacing between plots
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        legend.title = element_blank()) #remove legend title
}
