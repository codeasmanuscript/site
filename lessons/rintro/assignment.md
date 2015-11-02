---
title: "Assignment: Intro to R"
published: true
author: Sarah Meister
date: 2015-11-02
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - IntroR
    - R
categories:
    - Lessons
    - IntroR
    - R
output: html_vignette
---



## Challenges for R basics

Write up and complete all of these challenges in a file called `challenges.R`.
To get more practice with Git, **add and commit** after completing each
challenge.

1. Create the following vectors in R:
	
    * a = 1 to 10
    * b = 11 to 20

    Use vector arithmetic to multiply these vectors and put the results into a
    new variable `c`. Select subsets of `c` to identify the following:

    * The 5th element of `c`
    * All of elements of `c` that are greater than 50

2. Use R to create the following two matrices and multiply them. Make a new
object of the resulting matrix; choose your own object name!

*alpha:*


{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "kable"
{% endhighlight %}
 
*beta:* 


{% highlight text %}
## Error in eval(expr, envir, enclos): could not find function "kable"
{% endhighlight %}

3. Load the `datasets` package and make a new dataframe with the `mtcars`
dataset. What are the means of the columns? Hint: use a loop function. Subset
the `mtcars` dataset and make new vectors with:

    * The column mpg
    * The fourth column
    * The third and fifth row
    * When hp is greater than 100

4. Make a vector with the following arguments: "cat", "dog", "cow", "pig". Make
a combination for loop and if/else expression that prints the second argument.

5. Create a function called `stats` that takes two arguments and prints the mean
and standard deviation of the first argument and the median of the second
argument. Hint: use the built-in `mean()`, `median()`, `sd()` and `print()`
functions. Use your function with the `disp` and `drat` columns from the
`mtcars` dataset.

6. Use the `lapply()` function to find the range of all the columns in the
`mtcars` dataframe. Now use `sapply()` and explain the difference between the
outcomes as a comment in the `challenges.R` script.

7. Use `mapply()` to find the sum of the `mpg`, `wt` and `qsec` columns of the
`mtcars` dataframe.

8. Use the `tapply()` function to apply the `max()` function on the `hp` column
by the `gear` column.
