# Matt Frey
# DATS 6202 - Machine learning project
# Use ML to position MLB defenses

# Exploratory Analysis

# generate player's spray chart for 2020

#creat variable which is a vector of colors
values=c("#CC0000", "#006600", "#669999", "#00CCCC", 
         "#660099", "#CC0066", "#FF9999", "#FF9900", 
         "black", "black", "black", "black", "black")

ggspraychart(
  keep,
  x_value = "hc_x",
  y_value = "-hc_y",
  fill_value = "events",
  fill_palette = values,
  fill_legend_title = NULL,
  density = FALSE,
  bin_size = 15,
  point_alpha = 0.75,
  point_size = 2,
  frame = NULL
) + ggtitle(keep$player_name)

# Model Training

set.seed(42)



