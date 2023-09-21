library(tibble)
library(dplyr)

# Assuming you already have the collatz_df tibble from Step 1

top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  slice(1:10)

max_val_int <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start)

even_odd_stats <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(length),
    even_odd_sd_len = sd(length)
  )

# Extract the results
even_odd_avg_len <- even_odd_stats$even_odd_avg_len
even_odd_sd_len <- even_odd_stats$even_odd_sd_len


