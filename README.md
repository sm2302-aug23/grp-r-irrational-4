[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/HUOoSZXh)
# Assignment 1 (R group)

> Analysis of the Collatz Conjecture

- [Assignment questions](ASSIGNMENT.md) 
- Please also read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for specific
submission instructions and marking rubric.

# Summary 

> Brief description of solutions to all the tasks

## Task 1
This R code defines a function to compute the Collatz sequence for a given positive integer, generate Collatz sequences for a range of starting values, and store the results in a tibble for further analysis or visualisation.

## Task 2
This R code analyses the Collatz sequences generated in the previous section and provides answers to three questions related to the sequences: finding the top 10 starting integers with the longest sequences, identifying the starting integer with the highest maximum value in its sequence, and comparing the average length as well as standard deviation of sequences for even and odd starting integers. The results are saved as RDS files for further use.

## Task 3
This R code analyses Collatz sequences to answer several questions related to backtracking behaviour, the number of times the sequences go above their starting values, the maximum value reached after the first backtrack, and whether backtracking sequences are more common among even or odd starting integers. The results are stored and printed for further analysis.

## Task 4
This R code created several appropriate graphs using `{ggplot2}`. These graphs are created to visualise the data wrangling tasks in Task 3. A scatterplot is created to identify the top 10 starting integers with the starting integer on the horizontal axis and the length of the sequence on the vertical axis. Another scatterplot is generated with the highest value reached in the sequence on the vertical axis. Lastly, a boxplot is produced to compare the distributions of sequence lengths for even and odd starting integers and see if there is any visible differences.

## Task 5
Our group generated a question: "Will a large initial integer lead to longer sequence, and small large initial integer lead to shorter sequence".
The process and methodology is trying to find if there is such a formula relating to the initial integer and sequence length. After researching, there is no specific formula for it. So, testing with different initial integers will be the second method. While most large starting integers lead to longer sequences, some also result in short sequences, and not only most small starting integers lead to short sequences but some of it generates long sequences. Therefore, it can be concluded that there is no official correlation and the result may vary.

### Contribution declaration
- Task 1: Muqri
- Task 2: Azyan
- Task 3: Syasya
- Task 4: Azyan
- Task 5: Muqri and Erika
- Task 6:
- README: Erika

