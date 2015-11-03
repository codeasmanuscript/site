---
title: "Introduction to R"
author: Sarah Meister
published: true
date: 2015-11-02
layout: page
sidebar: false
tag:
    - Lessons
    - Slides
    - IntroR
    - R
categories:
    - Lessons
    - IntroR
    - R
---
    
# Welcome to our R introduction workshop #

## Purpose: ##

To introduce you to the R language and common data manipulations used in R

# What is R and why do I need to learn it? #

R is an object-oritented programming language for statistical computing and graphics.

Benefits of R:

1. Easily extendible through **FREE** R packages
2. Active community (lots on online help)
3. Able to produce publication-quality graphs, and dynamic and interactive graphs with additional packages (did I mention they were **FREE**??)
4. For computationally intensive tasks, R objects can be manipulated with C, C++, Java, .NET or Python code 
5. Has it's own flavor of Markdown, making R code easily documented and shareable (which you will be learning in another lesson)

## Learning objectives ##

After this workshop, our expectation is that you will be able to:

1. Understand the "grammar" of the R language
2. Import and export data into R
3. View data in R and perform basic calculations & manipulations
4. Make and use a basic R function 
5. Understand and use the useful built-in loop functions

# The R language #

R is an object-oriented programing language, meaning everything we encounter in R is an object. 

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


```r
a <- c(0.4, 1.2)         # numeric
b <- c(TRUE, FALSE)      # logical
c <- c("a","b","c")      # character
d <- c(1L, 2L)           # integer
e <- 1:10                # integer
f <- c(1+0i, 2+4i)       # complex
```

Empty vectors can be made using the `vector()` function


```r
x <- vector("numeric", length=10)
x
##  [1] 0 0 0 0 0 0 0 0 0 0
```

# Lists #

A list is a special type of vector that can contain objects of different classes. For instance, we can have a list with a numeric dataframe as one object within the list, and a string vector as another. 


```r
x <- list(1,"a", TRUE, 1+4i)
x
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
```

The elements of a list are seperated by double brackets. 
 
# Matrices #

Matrices are vectors with a dimension attribute. The `dim` attribute is an integer vector of length = 2 (nrow, ncol). Matrix multiplication is done with the %*% operator


```r
x <- matrix(1:6, nrow=2, ncol=3)
x
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6

dim(x)
## [1] 2 3

attributes(x)
## $dim
## [1] 2 3
```
 
Matrices are constructed column-wise, so entries start at the upper left corner and run down the columns. 

Matrices can be created directly from vectors by adding a dimension value


```r
x <- 1:10

x
##  [1]  1  2  3  4  5  6  7  8  9 10

dim(x) <- c(2,5)

x
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```

We can also create matrices by column-binding or row-binding with the functions `cbind()` and `rbind()`


```r
x <- 1:3
y <- 10:12
cbind(x,y)
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
rbind (x, y)
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
```

# Factors #

Factors are used to represent catagorical data. They can be ordered or unordered.

* They are like an integer vector where each integer has a label. 
* Factors are more descriptive than integers e.g. "Male" and "Female" vs. 1 and 2
* Factors are treated specially by modelling functions like `lm()` and `glm()`


```r
x <- factor(c("yes", "yes", "no", "no", "yes"))
x
## [1] yes yes no  no  yes
## Levels: no yes
table (x)
## x
##  no yes 
##   2   3
unclass(x)
## [1] 2 2 1 1 2
## attr(,"levels")
## [1] "no"  "yes"
```

# Dataframe #

Dataframes are used in R to store tabular data. Dataframes are like matrices (meaning they have rows and columns) that can store different classes of objects in each column (e.g. numeric, character, logical, etc.).

Depending on the source of the data, dataframes can be made using the `read.table()`, `read.csv()` or `data.frame()` functions. 


```r
(x <- data.frame(foo = 1:4, bar = c(T,T,F,F)))
##   foo   bar
## 1   1  TRUE
## 2   2  TRUE
## 3   3 FALSE
## 4   4 FALSE

nrow(x)
## [1] 4
ncol(x)
## [1] 2
```


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

```r
x <- 1:3
names(x)
## NULL

names(x) <- c("alpha", "beta", "gamma")

x
## alpha  beta gamma 
##     1     2     3
names(x)
## [1] "alpha" "beta"  "gamma"
str(x)
##  Named int [1:3] 1 2 3
##  - attr(*, "names")= chr [1:3] "alpha" "beta" "gamma"
```

# Now let's code! #

# Starting R #

We will be using R studio for this course as it's a user-friendly GUI for R. You can also access R from Terminal (Mac) or Command Line (Windows), if you please. 

Download the airQuality.csv file from our [Github repo](https://github.com/codeasmanuscript/workshops/tree/master/lessons/rintro) and import it into R using the `read.csv` function

# Loop Functions #

R has some very useful built-in loop functions. These functions have the word `apply` in them.

- `lapply`: loop over a list and evaluate a function on each element 
- `sapply`: same as `lapply` but it tries to simplify the result
- `apply`: apply a function over the margins of an array 
- `tapply`: apply a function over subsets of a vector (`lapply()` used with `split()` does the same thing)
- `mapply`: a multivariate version of `lapply` 

# lapply() #

Remember the function we made? It can be replaced with an `lapply()` loop.

```r
lapply(airQuality, mean, na.rm = TRUE)
```

# sapply() #

Alternatively we can try `sapply()`. This will return a named numeric vector (simpified from a list)

```r
sapply(airQuality, mean, na.rm = TRUE)
```

# apply() #

`apply()` first coerces your dataframe to an array which means all the columns must have the same type. Because our dataframe does not meet this requirement, I'll be taking a subset of the data. Normally this function would only be used with matrices.


```r
apply(airQuality[,c(-5)], 2, sd, na.rm = TRUE)

apply(airQuality[,c(-5)], 1, sd, na.rm = TRUE)
```

# mapply #

`mapply` is a multivariate apply (like `lapply`) that applies a function over a set of arguments.

```r
mapply(range, airQuality[,c(1,3,6)], na.rm = TRUE)
```

# tapply #

`tapply` is used to apply a function over subsets of a vector. It takes two arguements: a vector to apply to function on and a factor variable that subsets the vector. It will simplify the result, like sapply. 


```r
tapply(airQuality$Ozone, airQuality$Month, range, na.rm = TRUE)

## applying the range function on the Ozone column by the Month column.
```
