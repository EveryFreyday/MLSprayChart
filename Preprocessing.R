# Matt Frey
# DATS 6202 - Machine learning project
# Use ML to position MLB defenses

# Main idea
#
# -Develop machine learning based analysis that outputs spray charts by players

# Goals
# 
# -Use random forest or dplyr data science package
# -Shiny App to display

# The libraries I will use

# Analysis
#Matt Frey
#Pull data for Hit location model (hc_x and hc_y)

library(baseballr)
library(tidyverse)
library(openxlsx)
library(dplyr)
library(statcastr)

# devtools::install_github("BillPetti/baseballr")

#
# Pull data
#

# Use this to look up the player you would like to generate a spary chart on, then forecast their hits.
# playerid_lookup("Votto")

player <- scrape_statcast_savant(start_date = "2008-03-25", 
                                 end_date = "2020-09-27", 
                                 playerid = 458015,
                                 player_type = "batter")

# Run this to collapse the dataset to just have these variables
keep <- player[c("game_date", "player_name", "events", "hc_x","hc_y")]

write.xlsx(keep, "/Users/mattfrey/downloads")

