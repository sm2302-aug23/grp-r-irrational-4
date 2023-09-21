# Task 2

library(tibble)
library(dplyr)
library(tidyverse)

# Determine gen_collatz

gen_collatz <- function(n) { 
  if (n <= 0 || !is.integer(n)) {
    stop("Input must be positive")
  }
  
  collatz_seq <- c(n)
  
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n/2
    } else {
      n <- 3 * n + 1
    }
    collatz_seq <- c(collatz_seq, n)
  }
  
  return(collatz_seq)
}


# Categorize the collatz_df tibble by sequence length 
initial_int <- 1:10000
sequences <- lapply(initial_int, gen_collatz)

sorted_collatz_df <- collatz_df %>%
  mutate(seq_len = lengths(sequences)) %>%
  arrange(desc(seq_len))

#Q1
# The top initial integers
initial_int <- 1:10000

top10longest <- sorted_collatz_df %>%
  select(initial_int, seq_len) %>%
  head(10)

# Printing Q1
print(top10longest)

#Q2 
# Determine the initial integer with the highest max value
max_val_int <- collatz_df %>%
  mutate(max_value = sapply(sequence, max)) %>%
  filter(max_value == max(max_value))  %>%
  select(initial_int, max_value)

# Printing Q2
print(max_val_int)


#Q3
# Construct a new column to group even and odd initial integers
collatz_df <- collatz_df %>%
  mutate(even_odd = ifelse(initial_int %% 2 == 0, "even", "odd"))

# Determine the avg length and standard deviation 
even_odd_stats <- collatz_df %>%
  group_by(even_odd) %>%
  summarize(
    avg_len = mean(lengths(sequence)),
    sd_len = sd(lengths(sequence))
  )

# Printing Q3
print(even_odd_stats)












