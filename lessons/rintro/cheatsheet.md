---
title: "Cheatsheet: Introduction to R"
published: true
author:
    - Sarah Meister
date: 2015-11-02
layout: page
sidebar: false
tag:
    - Lessons
    - Cheatsheet
    - IntroR
    - R
categories:
    - Lessons
    - IntroR
    - R
---



R is an object-oriented programing language, meaning everything we encounter in
R is an object.

# Basic R data types #

> R has a rich syntax for describing data. There are 5 basic classes of data
types: character, numeric, integer, complex, and logical
> 
> Example code:


{% highlight r %}
a <- c(0.4, 1.2)         # numeric
b <- c(TRUE, FALSE)      # logical
c <- c("a","b","c")      # character
d <- c(1L, 2L)           # integer
e <- 1:10                # integer
f <- c(1+0i, 2+4i)       # complex
{% endhighlight %}

# Basic R object types (classes) #

> Not only does R have rich syntax for data, but also for the objects that store
them. Typical object types that contain data include: vectors, lists, matrices,
factors, and dataframes. Combining the data types with the object types, you
could have a logical vector, a character dataframe, a numeric matrix, and so on.

## `c()`, `vector()`, `[`, `length()` ##

> The most basic object is a vector. A vector is a sequence of objects of the
same class. We can make vectors using the `c()` function. Empty vectors can be
made using the `vector()` function. Use the `[` command to access the number
from the vector.
>
> Example code:


{% highlight r %}
vector("numeric", length=10)
{% endhighlight %}



{% highlight text %}
##  [1] 0 0 0 0 0 0 0 0 0 0
{% endhighlight %}



{% highlight r %}
x <- c(1:10)
## Select the first element
x[1]
{% endhighlight %}



{% highlight text %}
## [1] 1
{% endhighlight %}



{% highlight r %}
## Select the first and second element
x[1:2]
{% endhighlight %}



{% highlight text %}
## [1] 1 2
{% endhighlight %}



{% highlight r %}
## select the first and third element
x[c(1,3)]
{% endhighlight %}



{% highlight text %}
## [1] 1 3
{% endhighlight %}



{% highlight r %}

## Check out long the vector is
length(x)
{% endhighlight %}



{% highlight text %}
## [1] 10
{% endhighlight %}

## `list()`, `[[`, `$` ##

> A list is a special type of vector that can contain various object and data
types. For instance, we can have a list with a numeric dataframe as one
object within the list, and a string vector as another. You can even have lists
within a list. Accessing the contents of a list can be done using the `[[`
command.
>
> Example code:


{% highlight r %}
x <- list(num = 1, char = "a", logic = TRUE, complex = 1+4i)
x
{% endhighlight %}



{% highlight text %}
## $num
## [1] 1
## 
## $char
## [1] "a"
## 
## $logic
## [1] TRUE
## 
## $complex
## [1] 1+4i
{% endhighlight %}



{% highlight r %}
## Use [[ to select the contents inside the list
x[[1]]
{% endhighlight %}



{% highlight text %}
## [1] 1
{% endhighlight %}



{% highlight r %}
x[[2]]
{% endhighlight %}



{% highlight text %}
## [1] "a"
{% endhighlight %}



{% highlight r %}
x[[3]]
{% endhighlight %}



{% highlight text %}
## [1] TRUE
{% endhighlight %}



{% highlight r %}
x2 <- list(
    vector = c(1:10), dataframe = data.frame(1:10, 1:10),
    char.list = list('a', 'b')
    )
x2
{% endhighlight %}



{% highlight text %}
## $vector
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $dataframe
##    X1.10 X1.10.1
## 1      1       1
## 2      2       2
## 3      3       3
## 4      4       4
## 5      5       5
## 6      6       6
## 7      7       7
## 8      8       8
## 9      9       9
## 10    10      10
## 
## $char.list
## $char.list[[1]]
## [1] "a"
## 
## $char.list[[2]]
## [1] "b"
{% endhighlight %}



{% highlight r %}
## Use the [ to select the vector number within the list item.
x2[[1]]
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}
x2[[1]][1]
{% endhighlight %}



{% highlight text %}
## [1] 1
{% endhighlight %}



{% highlight r %}
## Select a list item specifically (if it is named)
x2$vector
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}

## `matrix()`, `dim()`, `nrow()`, `ncol()`, `rbind()`, `cbind()` ##

