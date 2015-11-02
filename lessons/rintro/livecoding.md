---
title: "Introduction to R"
author: "Sarah Meister"
date: '2015-11-02'
output: html_vignette
layout: page
sidebar: no
published: true
---

# Starting R #

We will be using R studio for this course as it's a user-friendly GUI for R. You can also access R from Terminal (Mac) or Command Line (Windows) if you please. 


```r
getwd()

setwd("/Users/thesarahmeister/")

dir.create("Desktop/practice-2015-10/sarah/intror")

setwd("Desktop/practice-2015-10/sarah/intror")

dir()

```

# Now let's code! #

Download the `airQuality.csv` file from our [Github repo](https://github.com/codeasmanuscript/practice-2015-10) and import it into R using the `read.csv` function



```r
airQuality <- read.csv("airQuality.csv", header = TRUE)
```

Now let's look at the data using a few different functions


```r
head(airQuality)
##   Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67   May   1
## 2    36     118  8.0   72   May   2
## 3    12     149 12.6   74   May   3
## 4    18     313 11.5   62   May   4
## 5    NA      NA 14.3   56   May   5
## 6    28      NA 14.9   66   May   6

head(airQuality, n=8)
##   Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67   May   1
## 2    36     118  8.0   72   May   2
## 3    12     149 12.6   74   May   3
## 4    18     313 11.5   62   May   4
## 5    NA      NA 14.3   56   May   5
## 6    28      NA 14.9   66   May   6
## 7    23     299  8.6   65   May   7
## 8    19      99 13.8   59   May   8

tail(airQuality)
##     Ozone Solar.R Wind Temp Month Day
## 148    14      20 16.6   63   Sep  25
## 149    30     193  6.9   70   Sep  26
## 150    NA     145 13.2   77   Sep  27
## 151    14     191 14.3   75   Sep  28
## 152    18     131  8.0   76   Sep  29
## 153    20     223 11.5   68   Sep  30

str(airQuality)
## 'data.frame':	153 obs. of  6 variables:
##  $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
##  $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
##  $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
##  $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
##  $ Month  : Factor w/ 5 levels "Aug","Jul","Jun",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

summary(airQuality)
##      Ozone           Solar.R           Wind             Temp      
##  Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
##  1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
##  Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
##  Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
##  3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
##  Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
##  NA's   :37       NA's   :7                                       
##  Month         Day      
##  Aug:31   Min.   : 1.0  
##  Jul:31   1st Qu.: 8.0  
##  Jun:30   Median :16.0  
##  May:31   Mean   :15.8  
##  Sep:30   3rd Qu.:23.0  
##           Max.   :31.0  
## 

nrow(airQuality)
## [1] 153

ncol(airQuality)
## [1] 6

range(airQuality$Temp)
## [1] 56 97
```

Lets alter our dataset a bit


```r

names(airQuality$Solar.R) <- "Solar"

airQuality$Random <- rnorm(153, 1, 2)
```

Okay time to subset our data


```r

rowThree <- airQuality[3, ]

colFour <- airQuality[ ,4]

ozone <- airQuality$Ozone

highTemp <- airQuality[airQuality$Temp > 80, ]

may <- airQuality[airQuality$Month == "May", ]

highTempOrMay <- airQuality[airQuality$Month == "May" | airQuality$Temp > 80, ]

lowTempAndSep <- subset(airQuality, airQuality$Month == "Sep" & airQuality$Temp < 70)
```

okay let's perform some basic data manipulations on our dataframe and subsetted data


```r

mean(airQuality$Ozone) #returns an NA

mean(airQuality$Ozone, na.rm=TRUE)

colMeans(airQuality, na.rm=TRUE) #this one doesn't work

airQualNoMonth <- airQuality[,-5]

colMeans(airQualNoMonth, na.rm=TRUE)

sd(colFour)

sd(airQualNoMonth)
```

What happens if we have multiple columns that are non-numeric and we don't want to remove them all to use the built-in `colMeans()` function? We can make our **own** function!


```r
columnmean <- function (y, remove.NA = TRUE) {
  nc <- ncol(y)
  means <- vector("numeric", length=0)
  for (i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = remove.NA)
  }
  means
}

columnmean(airQuality)
## Warning in mean.default(y[, i], na.rm = remove.NA): argument is not numeric
## or logical: returning NA
## [1]  42.1293103 185.9315068   9.9575163  77.8823529          NA  15.8039216
## [7]   0.9840097
```

Cool right? Now let's try a function with an if/else expression. 


```r

above80 <- function(y) {
    y <- na.omit(y)
    nob <- length(y)
    high <- vector("numeric", length=0)
    low <- vector("numeric", length=0)
  for (i in 1:nob) {
    if (y[i] > 80) {
      high <- append(high, y[i])
    }
    else {
      low <- append(low, y[i])
    }
  }
  list(high,low)
}

above80(airQuality$Temp)
## [[1]]
##  [1] 81 84 85 82 87 90 87 93 92 82 83 84 85 81 84 83 83 88 92 92 89 82 81
## [24] 91 81 82 84 87 85 81 82 86 85 82 86 88 86 83 81 81 81 82 86 85 87 89
## [47] 90 90 92 86 86 82 81 86 88 97 94 96 94 91 92 93 93 87 84 81 82 81
## 
## [[2]]
##  [1] 67 72 74 62 56 66 65 59 61 69 74 69 66 68 58 64 66 57 68 62 59 73 61
## [24] 61 57 58 57 67 79 76 78 74 67 79 80 79 77 72 65 73 76 77 76 76 76 75
## [47] 78 73 80 77 73 80 74 80 79 77 79 76 78 78 77 72 75 79 80 78 75 73 76
## [70] 77 71 71 78 67 76 68 64 71 69 63 70 77 75 76 68

highlow <- above80(airQuality$Temp)

high <- highlow[[1]]

low <- highlow[[2]]
```

# Loop Functions #

The last thing for today are the very useful built-in loop functions. These functions have the word `apply` in them.

- `lapply`: loop over a list and evaluate a function on each element 
- `sapply`: same as `lapply` but it tries to simplify the result
- `apply`: apply a function over the margins of an array 
- `tapply`: apply a function over subsets of a vector (`lapply()` used with `split()` does the same thing)
- `mapply`: a multivariate version of `lapply` 

# lapply() #

Remember the function we made? It can be replaced with an `lapply()` loop.

```r
lapply(airQuality, mean, na.rm = TRUE)
## Warning in mean.default(X[[i]], ...): argument is not numeric or logical:
## returning NA
## $Ozone
## [1] 42.12931
## 
## $Solar.R
## [1] 185.9315
## 
## $Wind
## [1] 9.957516
## 
## $Temp
## [1] 77.88235
## 
## $Month
## [1] NA
## 
## $Day
## [1] 15.80392
## 
## $Random
## [1] 0.9840097
```

# sapply() #

Alternatively we can try `sapply()`. This will return a named numeric vector (simpified from a list)

```r
sapply(airQuality, mean, na.rm = TRUE)
## Warning in mean.default(X[[i]], ...): argument is not numeric or logical:
## returning NA
##       Ozone     Solar.R        Wind        Temp       Month         Day 
##  42.1293103 185.9315068   9.9575163  77.8823529          NA  15.8039216 
##      Random 
##   0.9840097
```

# apply() #

`apply()` first coerces your dataframe to a matrix, which means all the columns must have the same type. Because our dataframe does not meet this requirement, I'll be taking a subset of the data. However normally this function would be used with matrices.


```r
apply(airQuality[,c(-5)], 2, sd, na.rm = TRUE)
##     Ozone   Solar.R      Wind      Temp       Day    Random 
## 32.987885 90.058422  3.523001  9.465270  8.864520  1.969605

apply(airQuality[,c(-5)], 1, sd, na.rm = TRUE)
##   [1]  72.82270  47.23650  59.37151 121.62190  24.84774  26.36542 115.67801
##   [8]  38.40799  21.54229  81.28748  30.96865  98.78830 112.67089 105.33482
##  [15]  26.06268 129.50212 116.96760  30.41116 123.01349  23.49386  21.77755
##  [22] 123.18123  21.93297  33.76490  27.92711 109.99494  23.57278  22.99182
##  [29]  93.55545  84.47980 105.21199 122.09558 122.80170 102.05193  79.94285
##  [36]  94.19656 111.30217  51.79243 116.17630 110.39896 123.98668 108.77720
##  [43] 105.49187  57.91526 139.74419 135.90928  72.64085 106.43035  23.10204
##  [50]  47.45831  53.64691  62.60415  34.39119  42.17424 104.44171  55.94074
##  [57]  54.14359  28.78309  43.28784  28.37771  57.90655 106.88412  95.12412
##  [64]  91.66259  48.21788  67.74415 120.33248 105.71376 102.17632 104.09465
##  [71]  68.53206  60.21272 102.35465  65.89063 121.89362  30.07331  98.23169
##  [78] 103.76614 107.19162  71.03225  81.71409  27.04795 107.51568 123.32384
##  [85] 110.08362  84.38543  36.13764  36.37102  79.16091 102.96910  93.30029
##  [92]  94.09817  39.48974  30.45752  37.68110  42.68174  35.07430  40.31110
##  [99]  99.76131  87.38370  81.39169  94.11566  59.85649  72.74146 104.86862
## [106]  59.22848  35.14605  32.27141  32.23079  45.22937  92.05330  70.57883
## [113]  98.45452  25.29983 104.64771  78.81379  97.84441  79.33138  64.18218
## [120]  75.31127  86.26419  87.84973  70.58833  69.42031  76.89533  72.66027
## [127]  74.43070  42.60674  40.47040  97.39282  84.61841  88.89872  99.49476
## [134]  88.87661  99.30527  91.12215  25.12572  44.34830  89.09724  85.00021
## [141]  27.43158  90.02379  77.34522  90.78009  24.87064  52.91799  27.15257
## [148]  20.40687  72.09858  59.95946  71.92740  50.08571  83.41606
```

# mapply #

`mapply` is a multivariate apply (like `lapply`) that applies a function over a set of arguments.

```r
mapply(range, airQuality[,c(1,3,6)], na.rm = TRUE)
##      Ozone Wind Day
## [1,]     1  1.7   1
## [2,]   168 20.7  31
```

# tapply #

`tapply` is used to apply a function over subsets of a vector. It takes two arguements: a vector to apply to function on and a factor variable that subsets the vector. It will simplify the result, like sapply. 


```r
tapply(airQuality$Ozone, airQuality$Month, range, na.rm = TRUE)
## $Aug
## [1]   9 168
## 
## $Jul
## [1]   7 135
## 
## $Jun
## [1] 12 71
## 
## $May
## [1]   1 115
## 
## $Sep
## [1]  7 96
```

