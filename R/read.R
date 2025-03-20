
# Remove all objects
rm(list = ls())

# Clear the console
cat("\014")

# Import libraries
library(tidyverse)
library(readxl)

files <- as_tibble(list.files(path = "./data", pattern = "\\d{4}\\.xls$")) %>%
  rename(file = value)

ranges <- read_csv(file.path("data", "ranges.csv"), show_col_types = FALSE)

files <- inner_join(files, ranges, by = join_by(file))

col_names <- c("Commune",
               "Nombre_ventes_appart_construits",
               "Prix_moyen_appart_construits",
               "Fourchette_prix_appart_construits",
               "Nombre_VEFA",
               "Prix_moyen_VEFA",
               "Fourchette_prix_VEFA")

df <- tibble()

for (i in seq_len(nrow(files))) {
  df_temp <- read_xls(
    path = file.path("data", files[i, 1][[1, 1]]),
    sheet = 1,
    range = files[i, 2][[1, 1]],
    col_names = col_names,
    col_types = NULL,
    na = "*",
    trim_ws = TRUE,
    skip = 0,
    progress = readxl_progress(),
    .name_repair = "unique"
  )

  df_temp <- df_temp %>%
    mutate(Annee = substr(files[i, 1][[1, 1]], 50, 53)) %>%
    relocate(Annee) %>%
    select(-Fourchette_prix_appart_construits, -Fourchette_prix_VEFA)

  df <- bind_rows(df, df_temp)
}

df <- df %>%
  mutate(Annee = as.integer(Annee)) %>%
  arrange(Commune, Annee)

saveRDS(df, file.path("data", "df.rds"))
