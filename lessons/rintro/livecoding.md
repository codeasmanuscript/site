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
## [7]   0.8280707
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
## [1] 0.8280707
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
##   0.8280707
```

# apply() #

`apply()` first coerces your dataframe to a matrix, which means all the columns must have the same type. Because our dataframe does not meet this requirement, I'll be taking a subset of the data. However normally this function would be used with matrices.


```r
apply(airQuality[,c(-5)], 2, sd, na.rm = TRUE)
##     Ozone   Solar.R      Wind      Temp       Day    Random 
## 32.987885 90.058422  3.523001  9.465270  8.864520  1.884168

apply(airQuality[,c(-5)], 1, sd, na.rm = TRUE)
##   [1]  72.95361  47.80324  59.61865 122.17007  25.97246  26.05948 116.07109
##   [8]  38.31484  21.00678  81.43336  30.56072  98.88267 113.04858 105.56111
##  [15]  26.38112 129.31479 116.80957  31.22072 122.79012  23.63502  22.18340
##  [22] 122.75903  22.13782  33.66537  27.34116 109.48364  24.94983  23.16533
##  [29]  92.77876  84.41891 104.85494 121.66833 122.28970 101.64730  79.94868
##  [36]  93.57934 111.84439  50.90928 116.35586 109.89113 123.90874 109.79935
##  [43] 105.37547  58.10407 139.83921 135.88643  72.55591 106.78244  23.61436
##  [50]  47.21327  53.50292  63.13045  34.38219  41.91772 103.89745  56.14366
##  [57]  53.39114  30.42315  42.62756  28.91820  58.37002 106.63807  95.44246
##  [64]  91.49991  47.88380  68.26896 120.61974 105.76916 101.90297 104.17618
##  [71]  68.30399  60.93576 101.74945  66.77729 121.84793  30.50375  98.72650
##  [78] 104.16569 107.06780  71.07134  81.64079  27.14439 107.17312 122.80686
##  [85] 109.74954  83.84587  36.08353  36.75078  79.05523 103.03212  94.11586
##  [92]  94.19354  38.70147  30.31137  37.50725  43.53354  35.39075  40.69180
##  [99]  98.98340  87.61588  80.82003  93.79226  59.16332  72.96253 104.45366
## [106]  59.59783  34.81886  32.48885  31.80581  45.39250  92.34420  70.16571
## [113]  98.39853  25.95995 105.08630  78.83131  97.52915  79.80116  65.15699
## [120]  75.47193  86.50706  88.60398  70.98439  68.57119  77.71301  72.54240
## [127]  75.24006  42.66515  39.56450  97.51167  85.05226  88.52687  99.04888
## [134]  88.64080  99.19253  91.60709  25.48563  44.04700  89.48877  85.18028
## [141]  26.78671  89.96647  77.39165  90.57264  24.64942  52.99445  26.58208
## [148]  21.43179  71.71925  58.83347  71.84472  50.27981  84.14929
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

