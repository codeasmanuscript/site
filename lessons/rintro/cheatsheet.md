---
title: "Cheatsheet: Introduction to R"
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

Brief description/intro

# (language) commands: Some useful or common ones #

## `command` ##

> Description

> Example code:

    example code (note the tab/4 spaces indent)

## `command` ##

> Description

> Example code:

    example code (note the tab/4 spaces indent)
    
R is an object-oriented programing language, meaning everything we encounter in R is an object. 

R has several types of objects:

R has a 5 basic classes of objects:

* Character
* Numeric
* Integer
* Complex
* Logical

R has 5 different types of objects:

* Vectors
* Lists
* Matrices
* Factors
* Dataframes

Thus you could have a logical vector, a character dataframe, a numeric matrix, etc. 

# Vectors #

The most basic object is a vector. A vector is a sequence of objects of the same class. We can make vectors using the `c()` function.


{% highlight r %}
a <- c(0.4, 1.2)         # numeric
b <- c(TRUE, FALSE)      # logical
c <- c("a","b","c")      # character
d <- c(1L, 2L)           # integer
e <- 1:10                # integer
f <- c(1+0i, 2+4i)       # complex
{% endhighlight %}

Empty vectors can be made using the `vector()` function


{% highlight r %}
(x <- vector("numeric", length=10))
{% endhighlight %}



{% highlight text %}
##  [1] 0 0 0 0 0 0 0 0 0 0
{% endhighlight %}

# Lists #

A list is a special type of vector that can contain objects of different classes. For instance, we can have a list with a numeric dataframe as one object within the list, and a string vector as another. 


{% highlight r %}
(x <- list(1,"a", TRUE, 1+4i))
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 1
## 
## [[2]]
## [1] "a"
## 
## [[3]]
## [1] TRUE
## 
## [[4]]
## [1] 1+4i
{% endhighlight %}

The elements of a list are seperated by double brackets. 
 
# Matrices #

Matrices are vectors with a dimension attribute. The dim attribute is an integer vector of length = 2 (nrow, ncol). Matrix multiplication is done with the %*% operator


{% highlight r %}
(x <- matrix(1:6, nrow=2, ncol=3))
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
{% endhighlight %}



{% highlight r %}

dim(x)
{% endhighlight %}



{% highlight text %}
## [1] 2 3
{% endhighlight %}



{% highlight r %}

attributes(x)
{% endhighlight %}



{% highlight text %}
## $dim
## [1] 2 3
{% endhighlight %}
 
Matrices are constructed column-wise, so entries start at the upper left corner and run down the columns. 

Matrices can be created directly from vectors by adding a dimension value


{% highlight r %}
(x <- 1:10)
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}



{% highlight r %}

(dim(x) <- c(2,5))
{% endhighlight %}



{% highlight text %}
## [1] 2 5
{% endhighlight %}

We can also create matrices by column-binding or row-binding with the functions `cbind()` and `rbind()`


{% highlight r %}
x <- 1:3
y <- 10:12
cbind(x,y)
{% endhighlight %}



{% highlight text %}
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
{% endhighlight %}



{% highlight r %}
rbind (x, y)
{% endhighlight %}



{% highlight text %}
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
{% endhighlight %}

# Factors #

Factors are used to represent catagorical data. They can be ordered or unordered.

* They are like an integer vector where each integer has a label. 
* Factors are more descriptive than integers e.g. "Male" and "Female" vs. 1 and 2
* Factors are treated specially by modelling functions like `lm()` and `glm()`


{% highlight r %}
(x <- factor(c("yes", "yes", "no", "no", "yes")))
{% endhighlight %}



{% highlight text %}
## [1] yes yes no  no  yes
## Levels: no yes
{% endhighlight %}



{% highlight r %}
table (x)
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

# Dataframe #

Dataframes are used in R to store tabular data. They are represented in R as a special type of list where every element in the list has the same length. Each element of the list can be thought of as a **column** and each length of the list can be thought of as a **row**. Because a dataframe is a type of list, dataframes can store different classes of objects in each column (e.g. numeric, character, logical, etc.).

Depending on the source of the data, dataframes can be made using the `read.table()`, `read.csv` or `data.frame()` functions. 


{% highlight r %}
(x <- data.frame(foo = 1:4, bar = c(T,T,F,F)))
{% endhighlight %}



{% highlight text %}
##   foo   bar
## 1   1  TRUE
## 2   2  TRUE
## 3   3 FALSE
## 4   4 FALSE
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
## [1] 2
{% endhighlight %}


