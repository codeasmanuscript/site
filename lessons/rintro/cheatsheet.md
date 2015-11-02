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


```r
a <- c(0.4, 1.2)         # numeric
b <- c(TRUE, FALSE)      # logical
c <- c("a","b","c")      # character
d <- c(1L, 2L)           # integer
e <- 1:10                # integer
f <- c(1+0i, 2+4i)       # complex
```

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


```r
vector("numeric", length=10)
##  [1] 0 0 0 0 0 0 0 0 0 0
x <- c(1:10)
## Select the first element
x[1]
## [1] 1
## Select the first and second element
x[1:2]
## [1] 1 2
## select the first and third element
x[c(1,3)]
## [1] 1 3

## Check out long the vector is
length(x)
## [1] 10
```

## `list()`, `[[`, `$` ##

> A list is a special type of vector that can contain various object and data
types. For instance, we can have a list with a numeric dataframe as one
object within the list, and a string vector as another. You can even have lists
within a list. Accessing the contents of a list can be done using the `[[`
command.
>
> Example code:


```r
x <- list(num = 1, char = "a", logic = TRUE, complex = 1+4i)
x
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
## Use [[ to select the contents inside the list
x[[1]]
## [1] 1
x[[2]]
## [1] "a"
x[[3]]
## [1] TRUE
x2 <- list(
    vector = c(1:10), dataframe = data.frame(1:10, 1:10),
    char.list = list('a', 'b')
    )
x2
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
## Use the [ to select the vector number within the list item.
x2[[1]]
##  [1]  1  2  3  4  5  6  7  8  9 10
x2[[1]][1]
## [1] 1
## Select a list item specifically (if it is named)
x2$vector
##  [1]  1  2  3  4  5  6  7  8  9 10
```

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


```r
x <- matrix(1:6, nrow=2, ncol=3)
x
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
# The first row, third column
x[1,3]
## [1] 5
# The first two rows and second and third column
x[1:2, 2:3]
##      [,1] [,2]
## [1,]    3    5
## [2,]    4    6

## Check the attributes of the matrix
dim(x)
## [1] 2 3
ncol(x)
## [1] 3
nrow(x)
## [1] 2
attributes(x)
## $dim
## [1] 2 3

## Creating a matrix from a vector
x <- 1:10
x
##  [1]  1  2  3  4  5  6  7  8  9 10
dim(x) <- c(2,5)
x
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
dim(x)
## [1] 2 5

## Using rbind ('row bind') or cbind ('column bind')
x <- 1:3
y <- 10:12
cbind(x, y)
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
rbind(x, y)
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
```

## `factor()`, `table()` ##

> Factors are used to represent catagorical data. They can be ordered or
unordered. They are like an integer vector but with a label for each integer.
Factors are more descriptive than integers e.g. "Male" and "Female" vs. 1 and 2.
Factors are also treated differently by modelling functions like `lm()` and
`glm()`.
> 
> Example code:


```r
x <- factor(c("yes", "yes", "no", "no", "yes"))
x
## [1] yes yes no  no  yes
## Levels: no yes
table(x)
## x
##  no yes 
##   2   3
unclass(x)
## [1] 2 2 1 1 2
## attr(,"levels")
## [1] "no"  "yes"

## Converting the factor into a numeric
as.numeric(x)
## [1] 2 2 1 1 2
```

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


```r
x <- data.frame(
    foo = 1:4, bar = c(T,T,F,F), char = c('a', 'b', 'b', 'a')
    )
x
##   foo   bar char
## 1   1  TRUE    a
## 2   2  TRUE    b
## 3   3 FALSE    b
## 4   4 FALSE    a

## Select certain rows and columns: 
## - 1:2 rows with 2:3 columns
x[c(1:2), c(2:3)]
##    bar char
## 1 TRUE    a
## 2 TRUE    b
## - Select columns by name
x[c('foo', 'bar')]
##   foo   bar
## 1   1  TRUE
## 2   2  TRUE
## 3   3 FALSE
## 4   4 FALSE
## - Select rows by number and columns by name
x[c(2:3), 'foo']
## [1] 2 3
## - Select column directly
x$bar
## [1]  TRUE  TRUE FALSE FALSE
## - Select a single column using the list [[ select command
x[[2]]
## [1]  TRUE  TRUE FALSE FALSE

## Check the attributes
dim(x)
## [1] 4 3
nrow(x)
## [1] 4
ncol(x)
## [1] 3
length(x)
## [1] 3
class(x)
## [1] "data.frame"
```


# Attributes of objects in R #

> R objects can have attributes, such as names, length, classes, dimensions,
user-created classes (eg. metadata), and row names (dataframe). Attributes can
be modified with the `attributes()` and other functions.
>
> Example code


