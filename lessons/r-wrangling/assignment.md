---
title: "Assignment: Data wrangling in R"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - Wrangling
    - R
categories:
    - Lessons
    - Wrangling
    - R
output: 
    md_document:
        variant: markdown_github
---

## Challenges: Try these out for yourself! ##

Try each of these challenges using only one continuous chain of `%>%` pipes,
from raw data to final output. Create a file in the `practice` repo under
`your-name/wrangling` called `challenge.R`. The file location should look like
`your-name/wrangling/challenge.R`. To get more practice with Git, **add and
commit** after completing each challenge. Use the `swiss` dataset that comes with R.

1. Make a new dataframe with the means of Agriculture, Examination, Education,
and Infant.Mortality for each category of Fertility (hint: convert it into a
factor by values of >50 vs <50) and when Catholic is less than 60 (hint, use
`dplyr` commands and `gather`).  Have the Fertility groups as two columns in the
new dataframe ('Fertile', 'Infertile').

2. Do the same thing as above, but instead make a new dataframe with one column 
that contains the mean and standard deviation in this format: '00.00 (00.00 
SD)'. Notice that there are two digits after the period. Hint: You'll need to
use the `paste0()` function to combine means and SD.

3. Create a new dataframe that has only counties that have either the lowest or
the highest value within *each* variable (ie. there should be *at least* 12
counties). The final dataframe should have the columns County, Variable, and
Value, with at least 12 rows (there may be 1 or 2 more).

4. Find the mininum, mean, and max of each of the variables using `dplyr`
commands and pipes. The final dataframe should have 4 columns: 1) variable
names, 2) min, 3) mean, and 4) max.

5. List all counties with measures that would typically be associated with 
health: high education (greater than or equal to 8), low infant mortality (less
than 18), and mid fertility (between 50 to 60). Keep only the county names in
the final dataframe.

6. (Advanced) Get a dataframe of correlation coefficients of all numeric
variables by a new variable called `Educated`, which is split at greater than 8
for Education and will be a factor. Hint: You will need to use the `do()` and
`broom::tidy()` commands as seen at the bottom of the [Introduction page](../intro/). The final dataframe should have four columns: Educated ('yes'
and 'no'), Var1, Var2, and Value (correlation coefficient). The dataframe should
*not* contain any comparisons of the same variable (eg. no Fertility with
Fertility, which is the same as having a correlation coefficient of 1)

7. (Advanced) For those looking for a bigger challenge, try to run a linear
regression on multiple independent variables and multiple dependent variables
using what I described in [my blog post](http://www.lukewjohnston.com/blog/loops-forests-multiple-linear-regressions/).
Include additional covariates. It's also briefly shown in the [Introduction to Data Wrangling page](../intro/). Work through and describe what is going on at
each step.