> Matrices are vectors with a dimension attribute. The `dim` attribute is an 
integer vector of length = 2 (nrow, ncol). Matrices are constructed column-wise,
so entries start at the upper left corner and run down the columns. Matrix 
multiplication is done with the %*% operator. Accessing the values within the 
matrix ared done using the `[` command, but with two values. Matrices can be
created directly from vectors by adding a dimension value, either by changing
the `dim()` attribute or by using `cbind()` and `rbind()`.
> 
> Example code:


{% highlight r %}
x <- matrix(1:6, nrow=2, ncol=3)
x
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
{% endhighlight %}



{% highlight r %}
# The first row, third column
x[1,3]
{% endhighlight %}



{% highlight text %}
## [1] 5
{% endhighlight %}



{% highlight r %}
# The first two rows and second and third column
x[1:2, 2:3]
{% endhighlight %}



{% highlight text %}
##      [,1] [,2]
## [1,]    3    5
## [2,]    4    6
{% endhighlight %}



{% highlight r %}

## Check the attributes of the matrix
dim(x)
{% endhighlight %}



{% highlight text %}
## [1] 2 3
{% endhighlight %}



{% highlight r %}
ncol(x)
{% endhighlight %}



{% highlight text %}
## [1] 3
{% endhighlight %}



{% highlight r %}
nrow(x)
{% endhighlight %}



{% highlight text %}
## [1] 2
{% endhighlight %}



{% highlight r %}
attributes(x)
{% endhighlight %}



{% highlight text %}
## $dim
## [1] 2 3
{% endhighlight %}



{% highlight r %}

## Creating a matrix from a vector
x <- 1:10
x
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}
dim(x) <- c(2,5)
x
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
{% endhighlight %}



{% highlight r %}
dim(x)
{% endhighlight %}



{% highlight text %}
## [1] 2 5
{% endhighlight %}



{% highlight r %}

## Using rbind ('row bind') or cbind ('column bind')
x <- 1:3
y <- 10:12
cbind(x, y)
{% endhighlight %}



{% highlight text %}
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
{% endhighlight %}



{% highlight r %}
rbind(x, y)
{% endhighlight %}



{% highlight text %}
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
{% endhighlight %}

## `factor()`, `table()` ##

> Factors are used to represent catagorical data. They can be ordered or
unordered. They are like an integer vector but with a label for each integer.
Factors are more descriptive than integers e.g. "Male" and "Female" vs. 1 and 2.
Factors are also treated differently by modelling functions like `lm()` and
`glm()`.
> 
> Example code:


{% highlight r %}
x <- factor(c("yes", "yes", "no", "no", "yes"))
x
{% endhighlight %}



{% highlight text %}
## [1] yes yes no  no  yes
## Levels: no yes
{% endhighlight %}



{% highlight r %}
table(x)
{% endhighlight %}



{% highlight text %}
## x
##  no yes 
##   2   3
{% endhighlight %}



{% highlight r %}
unclass(x)
{% endhighlight %}



{% highlight text %}
## [1] 2 2 1 1 2
## attr(,"levels")
## [1] "no"  "yes"
{% endhighlight %}



{% highlight r %}

## Converting the factor into a numeric
as.numeric(x)
{% endhighlight %}



{% highlight text %}
## [1] 2 2 1 1 2
{% endhighlight %}

## `data.frame()`, `read.table()`, `read.csv()`, `[[`, `[`, `$` ##

> Dataframes are used in R to store tabular data. They are represented in R as a
special type of list where every element in the list has the same length. Each
element of the list can be thought of as a **column** and each length of the
list can be thought of as a **row**. Because a dataframe is a type of list,
dataframes can store different classes of objects in each column (e.g. numeric,
character, logical, etc.). Dataframes can be thought of like data contained
within an Excel spreadsheet... but much more powerful. Depending on the source 
of the data, dataframes can be imported from an external files using the 
`read.table()` or `read.csv`, or can be created using `data.frame()`.


{% highlight r %}
x <- data.frame(
    foo = 1:4, bar = c(T,T,F,F), char = c('a', 'b', 'b', 'a')
    )
x
{% endhighlight %}



{% highlight text %}
##   foo   bar char
## 1   1  TRUE    a
## 2   2  TRUE    b
## 3   3 FALSE    b
## 4   4 FALSE    a
{% endhighlight %}



{% highlight r %}

