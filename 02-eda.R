library(tidyverse)

#Task 2

#Create a function to generate Collatz Sequences:
generate_collatz_sequence <- function(initial_int) {
  sequence <- c(initial_int)
  
  while (initial_int != 1) {
    if (initial_int %% 2 == 0) {
      initial_int <- initial_int / 2
    } else {
      initial_int <- 3 * initial_int + 1
    }
    sequence <- c(sequence, initial_int)
  }
  
  return(sequence)
}

#Generate Collatz sequences

# Construct the range of integers
initial_integers <- 1:10000

# Generate Collatz sequences for each initial integer and keep them in a data frame
collatz_df <- tibble(
  initial_int = initial_integers,
  sequence = map(initial_integers, generate_collatz_sequence)
)

#Q1-------------
# Determine the lengths of the sequences
collatz_df <- collatz_df %>%
  mutate(sequence_length = map_dbl(sequence, ~length(.))) %>%
  arrange(desc(sequence_length))

# top 10 starting integers
top10longest <- collatz_df %>%
  head(10)

#Q2-----------------------
# Determine the max value of each sequence and find the initial integer with the highest max
max_val_int <- collatz_df %>%
  mutate(max_value = map_dbl(sequence, ~max(.))) %>%
  filter(max_value == max(max_value)) %>%
  select(initial_int)

#Q3----------
# Create a new variable to group initial integers as even or odd
collatz_df <- collatz_df %>%
  mutate(is_even = initial_int %% 2 == 0)

# Determine the average length and standard deviation for even and odd integers
even_odd_stats <- collatz_df %>%
  group_by(is_even) %>%
  summarize(
    avg_len = mean(sequence_length),
    sd_len = sd(sequence_length)
  )

# Generating the outcome
even_odd_avg_len <- even_odd_stats %>%
  pull(avg_len)

even_odd_sd_len <- even_odd_stats %>%
  pull(sd_len)