```r
x <- 1:3
names(x)
## NULL

## Modify names attribute
names(x) <- c("alpha", "beta", "gamma")
x
## alpha  beta gamma 
##     1     2     3
names(x)
## [1] "alpha" "beta"  "gamma"

## Add to the class attribute
class(x)
## [1] "integer"
class(x) <- c('my-own-class', class(x))
class(x)
## [1] "my-own-class" "integer"
```

# Looking for help in R #

> Example code:


```r
## Help for functions
help('c')
help('class')
?c
?class

## Help for specific packages
help(package = 'ggplot2')
help(package = 'rmarkdown')
```

# Using R packages #

> R comes with a few default packages, however there are more than six thousand
R packages that extend R's capabilities (such as `ggplot2`, our next lesson).
>
> Example code:


```r
## Check what's loaded
search()

## Load a package that is installed in the library
library(ggplot2)
library(rmarkdown)
library(dplyr)

## Install a package
install.packages('ggplot2')
install.packages('rmarkdown')
```

# Working Directory #

> R knows the directory it was started in, and refers to this as the "working
directory". This is where R will search for any files you are imputting, and
where it will place any files you output.
>
> Example code:


```r
## Check the current directory
getwd()

## Change the directory
getwd('path/to/new/directory')

## Create a directory
dir.create('path')
```

# Importing tabular data #

> Most data you will work with comes in tabular form (such as an Excel
spreadsheet). The two most commonly-used functions used to import tabular data
into R are `read.table()` and `read.csv()`.


```r
# \t is the regular expression for the tab key. This means our table is
# tab-delimited (tab-separated)
data <- read.table("file_name.txt", header = FALSE, sep = "\t")

#.csv is a comma-separated table 
data2 <- read.csv("file_name.csv", header = TRUE)
```

# Saving/outputting tabular data #

> Often you'll want to save R data into a tabular form (e.g. to view in Excel).
This is where you use `write.table()` or `write.csv()`.
>
> Example code:


```r
## Comma separated file
write.table(
    data, file = "myfile.csv", sep = ",", row.names = TRUE, col.names = FALSE
    )
write.csv(data, file = 'myfile.csv')
```

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


```r
# commenting in R is easy! Everything past a # means that R will ignore whatever
# is written there.
```


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


```r
f <- function(argument) {
    ## do something here 
    commands
    more commands
}
```


```r

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
```

## `if .. else`, `ifelse` ##

> If-else commands are a mainstay of programming languages and are used to 
control the flow and conditions of an R script or analysis. Very useful when
used within functions.
>
> Example code:


```r

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
```


```r
y <- c()
if (length(x) > 3) {
  y <- 10
} else {
  y <- 0
}
y
## [1] 0

## Or
y <- if(length(x) > 3) {
  10
} else {
  0
}
y
## [1] 0
```

## `for (x in list)` ##

> For loops allow you to iterate over a sequence to do a particular task. R's
looping in inherently slow, so for looping should not be relied on for heavy
data-intensive tasks.
>
> Example code:


```r
for (i in 1:10) {
  print (i)
}
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

## Nested loops
x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print (x[i, j])
  }
}
## [1] 1
## [1] 3
## [1] 5
## [1] 2
## [1] 4
## [1] 6
```

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


```r
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean)
## $a
## [1] 3
## 
## $b
## [1] 0.03196616
## 
## $c
## [1] 0.6059004
## 
## $d
## [1] 4.991253

x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
x
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
## Use an anonymous function with the argument `ele` and then define that
## argument.
lapply(x, function(ele) ele[ ,1]) 
## $a
## [1] 1 2
## 
## $b
## [1] 1 2 3
```

## `sapply()` ##

> This function tries to simplify the result of `lapply`, if possible. For
instance, if the result is a list where every element is length 1, than a vector
is returned. Or, if the result is a list where every element is a vector of the
same length, a matrix is returned. Otherwise a list is returned.
> 
> Example code:


```r
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(x, mean)
##          a          b          c          d 
## 3.00000000 0.04576579 0.97643692 4.87379248
```

## `apply()` ##

> Used to evalute a function over the margins of an array. It is not faster than
a loop, but it works in one line. `1` means do the function to the rows. `2`
means do the function to the columns.
>
> Example code:


