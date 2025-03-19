
# Remove all objects
rm(list = ls())

# Clear the console
cat("\014")

# Import libraries
library(tidyverse)
library(fpp3)

# Load data
df <- readRDS(file.path("data", "df.rds"))
