#Matt Frey
#Pull data for Hit location model (hc_x and hc_y)

library(baseballr)
library(tidyverse)
library(openxlsx)
library(dplyr)
library(statcastr)

devtools::install_github("BillPetti/baseballr")

#
# Pull data
#

# Use this to look up the player you would like to generate a spary chart on, then forecast their hits.
# playerid_lookup("Votto")

player <- scrape_statcast_savant(start_date = "2020-07-23", 
                            end_date = "2020-09-27", 
                            playerid = 458015,
                            player_type = "batter")

# Run this to collapse the dataset to just have these variables
keep <- player[c("player_name", "events", "hc_x","hc_y")]

write.xlsx(keep, "/Users/mattfrey/downloads")

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

#
# Pull larger set of data for model prep
#