## Select certain rows and columns: 
## - 1:2 rows with 2:3 columns
x[c(1:2), c(2:3)]
{% endhighlight %}



{% highlight text %}
##    bar char
## 1 TRUE    a
## 2 TRUE    b
{% endhighlight %}



{% highlight r %}
## - Select columns by name
x[c('foo', 'bar')]
{% endhighlight %}



{% highlight text %}
##   foo   bar
## 1   1  TRUE
## 2   2  TRUE
## 3   3 FALSE
## 4   4 FALSE
{% endhighlight %}



{% highlight r %}
## - Select rows by number and columns by name
x[c(2:3), 'foo']
{% endhighlight %}



{% highlight text %}
## [1] 2 3
{% endhighlight %}



{% highlight r %}
## - Select column directly
x$bar
{% endhighlight %}



{% highlight text %}
## [1]  TRUE  TRUE FALSE FALSE
{% endhighlight %}



{% highlight r %}
## - Select a single column using the list [[ select command
x[[2]]
{% endhighlight %}



{% highlight text %}
## [1]  TRUE  TRUE FALSE FALSE
{% endhighlight %}



{% highlight r %}

## Check the attributes
dim(x)
{% endhighlight %}



{% highlight text %}
## [1] 4 3
{% endhighlight %}



{% highlight r %}
nrow(x)
{% endhighlight %}



{% highlight text %}
## [1] 4
{% endhighlight %}



{% highlight r %}
ncol(x)
{% endhighlight %}



{% highlight text %}
## [1] 3
{% endhighlight %}



{% highlight r %}
length(x)
{% endhighlight %}



{% highlight text %}
## [1] 3
{% endhighlight %}



{% highlight r %}
class(x)
{% endhighlight %}



{% highlight text %}
## [1] "data.frame"
{% endhighlight %}


# Attributes of objects in R #

> R objects can have attributes, such as names, length, classes, dimensions,
user-created classes (eg. metadata), and row names (dataframe). Attributes can
be modified with the `attributes()` and other functions.
>
> Example code


{% highlight r %}
x <- 1:3
names(x)
{% endhighlight %}



{% highlight text %}
## NULL
{% endhighlight %}



{% highlight r %}

## Modify names attribute
names(x) <- c("alpha", "beta", "gamma")
x
{% endhighlight %}



{% highlight text %}
## alpha  beta gamma 
##     1     2     3
{% endhighlight %}



{% highlight r %}
names(x)
{% endhighlight %}



{% highlight text %}
## [1] "alpha" "beta"  "gamma"
{% endhighlight %}



{% highlight r %}

## Add to the class attribute
class(x)
{% endhighlight %}



{% highlight text %}
## [1] "integer"
{% endhighlight %}



{% highlight r %}
class(x) <- c('my-own-class', class(x))
class(x)
{% endhighlight %}



{% highlight text %}
## [1] "my-own-class" "integer"
{% endhighlight %}

# Looking for help in R #

> Example code:


{% highlight r %}
## Help for functions
help('c')
help('class')
?c
?class

## Help for specific packages
help(package = 'ggplot2')
help(package = 'rmarkdown')
{% endhighlight %}

# Using R packages #

> R comes with a few default packages, however there are more than six thousand
R packages that extend R's capabilities (such as `ggplot2`, our next lesson).
>
> Example code:


{% highlight r %}
## Check what's loaded
search()

## Load a package that is installed in the library
library(ggplot2)
library(rmarkdown)
library(dplyr)

## Install a package
install.packages('ggplot2')
install.packages('rmarkdown')
{% endhighlight %}

# Working Directory #

> R knows the directory it was started in, and refers to this as the "working
directory". This is where R will search for any files you are imputting, and
where it will place any files you output.
>
> Example code:


{% highlight r %}
## Check the current directory
getwd()

## Change the directory
getwd('path/to/new/directory')

## Create a directory
dir.create('path')
{% endhighlight %}

# Importing tabular data #

> Most data you will work with comes in tabular form (such as an Excel
spreadsheet). The two most commonly-used functions used to import tabular data
into R are `read.table()` and `read.csv()`.


{% highlight r %}
# \t is the regular expression for the tab key. This means our table is
# tab-delimited (tab-separated)
data <- read.table("file_name.txt", header = FALSE, sep = "\t")

#.csv is a comma-separated table 
data2 <- read.csv("file_name.csv", header = TRUE)
{% endhighlight %}

# Saving/outputting tabular data #

