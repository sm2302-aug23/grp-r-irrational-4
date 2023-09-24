# Task 5 (Open-ended exploration)

# One interesting question:
# "Will a large initial integer lead to longer sequence,
# and small initial integer lead to shorter sequence?"

# The process and methodology is trying to find if there is such a formula
# that relates to the initial integer and length of the sequence.

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










