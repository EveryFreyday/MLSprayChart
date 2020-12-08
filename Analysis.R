# Matt Frey
# DATS 6202 - Machine learning project
# Use ML to position MLB defenses

# Exploratory Analysis

library(dplyr)
library(ggplot2)
library(caTools)
library(corrgram)
library(readr)
library(MASS)

# Read in data
rawclean <- read_csv("~/MLSprayChart/rawclean.csv")

keep <- rawclean[c("hc_x","hc_y")]

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

#Split data
sampleSplit <- sample.split(Y=keep$hc_x, SplitRatio=0.7)
trainSet <- subset(x=keep, sampleSplit==TRUE)
testSet <- subset(x=keep, sampleSplit==FALSE)

model <- lm(keep$hc_x ~. , data=trainSet)
