library(tidyverse)
library(purrr)

# Task 1  01-gen_collatz.R

gen_collatz <- function(n) {
  if (n <= 0 || !is.integer(n)) {
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

start_values <- 1:10000
sequences <- lapply(start_values, gen_collatz)

collatz_df <- tibble(
  start = start_values,
  seq = sequences
)

# question 1. ------------------------------------------------------------------
# function to check if backtracking seq exists
contain_backtrack <- function(sequence) {
  decreasing <- FALSE
  last_value <- sequence[1]
  
  for (value in sequence[-1]) {
    if (value < last_value) {
      decreasing <- TRUE
    } else if (value > last_value && decreasing) {
      return(TRUE)  # contains backtracking
    }
    last_value <- value
  }
  return(FALSE)  # no backtracking
}

# Filter collatz_df to retain starting int that exhibit backtracking in seqs
backtracks_df <- collatz_df %>%
  mutate(has_backtrack = map_lgl(seq, contain_backtrack)) %>% 
  filter(has_backtrack)

# print backtracks_df data frame
print(backtracks_df)


# question 2 -------------------------------------------------------------------
# Function to calculate the number of times a sequence goes above starting int
above_start_count <- function(sequence) {
  count <- 0
  max_value <- sequence[1]
  
  for (value in sequence[-1]) {
    if (value > max_value) {
      max_value <- value
      count <- count + 1
    }
  }
  return(count)
}

# the number of times each backtracking seq goes above starting int
backtracks_df <- backtracks_df %>%
  mutate(above_start_count = map_int(seq, above_start_count))

# the mode of above_start_count for backtracking seqs
mode_backtrack <- backtracks_df %>%
  summarise(mode_backtrack = as.integer(
    names(
      sort(
        table(above_start_count),
        decreasing = TRUE)[1])))

# Print the most frequent occurring number of times
print(mode_backtrack)


# question 3 -------------------------------------------------------------------
# function to find the maximum value after the first backtrack
max_after_backtrack <- function(sequence) {
  max_val <- sequence[1]
  reached_backtrack <- FALSE
  
  for (value in sequence[-1]) {
    if (value > max_val) {
      max_val <- value
    } else if (value < max_val && !reached_backtrack) {
      reached_backtrack <- TRUE
    }
    
    if (reached_backtrack && value > max_val) {
      max_val <- value
    }
  }
  
  return(max_val)
}

# Calculate the maximum value reached after first backtrack for each seq
backtracks_df <- backtracks_df %>%
  mutate(max_after_backtrack = map_int(seq, max_after_backtrack))

# Print backtracks_df data frame with the new column
print(backtracks_df)


# question 4 -------------------------------------------------------------------
# Are backtracking sequences more common among even or odd starting integers?

gen_collatz_seq <- function(start) {
  sequence <- c(start)
  
  while (start != 1) {
    if (start %% 2 == 0) {
      start <- start / 2
    } else {
      start <- 3 * start + 1
    }
    sequence <- c(sequence, start)
  }
  
  return(sequence)
}

even_odd_backtrack <- backtracks_df %>%
  group_by(is_even = start %% 2 == 0) %>%
  summarise(count = n())

# Print the frequency counts for even and odd backtracking ints
print(even_odd_backtrack)