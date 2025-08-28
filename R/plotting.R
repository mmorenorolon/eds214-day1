plot_figure <- function(df, x, y) {
  ggplot(df, aes(x, y, color = site_id, linetype = site_id)) +
    geom_line(size = 0.8, alpha = 0.9) +
    facet_wrap(~stream_ion, ncol = 1, scales = "free_y") +
    scale_color_brewer(palette = "Dark2") +
    scale_linetype_manual(values = c(
      "q1" = "dashed",
      "q2" = "dotdash",
      "g3" = "twodash",
      "mpr" = "solid"  # solid line for one stream
    )) +
    labs(
      title = "Ion Concentrations Over Time by Stream",
      x = "Year",
      y = "Concentration",
      color = "site_id",
      linetype = "site_id"
    ) +
    theme_light(base_size = 14) +
    theme(
      strip.text = element_text(face = "bold"),
      legend.position = "bottom",
      panel.spacing = unit(1, "lines")
    )
  
}