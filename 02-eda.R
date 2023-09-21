library(tibble)
library(dplyr)

# Create a data frame with integers from 1 to 10,000
collatz_df <- tibble(start = 1:10000) %>%
  mutate(seq = map(start, gen_collatz))

# Calculate additional columns: length, parity, max_val
collatz_df <- collatz_df %>%
  mutate(
    length = map_dbl(seq, length),
    parity = if_else(start %% 2 == 0, "Even", "Odd"),
    max_val = map_dbl(seq, max)
  )

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

even_odd_avg_len <- even_odd_stats$even_odd_avg_len
even_odd_sd_len <- even_odd_stats$even_odd_sd_len









