# Task 4

# Load the ggplot2 library
library(ggplot2)

# Question 1: Create a scatterplot of all sequence lengths
ggplot(collatz_df, aes(x = start, y = lengths(seq))) +
  geom_point() +
  labs(x = "Starting Integer", y = "Sequence Length") +
  ggtitle("Scatterplot of Sequence Lengths") +
  theme_minimal()

# Question 2: Create a scatterplot of the highest value reached in the sequence
ggplot(collatz_df, aes(x = start, y = lengths(seq))) +
  geom_point(aes(color = ifelse(start %in% top10longest$start, "Top 10", "Others"))) +
  labs(x = "Starting Integer", y = "Sequence Length") +
  scale_color_manual(values = c("Top 10" = "red", "Others" = "blue")) +
  ggtitle("Scatterplot of Sequence Lengths (Top 10)") +
  theme_minimal()

# Question 3: Create a boxplot comparing the distributions of sequence lengths for even and odd starting integers
ggplot(even_odd_summary, aes(x = is_even, y = even_odd_avg_len)) +
  geom_boxplot() +
  labs(x = "Starting Integer Type", y = "Average Sequence Length") +
  ggtitle("Boxplot of Sequence Lengths for Even and Odd Starting Integers") +
  scale_x_discrete(labels = c("Even", "Odd")) +
  theme_minimal()