> Often you'll want to save R data into a tabular form (e.g. to view in Excel).
This is where you use `write.table()` or `write.csv()`.
>
> Example code:


{% highlight r %}
## Comma separated file
write.table(
    data, file = "myfile.csv", sep = ",", row.names = TRUE, col.names = FALSE
    )
write.csv(data, file = 'myfile.csv')
{% endhighlight %}

# R operators and special symbols #

**Assignment operators:** (Note: only use `<<-` under *very* special
circumstances...)

|Operator | Description |
|-----|----|
| <- | local environment assignment |
| <<- | global environment assignment | 

**Arthmetic Operators:**

|Operator | Description |
|---------|----------|
|+        | addition |
|-        | subtraction |
|*        | multiplication |
|/        | division |
|^ or **  | exponentiation |
|x %% y   | modulus (5 %% 2 is 1) |
|x %/% y  | integer division (5%/% is 2) |
|x %\*% y  | matrix multiplication |

**Logical Operators:**

Operator  | Description
--------  | -----------
<         | less than
<=        | less than or equal to
>         | greater than
>=        | greater than or equal to
==        | exactly equal to
!=        | not equal to
!x        | not x
x \| y    | x OR y (returns a vector)
x \|\| y    | x OR y (examines only 1st element of vector)
x & y     | x AND y (returns a vector)
x && y    | x AND y (examines only 1st element of vector)
isTRUE(x) | test if X is TRUE
any(x) | whether any of x is TRUE
all(x) | whether all of x is TRUE
identical(x, y) | whether x and y are the same

# Commenting in R #

> Example code:


{% highlight r %}
# commenting in R is easy! Everything past a # means that R will ignore whatever
# is written there.
{% endhighlight %}


# Functions #

## `function()` ##

> Functions are snippets of code that allow you to simplify your code and to not
repeat yourself (a tenet of programming is DRY... 'don't repeat yourself'). 
They are created using the `function()` command and are stored as R objects of
the class "function". Functions can be passed as arguments to other functions
and they can be nested (functions inside functions, but not recommended).
Whatever output is printed last is what a function will return when it is used. 
Any time you do an analysis or series of commands more than once, put it into a 
function and save yourself time and effort later on!
>
> Example code:


{% highlight r %}
f <- function(argument) {
    ## do something here 
    commands
    more commands
}
{% endhighlight %}


{% highlight r %}

## make a function called above10 with the argument x that subsets all variables
## of x that are greater than 10
above10 <- function(x) {
  use <- x > 10
  x[use]
}

## make a function called above with the arguments x & n that subsets all variables of x that are greater than n
above <- function(x, n) {
  use <- x > n
  x[use]
}

## create a function called columnmean that takes the arguments y and the
## argument remove.NA with a default value of TRUE. This function takes the
## number of columns of y, turns it into a numeric object, and calculates the
## mean of each column of y while removing NA values
columnmean <- function (y, remove.NA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = remove.NA)
  }
  means
}
{% endhighlight %}

## `if .. else`, `ifelse` ##

> If-else commands are a mainstay of programming languages and are used to 
control the flow and conditions of an R script or analysis. Very useful when
used within functions.
>
> Example code:


{% highlight r %}

x <- 1:20

if (length(x) < 10) {
    print('Less then ten numbers')
} else {
    print('More than ten numbers')
}

## to add more conditions
if (length(x) < 10) {
    print('Less then ten numbers')
} else if (length(x) == 20) {
    print('There are 20 numbers')
} else {
    print('Not sure how many numbers...')
}

ifelse(x < 10, 'yes', 'no')
{% endhighlight %}


{% highlight r %}
y <- c()
if (length(x) > 3) {
  y <- 10
} else {
  y <- 0
}
y
{% endhighlight %}



{% highlight text %}
## [1] 0
{% endhighlight %}



{% highlight r %}

## Or
y <- if(length(x) > 3) {
  10
} else {
  0
}
y
{% endhighlight %}



{% highlight text %}
## [1] 0
{% endhighlight %}

## `for (x in list)` ##

> For loops allow you to iterate over a sequence to do a particular task. R's
looping in inherently slow, so for looping should not be relied on for heavy
data-intensive tasks.
>
> Example code:


{% highlight r %}
for (i in 1:10) {
  print (i)
}
{% endhighlight %}



{% highlight text %}
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
{% endhighlight %}



{% highlight r %}

