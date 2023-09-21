<<<<<<< HEAD
# Finding the library
library(tibble)
library(tidyverse)

# Collatz Function 
gen_collatz <- function(n) {
  if (n <- 0 || !is.integer(n)) {
    stop("Input must a positive input")
  }
  
  collatz_seq <- c(n)
  
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n/2
    } else {
      n <- 3*n +1
    }
    collatz_seq <- c(collatz_seq, n)
  }
  
  # Returning the collatz sequence  
  return(collatz_seq)
}

# Collatz Sequence Tibble (with its start values and sequences)
start_values <- 1:10000
sequences <- lapply(start_values, gen_collatz)

collatz_df <- tibble(
  start = start_values,
  seq = sequences,
  length = lengths(sequences),
  parity = ifelse(start_values %% 2 == 0, "Even", "Odd"),
  max_val = sapply(sequences, max)
)

# Printing Collatz_df using head()
head(collatz_df)



# TASK 2 

top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  head(10)

max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  slice(1)

=======


# Create a tibble with integers from 1 to 10,000 and generate Collatz sequences
collatz_df <- tibble(start = 1:10000) %>%
  mutate(seq = map(start, gen_collatz))

# Calculate additional columns: length, parity, max_val
collatz_df <- collatz_df %>%
  mutate(
    length = map_dbl(seq, length),
    parity = if_else(start %% 2 == 0, "Even", "Odd"),
    max_val = map_dbl(seq, max)
  )

# Question 1: Find the top 10 starting integers that produce the longest sequences [top10longest].
top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  slice(1:10)

# Question 2: Find out which starting integer produces a sequence that reaches the highest maximum value [max_val_int].
max_val_int <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start)

# Question 3: Calculate the average length and standard deviation of the sequence for even and odd starting integers.
>>>>>>> fc8632292b3d41bdc65f468cddb6652d7383c6c9
even_odd_stats <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(length),
    even_odd_sd_len = sd(length)
<<<<<<< HEAD
  )
=======
  )

# Extract the results
even_odd_avg_len <- even_odd_stats$even_odd_avg_len
even_odd_sd_len <- even_odd_stats$even_odd_sd_len








>>>>>>> fc8632292b3d41bdc65f468cddb6652d7383c6c9
