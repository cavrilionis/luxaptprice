
# Remove all objects
rm(list = ls())

# Clear the console
cat("\014")

# Import libraries
library(tidyverse)
library(fpp3)

# Load data
df <- readRDS(file.path("data", "df.rds"))

View(df)

min_year <- min(df$Annee)
min_year

max_year <- max(df$Annee)
max_year

num_years <- length(seq(min_year, max_year))
num_years

# Determine which communes have missing data
# in the entire series of Prix_moyen_appart_construits

commune_empty_ts <- df %>%
  group_by(Commune) %>% 
  summarise(cnt_missing = sum(is.na(Prix_moyen_appart_construits))) %>%
  ungroup() %>%
  mutate(num_years = num_years,
         action = ifelse(cnt_missing == num_years, "delete", "keep")) %>%
  filter(action == "delete") %>%
  distinct(Commune)

commune_empty_ts <- commune_empty_ts$Commune

df2 <- df %>%
  filter(!Commune %in% commune_empty_ts)

nrow(df)
nrow(df2)

View(df)
View(df2)