## Nested loops
x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print (x[i, j])
  }
}
{% endhighlight %}



{% highlight text %}
## [1] 1
## [1] 3
## [1] 5
## [1] 2
## [1] 4
## [1] 6
{% endhighlight %}

# Loop Functions #

> R's for looping is inherently (excruciatingly) slow. Because of this, there
are several built-in functions that speed up looping, which often have the word
"apply" in them. Using these and other techniques compared to using for loops is
called vectorization. R is very computationally efficient at vectorizations.
>
- `lapply`: loop over a list and evaluate a function on each element 
- `sapply`: same as `lapply` but it tries to simplify the result
- `apply`: apply a function over the margins of an array 
- `tapply`: apply a function over subsets of a vector (`lapply()` used with `split()` does the same thing)
- `mapply`: a multivariate version of `lapply` 

## `lapply()` ##

> `lapply` loops internally with C code, making the looping very fast. It
takes two to three arguments: a list `x` (or another object that is coerced to a
list); a function, including anonymous functions, which are user created without
a name; other arguments as necessary. It will always return a list object.
>
> Example code:


{% highlight r %}
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean)
{% endhighlight %}



{% highlight text %}
## $a
## [1] 3
## 
## $b
## [1] -0.08705441
## 
## $c
## [1] 0.8056751
## 
## $d
## [1] 5.003501
{% endhighlight %}



{% highlight r %}

x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
x
{% endhighlight %}



{% highlight text %}
## $a
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## 
## $b
##      [,1] [,2]
## [1,]    1    4
## [2,]    2    5
## [3,]    3    6
{% endhighlight %}



{% highlight r %}
## Use an anonymous function with the argument `ele` and then define that
## argument.
lapply(x, function(ele) ele[ ,1]) 
{% endhighlight %}



{% highlight text %}
## $a
## [1] 1 2
## 
## $b
## [1] 1 2 3
{% endhighlight %}

## `sapply()` ##

> This function tries to simplify the result of `lapply`, if possible. For
instance, if the result is a list where every element is length 1, than a vector
is returned. Or, if the result is a list where every element is a vector of the
same length, a matrix is returned. Otherwise a list is returned.
> 
> Example code:


{% highlight r %}
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(x, mean)
{% endhighlight %}



{% highlight text %}
##          a          b          c          d 
## 3.00000000 0.01466929 0.91543331 5.03388351
{% endhighlight %}

## `apply()` ##

> Used to evalute a function over the margins of an array. It is not faster than
a loop, but it works in one line. `1` means do the function to the rows. `2`
means do the function to the columns.
>
> Example code:


{% highlight r %}
x <- matrix (rnorm(200), 20, 10)
# keeping number of columns and collapsing rows. This gives a vector of the
# means of columns.
apply(x, 2, mean) 
{% endhighlight %}



{% highlight text %}
##  [1]  0.12347715  0.04770594 -0.23962572  0.03181958 -0.28658551
##  [6]  0.56491660 -0.10992450 -0.06652284  0.13402639  0.13483184
{% endhighlight %}



{% highlight r %}

# this calculates the sum of all rows
apply(x, 1, sum) 
{% endhighlight %}



{% highlight text %}
##  [1]  1.8147165 -1.2577054  2.5727208 -1.3669601  1.7846913 -2.2291840
##  [7]  0.4621210  4.0021023  2.6337700 -1.0559236 -1.5868910  4.6012822
## [13] -5.4770651 -0.1168984 -2.8939953 -0.1784035  4.6166377  0.2221600
## [19] -0.1469406  0.2821437
{% endhighlight %}



{% highlight r %}

## Use additional arguments in apply, that it passes to the function quantile.
y <- matrix(rnorm(200), 20, 10)
apply(y, 1, quantile, probs = c(0.25, 0.75))
{% endhighlight %}



{% highlight text %}
##           [,1]       [,2]       [,3]         [,4]       [,5]       [,6]
## 25% -0.7647038 -0.7210468 -0.7600068 -0.003778185 -1.3521756 -0.2174439
## 75%  0.4123376  0.6791686  0.7951071  0.895761712  0.9357661  0.9783733
##           [,7]        [,8]       [,9]      [,10]      [,11]      [,12]
## 25% -0.2691144 -1.55762093 -0.3051579 -0.3270544 -0.6420960 0.06768242
## 75%  0.6831129  0.04226876  0.7276672  1.1130333  0.3072559 0.63674347
##          [,13]      [,14]      [,15]      [,16]      [,17]      [,18]
## 25% -0.7577007 -0.7888834 -0.4688051 -0.6615460 -0.6491867 -0.5835593
## 75%  1.1956633  0.5516693  1.1701949  0.7859077  1.0033207  0.8368049
##          [,19]      [,20]
## 25% -0.3362166 -0.9854436
## 75%  0.3192613  0.7975759
{% endhighlight %}