```r
x <- matrix (rnorm(200), 20, 10)
# keeping number of columns and collapsing rows. This gives a vector of the
# means of columns.
apply(x, 2, mean) 
##  [1]  0.17125350  0.25014973  0.05637670 -0.23796313  0.31392653
##  [6]  0.38410844 -0.11645465  0.23821264 -0.04970403 -0.29748247

# this calculates the sum of all rows
apply(x, 1, sum) 
##  [1] -4.4429821 -0.6574368  1.1911371  3.8616414 -2.2587809  7.8326782
##  [7]  0.6499274  7.3764224  1.3012891 -1.7725843  6.4859628 -1.1623079
## [13]  2.7518836 -4.4755192  3.7266695 -1.7411285 -4.4297744 -1.3331671
## [19] -3.0433755  4.3879104

## Use additional arguments in apply, that it passes to the function quantile.
y <- matrix(rnorm(200), 20, 10)
apply(y, 1, quantile, probs = c(0.25, 0.75))
##           [,1]       [,2]       [,3]        [,4]      [,5]      [,6]
## 25% -0.5813985 -0.4155099 -0.3978411 -0.06204147 0.1816494 0.1391389
## 75%  0.5445757  1.1493853  1.4713268  0.95988898 0.9294715 0.8546799
##           [,7]        [,8]       [,9]      [,10]      [,11]      [,12]
## 25% -0.6096415 -0.67954171 -0.7963498 -1.1435226 -0.2180918 -0.5935117
## 75%  0.8149493  0.07678966  0.2362088  0.3142852  0.7269817  0.4444604
##          [,13]      [,14]      [,15]      [,16]      [,17]      [,18]
## 25% -1.0947972 -0.5359842 -1.4454579 0.09282969 -0.2285679 -0.7160392
## 75% -0.3598023  0.4620311  0.1353984 1.10250081  1.2127786  0.9207038
##          [,19]      [,20]
## 25% -0.5781012 -0.3674796
## 75%  0.2874633  1.1798599

# With an array (stacks of matrices: multidimensional).
# Create an array that looks like a bunch of 2 by 2 matrices and take the mean of
# those.
a <- array(rnorm(2*2*10), c(2,2,10)) 
apply(a, c(1,2), mean) #this keeps the 1st and 2nd dimension
##            [,1]        [,2]
## [1,]  0.3332423 -0.07199605
## [2,] -0.4199372  0.17350889
```

## `mapply()` ##

> `mapply` is a multivariate apply (like `lapply`) that applies a function over
a set of arguments.


```r
mapply(rep, 1:4, 4:1)
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
# is the same as
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
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
```


```r
## create a function called noise that takes the arguments n, mean, and sd and
## produces random varibles with those specifications.
noise<- function(n,mean, sd) {
  rnorm(n, mean, sd)
}

## apply the noise function with n=5, mean=1 and sd=2
noise(5, 1, 2)
## [1] 0.7930424 2.4740363 1.1699390 1.6019916 0.9895137

## apply the noise function for n= 1 to 5, mean = 1 to 5, and sd = 2
mapply(noise, 1:5, 1:5, 2)
## [[1]]
## [1] 1.247853
## 
## [[2]]
## [1] 0.8865116 6.9421407
## 
## [[3]]
## [1]  5.044907 -1.076488  3.519662
## 
## [[4]]
## [1] 3.929218 3.703124 5.883016 7.454618
## 
## [[5]]
## [1] 6.406565 4.475601 6.538984 2.527339 5.592072

## which is the same as writing
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))
## [[1]]
## [1] 0.2882813
## 
## [[2]]
## [1] 2.271471 3.320668
## 
## [[3]]
## [1] 5.249599 3.318627 3.110832
## 
## [[4]]
## [1] 6.224037 1.035009 2.433546 5.674936
## 
## [[5]]
## [1] 7.351962 4.979856 4.897077 4.745803 3.608916

# (the outputs are different because our function makes new random varibles each
# time)
```

## `tapply()` ##

> `tapply` is used to apply a function over subsets of a vector. It will
simplify the result, like sapply.
>
> Example code:


```r
x <- c(1:30) # make a vector with 30 variables
f<- gl(3,10) # make a factor variable with 3 levels and 10 reps of each level
f
##  [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
## Levels: 1 2 3

# apply the mean function to x, subsetting by f
tapply(x, f, mean) 
##    1    2    3 
##  5.5 15.5 25.5
# apply the range function to x, subsetting by f
tapply(x, f, range) 
## $`1`
## [1]  1 10
## 
## $`2`
## [1] 11 20
## 
## $`3`
## [1] 21 30
```

# Misc commands #

## `subset()` ##

> The `subset()` function in R will return a subset of an argument that meet a
particular condition.
>
> Example code:


```r
numvec <- c(2,5,8,9,0,6,7,8,4,5,7,11)
subset(numvec, numvec < 9 & numvec > 4)
## [1] 5 8 6 7 8 5 7
```
