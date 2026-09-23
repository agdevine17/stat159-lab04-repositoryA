library(tidyverse)

set.seed(42)
df <- tibble(
  Transaction_ID = 1001:1100,
  Store_ID = sample(c("Store_A", "Store_B", "Store_C", NA), 100, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1)),
  Revenue = sample(c(50, 120, 250, 500, NA), 100, replace = TRUE, prob = c(0.3, 0.4, 0.15, 0.10, 0.05)),
  Units_Sold = sample(1:12, 100, replace = TRUE)
)
write_csv(df, "data/transactions.csv")