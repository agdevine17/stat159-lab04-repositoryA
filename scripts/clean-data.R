library(tidyverse)
raw_df <- read.csv("data/transactions.csv")

raw_df %>%
  summarise(across(everything(), ~ sum(is.na(.))))

clean_df <- raw_df %>%
 drop_na(Store_ID)

clean_df <- clean_df %>%
  group_by(Units_Sold) %>%
  mutate(
    Revenue = if_else(
      is.na(Revenue),
      median(Revenue, na.rm = TRUE),
      Revenue
    )
  ) %>%
  ungroup()

overall_median <- median(clean_df$Revenue, na.rm = TRUE)
clean_df <- clean_df %>%
  mutate(
    Revenue = if_else(
      is.na(Revenue),
      overall_median,
      Revenue
    )
  )
clean_df %>%
  summarise(across(everything(), ~ sum(is.na(.))))

write_csv(clean_df, "data/transactions_clean.csv")