{% highlight r %}

# With an array (stacks of matrices: multidimensional).
# Create an array that looks like a bunch of 2 by 2 matrices and take the mean of
# those.
a <- array(rnorm(2*2*10), c(2,2,10)) 
apply(a, c(1,2), mean) #this keeps the 1st and 2nd dimension
{% endhighlight %}



{% highlight text %}
##             [,1]         [,2]
## [1,] -0.03276905 -0.004964963
## [2,]  0.17359854 -0.131615028
{% endhighlight %}

## `mapply()` ##

> `mapply` is a multivariate apply (like `lapply`) that applies a function over
a set of arguments.


{% highlight r %}
mapply(rep, 1:4, 4:1)
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 1 1 1 1
## 
## [[2]]
## [1] 2 2 2
## 
## [[3]]
## [1] 3 3
## 
## [[4]]
## [1] 4
{% endhighlight %}



{% highlight r %}
# is the same as
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 1 1 1 1
## 
## [[2]]
## [1] 2 2 2
## 
## [[3]]
## [1] 3 3
## 
## [[4]]
## [1] 4
{% endhighlight %}


{% highlight r %}
## create a function called noise that takes the arguments n, mean, and sd and
## produces random varibles with those specifications.
noise<- function(n,mean, sd) {
  rnorm(n, mean, sd)
}

## apply the noise function with n=5, mean=1 and sd=2
noise(5, 1, 2)
{% endhighlight %}



{% highlight text %}
## [1] -0.750147  2.968726  2.636535  2.763283  4.332608
{% endhighlight %}



{% highlight r %}

## apply the noise function for n= 1 to 5, mean = 1 to 5, and sd = 2
mapply(noise, 1:5, 1:5, 2)
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 1.039934
## 
## [[2]]
## [1] -0.463912  3.117271
## 
## [[3]]
## [1] 2.935257 4.951166 3.344060
## 
## [[4]]
## [1] 4.5938752 2.2269367 4.8059080 0.1818445
## 
## [[5]]
## [1]  7.1944041  1.8305581  5.4218587 -0.2811959  4.0780825
{% endhighlight %}



{% highlight r %}

## which is the same as writing
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 1.153676
## 
## [[2]]
## [1] 3.4398032 0.1654232
## 
## [[3]]
## [1] 1.896161 5.242596 3.849094
## 
## [[4]]
## [1] 2.189090 3.076175 6.126703 1.883835
## 
## [[5]]
## [1] 3.026996 4.327652 2.282642 3.456119 3.095467
{% endhighlight %}



{% highlight r %}

# (the outputs are different because our function makes new random varibles each
# time)
{% endhighlight %}

## `tapply()` ##

> `tapply` is used to apply a function over subsets of a vector. It will
simplify the result, like sapply.
>
> Example code:


{% highlight r %}
x <- c(1:30) # make a vector with 30 variables
f<- gl(3,10) # make a factor variable with 3 levels and 10 reps of each level
f
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
## Levels: 1 2 3
{% endhighlight %}



{% highlight r %}

# apply the mean function to x, subsetting by f
tapply(x, f, mean) 
{% endhighlight %}



{% highlight text %}
##    1    2    3 
##  5.5 15.5 25.5
{% endhighlight %}



{% highlight r %}
# apply the range function to x, subsetting by f
tapply(x, f, range) 
{% endhighlight %}



{% highlight text %}
## $`1`
## [1]  1 10
## 
## $`2`
## [1] 11 20
## 
## $`3`
## [1] 21 30
{% endhighlight %}

# Misc commands #

## `subset()` ##

> The `subset()` function in R will return a subset of an argument that meet a
particular condition.
>
> Example code:


{% highlight r %}
numvec <- c(2,5,8,9,0,6,7,8,4,5,7,11)
subset(numvec, numvec < 9 & numvec > 4)
{% endhighlight %}



{% highlight text %}
## [1] 5 8 6 7 8 5 7
{% endhighlight %}