# Attributes #

R objects can have attributes, such as:

* names
* classes
* lengths
* dimensions (matrices/dataframes)
* user defined attributes, such as metadata
* dataframes have a special attribute called `row.names`

Attributes can be modified with the `attributes()` function, among others.

For example, modifiying the `names` of a vector can make your code more readable.

{% highlight r %}
x <- 1:3
names(x)
{% endhighlight %}



{% highlight text %}
## NULL
{% endhighlight %}



{% highlight r %}

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

# Looking for help in R #

* Look up the documentation for a function: `help("function")` OR

* ?function

* Look up documentation for a package: `help(package="packagename")`

# Packages #

R comes with a few default packages, however there are thousands of R packages that extend R's capabilities (such as `ggplot2`, our next lesson)

* To see what packages are loaded: `search()`

* To view available packages: `library()`

* To load a package: `library(packagename)`

* Install new package: `install.packages("packagename")` 

# Working Directory #

R knows the directory it was started in, and refers to this as the "working directory". This is where R will search for any files you are imputting, and where it will place any files you output.  

To look at the current working directory: `getwd()` 

To change the working directory: ` setwd("directory_path")`

To make a new folder in R: `dir.create(path)`

# Imputting Tabular Data #

Most data you will work with comes in tabular form (such as an Excel spreadsheet). The two most commonly-used functions used to imput tabular data into R are `read.table()` and `read.csv()`. 

{% highlight r %}
data <- read.table("file_name.txt", header=FALSE, sep="\t")

# \t is the regular expression for the tab key. This means our table is tab-delimited (tab-separated)

data2 <- read.csv("file_name.csv", header=TRUE)

#.csv is a comma-separated table 
{% endhighlight %}

# Outputting Tabular Data #

Often you'll want to save R data into a tabular form (e.g. to view in Excel). This is where you use `write.table()`

{% highlight r %}
write.table(data, file= "myfile.csv", sep=",", row.names=TRUE, col.names=FALSE)
{% endhighlight %}

# Subsetting Data #

Using `[]` in R allows you to subset certain parts of a vector


{% highlight r %}
x <- c(TRUE, FALSE, "alpha", "beta", "gamma", 1, 2)

x[c(1, 4, 5)]
{% endhighlight %}



{% highlight text %}
## [1] "TRUE"  "beta"  "gamma"
{% endhighlight %}

This also works for matrices


{% highlight r %}
a <- matrix(1:9, nrow = 3)
colnames(a) <- c("A", "B", "C")
a[1:2, ]
{% endhighlight %}



{% highlight text %}
##      A B C
## [1,] 1 4 7
## [2,] 2 5 8
{% endhighlight %}



{% highlight r %}
a[c(T, F, T), c("B", "A")]
{% endhighlight %}



{% highlight text %}
##      B A
## [1,] 4 1
## [2,] 6 3
{% endhighlight %}



{% highlight r %}
a[0, -2]
{% endhighlight %}



{% highlight text %}
##      A C
{% endhighlight %}

and dataframes


{% highlight r %}
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])

df[ ,c(1, 3)]    #gives the columns that are in position 1 and 3
{% endhighlight %}



{% highlight text %}
##   x z
## 1 1 a
## 2 2 b
## 3 3 c
{% endhighlight %}

You can also easily subset a column in a dataframe using a $


{% highlight r %}
df <- data.frame(x = 1:10, y = 11:20, z = letters[1:10])

df$z
{% endhighlight %}



{% highlight text %}
##  [1] a b c d e f g h i j
## Levels: a b c d e f g h i j
{% endhighlight %}

# R Operators #

Assignment operators

|Operator | Description|
|---- | ---- |
| <- | local environment assignment |
| <<- | global environment assignment | 

Arthmetic Operators

|Operator | Description|
|-------- | -----------|
|+        | addition|
|-        | subtraction|
|*        | multiplication|
|/        | division|
|^ or **  | exponentiation|
|x %% y   | modulus (5 %% 2 is 1)|
|x %/% y    | integer division (5%/% is 2)|
|x %*% y | matrix multiplication|

Logical Operators

Operator  | Description
--------  | -----------
<         | less than
<=        | less than or equal to
>         | greater than
>=        | greater than or equal to
==        | exactly equal to
!=        | not equal to
!x        | not x
x &#124; y    | x OR y (returns a vector)
x &#124;&#124; y    | x OR y (examines only 1st element of vector)
x & y     | x AND y (returns a vector)
x && y    | x AND y (examines only 1st element of vector)
isTRUE(x) | test if X is TRUE

