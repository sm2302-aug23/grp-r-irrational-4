library(tibble)
library(tidyverse)

# Creating function gen_collatz
gen_collatz <- function(n) {
  if (is.numeric(n) && n > 0 && n %% 1 == 0) {
    seq <- c(n)
    while (n != 1) {
      if (n %% 2 == 0) {
        n <- n/2
      } else {
        n <- 3*n + 1
      }
      seq <- c(sequence,n)
    }
    return(seq)
  } else {
    return(NULL)
  }
}

# Generate tibble
collatz_df <- tibble(start= integer(0), seq = list())

# Producing Collatz Sequence from 1 to 10000
for (i in 1:10000) {
  collatz_seq <- gen_collatz(i)
  if(!is.null(collatz_seq)) {
    collatz_df <- collatz_df %>%
      add_row(start = i, seq = list(collatz_seq))
  }
}

# Printing collatz_df
print(collatz_df)
