[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/HUOoSZXh)
# Assignment 1 (R group)

> Analysis of the Collatz Conjecture

- [Assignment questions](ASSIGNMENT.md) 
- Please also read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for specific
submission instructions and marking rubric.

# Summary 

> Brief description of solutions to all the tasks

## Task 1 (Generating the Collatz Conjecture)
This R code defines a function to compute the Collatz sequence for a given positive integer, generate Collatz sequences for a range of starting values, and store the results in a tibble for further analysis or visualisation.

## Task 2 (Exploratory data analysis)
This R code analyses the Collatz sequences generated in the previous section using `{tidyverse}`. Also, the R code provides answers to three questions related to the sequences: finding the top 10 starting integers with the longest sequences, identifying the starting integer with the highest maximum value in its sequence, and comparing the average length as well as standard deviation of sequences for even and odd starting integers. The results are saved as RDS files for further use.

## Task 3 (Investigating "backtracking" in sequences)
This R code explores the concept of "backtracking" within the Collatz sequences to answer several questions: the number of times the sequences go above their starting values, the maximum value reached after the first backtrack, and whether backtracking sequences are more common among even or odd starting integers. The results are stored and printed for further analysis.

## Task 4 (Visualisations)
This R code created several appropriate graphs using `{ggplot2}`. These graphs are created to visualise the data wrangling tasks in Task 3. A scatterplot is created to identify the top 10 starting integers with the starting integer on the horizontal axis and the length of the sequence on the vertical axis. Another scatterplot is generated with the highest value reached in the sequence on the vertical axis. Lastly, a boxplot is produced to compare the distributions of sequence lengths for even and odd starting integers and see if there is any visible differences.

## Task 5 (Open-ended exploration)
The interesting question or pattern our team wanted to explore is: "Will different initial integers result in different length sequences: will large initial integers result in longer length sequences and small initial integers result in shorter length sequences?" 

The process of finding it, is by first researching if there is any specific formula relating to the initial integer and sequence length of the Collatz Conjecture. Our research indicated that there is no such specific formula. Hence, to find out if there is any correlation was to use different initial integers into the conjecture. For example, for a range of initial integers from 1 to 100, it is often observed that small initial integers tend to lead to shorter sequences before reaching the value of 1; however, there are some that would lead to longer sequences. Conversely, the same applies to large initial integers, where most of them would lead to longer sequences, but some would ultimately have very short sequences. Nevertheless, it is important to note that this pattern does not hold true for all integers, and the behaviour of the sequence can be quite unpredictable.

<p align="center">
  <img src="https://github.com/sm2302-aug23/grp-r-irrational-4/assets/141215572/6710aa45-040d-4ff9-898e-a50f5574645a">
</p>

This lead to our team concluding that there is no specific correlation between the initial integer and length sequence, as it varies and does not have a determining pattern.
In summary, while there is a general trend that larger initial integers tend to result in longer sequences and smaller initial integers in shorter sequences, this is not an absolute rule, and there are exceptions and complexities in the behaviour of the Collatz sequence that make it a challenging and unsolved mathematical problem.

### Contribution declaration
- Task 1: Muqri
- Task 2: Azyan
- Task 3: Syasya
- Task 4: Azyan
- Task 5: Muqri and Erika
- Task 6:
- README: Erika

### References 
1. *Program to Print Collatz Sequence.* (2022, June 22). Geeksforgeeks. https://www.geeksforgeeks.org/program-to-print-collatz-sequence/
2. *Maximum Sequence Length | Collatz Conjecture.* (2023, Feb 14). Geeksforgeeks. https://www.geeksforgeeks.org/maximum-sequence-length-collatz-conjecture/
3. [*Rstudio: for-loop of a sequence](https://stackoverflow.com/questions/77165760/rstudio-for-loop-of-a-sequence).* (n.d). Stackoverflow. https://stackoverflow.com/questions/77165760/rstudio-for-loop-of-a-sequence
4. *ifelse: Conditional Element Selection.* (n.d). Rdocumentation. https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/ifelse
5. *Euler Problem 14: Longest Collatz Sequence.* (2017, March 1). R-bloggers. https://www.r-bloggers.com/2017/03/euler-problem-14-longest-collatz-sequence/
6. *Lapply function in R.* (n.d). R Coder. https://r-coder.com/lapply-r/
7. *Filter data by multiple conditions in R using Dplyr.* (2022, Jan 25). Geeksforgeeks. https://www.geeksforgeeks.org/filter-data-by-multiple-conditions-in-r-using-dplyr/
8. *Tidyverse.* (n.d). ggplot2. https://ggplot2.tidyverse.org/

