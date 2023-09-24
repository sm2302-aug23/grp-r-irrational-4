# Task 5 (Open-ended exploration)

# The interesting question or pattern our team wanted to explore is: 
# "Will different initial integers result in different length sequences: 
# will large initial integers result in longer length sequences and
# small initial integers result in shorter length sequences?"

# The process of finding it, is by first researching if there is any specific
# formula or correlation relating to the initial integer and sequence length
# of the Collatz Conjecture.


library(tidyverse)
library(purrr)

# Function to generate COllatz sequences
collatz_sequence <- function(start) {
  sequence <- c(start)
  while (start >1) {
    if (start %% 2 == 0) {
      start <- start / 2
    } else {
      start <- 3 * start + 1
    }
    sequence <- c(sequence, start)
  }
  return(sequence)
}


# Produce sequences for a range of starting integers (from 1 to 100)
starting_integers <- 1:100
sequences_df <- tibble(
  start = starting_integers,
  sequence_length = map_dbl(start, ~ length(collatz_sequence(.)))
)


# Print sequences_df using head()
head(sequences_df)


# Plot the correlation between starting integer and sequence length
ggplot(sequences_df, aes(x = start, y = sequence_length)) +
  geom_point() +
  labs(
    x = "Starting Integer",
    y = "Sequence Length"
  ) +
  ggtitle("Collatz Sequence Length vs. Starting Integer") +
  theme_minimal()