## Commenting in R #


{% highlight r %}
# commenting in R is easy! Everything past a # means that R will ignore whatever is written there. 
{% endhighlight %}

# subset function #

The `subset()` function in R will return a subset of an argument that meet a particular condition. 


{% highlight r %}
numvec = c(2,5,8,9,0,6,7,8,4,5,7,11)

subset(numvec, numvec < 9 & numvec > 4)
{% endhighlight %}



{% highlight text %}
## [1] 5 8 6 7 8 5 7
{% endhighlight %}

# if-else expressions #


{% highlight r %}
if (condition) {
  ##do this
} else {
  ##do that
}

## to add more conditions

if (condition1) {
  ## do this
} else if (condition2) {
  ## do something different
} else {
  ## do something else
}
{% endhighlight %}

# if-else expressions #


{% highlight r %}
if (x > 3) {
  y <- 10
} else {
  y <- 0
}


### OR


y <- if(x > 3) {
  10
} else {
  0
}
{% endhighlight %}

# for loop #

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


### nested for loops

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

# Writing functions #

functions are created using the `function()` directive and are stored as R objects of the class "function". Functions can be passed as arguments to other functions and they can be nested (functions inside functions)


{% highlight r %}
f <- function(argument) {
  ## do something here 
}
{% endhighlight %}


{% highlight r %}

## make a function called above10 with the argument x that subsets all variables of x that are greater than 10
above10 <- function(x) {
  use <- x > 10
  x[use]
}

## make a function called above with the arguments x & n that subsets all variables of x that are greater than n
above <- function(x, n) {
  use <- x > n
  x[use]
}

## create a function called columnmean that takes the arguments y and the argument remove.NA with a default value of TRUE. This function takes the number of columns of y, turns it into a numeric object, and calculates the mean of each column of y while removing NA values
columnmean <- function (y, remove.NA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = remove.NA)
  }
  means
}
{% endhighlight %}
# Loop Functions #

R has built loop functions, which often have the word "apply" in them.

- `lapply`: loop over a list and evaluate a function on each element 
- `sapply`: same as `lapply` but it tries to simplify the result
- `apply`: apply a function over the margins of an array 
- `tapply`: apply a function over subsets of a vector (`lapply()` used with `split()` does the same thing)
- `mapply`: a multivariate version of `lapply` 

# lapply #

`lapply` loops internally with C code, making the looping faster

`lapply` takes two to three arguments:

1. a list `x` (or another object that is coerced to a list)
2. a function
3. other arguments as necessary


{% highlight r %}
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean)
{% endhighlight %}



{% highlight text %}
## $a
## [1] 3
## 
## $b
## [1] 0.01662391
## 
## $c
## [1] 0.9641099
## 
## $d
## [1] 5.239093
{% endhighlight %}
`lapply` will always return a list

`lapply` and others make heavy use of anonymous functions, which are functions without names.

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

lapply(x, function(ele) ele[ ,1]) 
{% endhighlight %}



{% highlight text %}
## $a
## [1] 1 2
## 
## $b
## [1] 1 2 3
{% endhighlight %}



{% highlight r %}
## create an anonymous function with the argument ele and then define that argument. 
{% endhighlight %}

# sapply #

`sapply` will try to simplify the result of lapply if possible

- if the result is a list where every element is length 1, than a vector is returned 
- if the result is a list where every element is a vector of the same length, a matrix is returned
- otherwise a list is returned


{% highlight r %}
x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(x, mean)
{% endhighlight %}



{% highlight text %}
##         a         b         c         d 
## 3.0000000 0.1447111 1.4409702 4.9880345
{% endhighlight %}

# apply #

`apply` is used to evalute a function over the margins of an array. It is not faster than a loop, but it works in one line. `1` means do the function to the rows. `2` means do the function to the columns


{% highlight r %}
x <- matrix (rnorm(200), 20, 10)
apply(x, 2, mean) # keeping number of columns and collapsing rows. This gives a vector of the means of columns. 
{% endhighlight %}



{% highlight text %}
##  [1] -0.11571236 -0.06699980  0.01217097  0.44350588  0.19404572
##  [6]  0.40123394  0.06988406 -0.24671559 -0.18478261 -0.34146637
{% endhighlight %}



{% highlight r %}

