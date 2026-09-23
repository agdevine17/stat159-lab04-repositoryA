raw_df <- read.csv(data/transavtions.csv)

raw_df %>%
  summarise(across(everything(), ~ sum(is.na(.))))
raw_df <- raw_df %>%
  drop_na(Store_ID)
