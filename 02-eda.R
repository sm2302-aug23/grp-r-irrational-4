# Task 2

library(tidyverse)


# Question 1: Find the top 10 starting integers that produce the longest sequences
top10longest <- collatz_df %>%
  mutate(seq_length = lengths(seq)) %>%
  arrange(desc(seq_length)) %>%
  head(10)

# Calculate the number of rows in top10longest
num_rows <- nrow(top10longest)

# Print the number of rows in top10longest
cat("Number of rows in top10longest:", num_rows, "\n")

# Saving the R object
saveRDS(top10longest, "top10longest.RDS")

# Question 2: Find out which starting integer produces a sequence that reaches the highest maximum value
max_val_int <- collatz_df %>%
  mutate(max_value = sapply(seq, max)) %>%
  filter(max_value == max(max_value))

# Calculate the number of rows in max_val_int
num_rows_max_val_int <- nrow(max_val_int)

# Print the number of rows in max_val_int
cat("Number of rows in max_val_int:", num_rows_max_val_int, "\n")

# Save the R object
saveRDS(max_val_int, "max_val_int.RDS")

# Question 3: Calculate the average length and standard deviation of the sequence for even starting integers compared to odd ones
# Calculate even_odd_summary
even_odd_summary <- collatz_df %>%
  mutate(is_even = start %% 2 == 0) %>%
  group_by(is_even) %>%
  summarize(
    even_odd_avg_len = mean(lengths(seq)),
    even_odd_sd_len = sd(lengths(seq))
  )

# Calculate the number of rows in even_odd_summary
num_rows <- nrow(even_odd_summary)

# Print the number of rows in even_odd_summary
cat("Number of rows in even_odd_summary:", num_rows, "\n")

# Save the R object
saveRDS(even_odd_summary, "even_odd_summary.RDS")