apply(x, 1, sum) # this calculates the sum of all rows
{% endhighlight %}



{% highlight text %}
##  [1]  3.0559833  2.2761056 -0.7529187 -1.7810694  0.3799718  4.1971014
##  [7] -3.7791267 -1.1373524 -0.5365995  2.5774285 -1.4991704  0.4736595
## [13]  0.4518346 -3.8727141  6.6928887  1.9541773 -4.5425821 -0.6554135
## [19]  0.5273807 -0.7263079
{% endhighlight %}



{% highlight r %}

y <- matrix(rnorm(200), 20, 10)

apply(y, 1, quantile, probs = c(0.25, 0.75))
{% endhighlight %}



{% highlight text %}
##           [,1]       [,2]       [,3]        [,4]       [,5]       [,6]
## 25% -0.5016427 -1.1950471 -0.2632323 -0.72541103 -0.8288047 -0.1112117
## 75%  0.6660713 -0.1398314  0.1706738 -0.03855607  0.7696287  0.4328380
##           [,7]          [,8]       [,9]      [,10]      [,11]       [,12]
## 25% -0.3790344 -0.0007273004 -0.5932285 -1.0311000 -0.5114152 -1.05972346
## 75%  0.4960863  0.9409016018  0.6469670  0.8245869  0.4520464 -0.09879784
##          [,13]       [,14]      [,15]      [,16]      [,17]      [,18]
## 25% -0.2181878 -0.09879262 -0.6041801 -0.3944707 -0.9776292 0.09703779
## 75%  0.9720584  0.34848220  0.7378028  0.2837990  0.4302688 1.02127401
##          [,19]      [,20]
## 25% -0.4975348 -0.8437645
## 75%  0.1902392  0.6093546
{% endhighlight %}



{% highlight r %}

# with an array (stacks of matrices: multidimensional)

a <- array(rnorm(2*2*10), c(2,2,10)) #create an array that looks like a bunch of 2 by 2 matrices and take the mean of those

apply(a, c(1,2), mean) #this keeps the 1st and 2nd dimension
{% endhighlight %}



{% highlight text %}
##             [,1]        [,2]
## [1,] -0.32013553 -0.02170755
## [2,]  0.06619694  0.24833397
{% endhighlight %}

# mapply #

`mapply` is a multivariate apply (like `lapply`) that applies a function over a set of arguments. 


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

list(rep(1, 4), rep(2,3), rep(3,2), rep(4,1))
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

# Instant Vectorization to make your code faster#


{% highlight r %}

## create a function called noise that takes the arguments n, mean and sd and produces random varibles with those specifications. 

noise<- function(n,mean, sd) {
  rnorm(n, mean, sd)
}

## apply the noise function with n=5, mean=1 and sd=2

noise(5, 1, 2)
{% endhighlight %}



{% highlight text %}
## [1] -1.2807770 -0.3236428  1.1059255 -0.6843800  2.0478857
{% endhighlight %}



{% highlight r %}

## apply the noise function for n= 1 to 5, mean = 1 to 5, and sd = 2

mapply(noise, 1:5, 1:5, 2)
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] -1.165767
## 
## [[2]]
## [1] 1.768898 2.595327
## 
## [[3]]
## [1] 5.439703 5.308744 5.027059
## 
## [[4]]
## [1] 6.4861905 2.5891246 0.8992601 3.2437817
## 
## [[5]]
## [1] 6.027180 4.904761 2.706628 3.730056 1.632191
{% endhighlight %}



{% highlight r %}

## which is the same as writing

list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))
{% endhighlight %}



{% highlight text %}
## [[1]]
## [1] 2.903614
## 
## [[2]]
## [1]  2.644925 -2.099117
## 
## [[3]]
## [1] 0.4289258 5.3264939 1.5264498
## 
## [[4]]
## [1] 6.643890 4.803451 3.420890 4.351345
## 
## [[5]]
## [1] 4.284911 4.091920 3.406254 7.343844 6.684944
{% endhighlight %}



{% highlight r %}

# (the outputs are different because our function makes new random varibles each time)
{% endhighlight %}

# tapply #

`tapply` is used to apply a function over subsets of a vector. It will simplify the result, like sapply. 


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

tapply(x, f, mean) # apply the mean function to x, subsetting by f
{% endhighlight %}



{% highlight text %}
##    1    2    3 
##  5.5 15.5 25.5
{% endhighlight %}



{% highlight r %}

tapply(x, f, range) # apply the range function to x, subsetting by f
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


