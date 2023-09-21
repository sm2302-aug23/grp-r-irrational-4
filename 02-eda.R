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

even_odd_stats <- collatz_df %>%
  group_by(parity) %>%
  summarize(
    even_odd_avg_len = mean(length),
    even_odd_sd_len = sd(length)
  )