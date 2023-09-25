# Task 6

# Define a function to calculate Collatz sequence length
collatz_length <- function(n) {
  count <- 0
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    count <- count + 1
  }
  return(count)
}

# Create a vector of starting integers
start_integers <- 1:100

# Calculate sequence lengths for the starting integers
sequence_lengths <- sapply(start_integers, collatz_length)

# Create a simple line plot to visualize the change in sequence lengths
plot(start_integers, sequence_lengths, type = "l", 
     xlab = "Starting Integer", ylab = "Sequence Length",
     main = "Change in Collatz Sequence Lengths",
     col = "blue")






