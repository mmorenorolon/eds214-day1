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
