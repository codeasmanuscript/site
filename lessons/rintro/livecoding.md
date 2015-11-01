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


{% highlight r %}
getwd()

setwd("/Users/thesarahmeister/")

dir.create("Desktop/practice-2015-10/sarah/intror")

setwd("Desktop/practice-2015-10/sarah/intror")

dir()

{% endhighlight %}

# Now let's code! #

Download the `airQuality.csv` file from our [Github repo](https://github.com/codeasmanuscript/practice-2015-10) and import it into R using the `read.csv` function



{% highlight r %}
airQuality <- read.csv("airQuality.csv", header = TRUE)
{% endhighlight %}

Now let's look at the data using a few different functions


{% highlight r %}
head(airQuality)
{% endhighlight %}



{% highlight text %}
##   Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67   May   1
## 2    36     118  8.0   72   May   2
## 3    12     149 12.6   74   May   3
## 4    18     313 11.5   62   May   4
## 5    NA      NA 14.3   56   May   5
## 6    28      NA 14.9   66   May   6
{% endhighlight %}



{% highlight r %}

head(airQuality, n=8)
{% endhighlight %}



{% highlight text %}
##   Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67   May   1
## 2    36     118  8.0   72   May   2
## 3    12     149 12.6   74   May   3
## 4    18     313 11.5   62   May   4
## 5    NA      NA 14.3   56   May   5
## 6    28      NA 14.9   66   May   6
## 7    23     299  8.6   65   May   7
## 8    19      99 13.8   59   May   8
{% endhighlight %}



{% highlight r %}

tail(airQuality)
{% endhighlight %}



{% highlight text %}
##     Ozone Solar.R Wind Temp Month Day
## 148    14      20 16.6   63   Sep  25
## 149    30     193  6.9   70   Sep  26
## 150    NA     145 13.2   77   Sep  27
## 151    14     191 14.3   75   Sep  28
## 152    18     131  8.0   76   Sep  29
## 153    20     223 11.5   68   Sep  30
{% endhighlight %}



{% highlight r %}

str(airQuality)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	153 obs. of  6 variables:
##  $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
##  $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
##  $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
##  $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
##  $ Month  : Factor w/ 5 levels "Aug","Jul","Jun",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...
{% endhighlight %}



{% highlight r %}

summary(airQuality)
{% endhighlight %}



{% highlight text %}
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
{% endhighlight %}



{% highlight r %}

nrow(airQuality)
{% endhighlight %}



{% highlight text %}
## [1] 153
{% endhighlight %}



{% highlight r %}

ncol(airQuality)
{% endhighlight %}



{% highlight text %}
## [1] 6
{% endhighlight %}



{% highlight r %}

range(airQuality$Temp)
{% endhighlight %}



{% highlight text %}
## [1] 56 97
{% endhighlight %}

Lets alter our dataset a bit


{% highlight r %}

names(airQuality$Solar.R) <- "Solar"

airQuality$Random <- rnorm(153, 1, 2)
{% endhighlight %}

Okay time to subset our data


{% highlight r %}

rowThree <- airQuality[3, ]

colFour <- airQuality[ ,4]

ozone <- airQuality$Ozone

highTemp <- airQuality[airQuality$Temp > 80, ]

may <- airQuality[airQuality$Month == "May", ]

highTempOrMay <- airQuality[airQuality$Month == "May" | airQuality$Temp > 80, ]

lowTempAndSep <- subset(airQuality, airQuality$Month == "Sep" & airQuality$Temp < 70)
{% endhighlight %}

okay let's perform some basic data manipulations on our dataframe and subsetted data


{% highlight r %}

mean(airQuality$Ozone) #returns an NA

mean(airQuality$Ozone, na.rm=TRUE)

colMeans(airQuality, na.rm=TRUE) #this one doesn't work

airQualNoMonth <- airQuality[,-5]

colMeans(airQualNoMonth, na.rm=TRUE)

sd(colFour)

sd(airQualNoMonth)
{% endhighlight %}

What happens if we have multiple columns that are non-numeric and we don't want to remove them all to use the built-in `colMeans()` function? We can make our **own** function!


{% highlight r %}
columnmean <- function (y, remove.NA = TRUE) {
  nc <- ncol(y)
  means <- vector("numeric", length=0)
  for (i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = remove.NA)
  }
  means
}

columnmean(airQuality)
{% endhighlight %}



{% highlight text %}
## Warning in mean.default(y[, i], na.rm = remove.NA): argument is not numeric
## or logical: returning NA
{% endhighlight %}



{% highlight text %}
## [1]  42.129310 185.931507   9.957516  77.882353         NA  15.803922
## [7]   0.916601
{% endhighlight %}

Cool right? Now let's try a function with an if/else expression. 


{% highlight r %}

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
{% endhighlight %}



{% highlight text %}
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
{% endhighlight %}



{% highlight r %}

highlow <- above80(airQuality$Temp)

high <- highlow[[1]]

low <- highlow[[2]]
{% endhighlight %}

# Loop Functions #

The last thing for today are the very useful built-in loop functions. These functions have the word `apply` in them.

- `lapply`: loop over a list and evaluate a function on each element 
- `sapply`: same as `lapply` but it tries to simplify the result
- `apply`: apply a function over the margins of an array 
- `tapply`: apply a function over subsets of a vector (`lapply()` used with `split()` does the same thing)
- `mapply`: a multivariate version of `lapply` 

# lapply() #

Remember the function we made? It can be replaced with an `lapply()` loop.

{% highlight r %}
lapply(airQuality, mean, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
## Warning in mean.default(X[[i]], ...): argument is not numeric or logical:
## returning NA
{% endhighlight %}



{% highlight text %}
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
## [1] 0.916601
{% endhighlight %}

# sapply() #

Alternatively we can try `sapply()`. This will return a named numeric vector (simpified from a list)

{% highlight r %}
sapply(airQuality, mean, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
## Warning in mean.default(X[[i]], ...): argument is not numeric or logical:
## returning NA
{% endhighlight %}



{% highlight text %}
##      Ozone    Solar.R       Wind       Temp      Month        Day 
##  42.129310 185.931507   9.957516  77.882353         NA  15.803922 
##     Random 
##   0.916601
{% endhighlight %}

# apply() #

`apply()` first coerces your dataframe to a matrix, which means all the columns must have the same type. Because our dataframe does not meet this requirement, I'll be taking a subset of the data. However normally this function would be used with matrices.


{% highlight r %}
apply(airQuality[,c(-5)], 2, sd, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##     Ozone   Solar.R      Wind      Temp       Day    Random 
## 32.987885 90.058422  3.523001  9.465270  8.864520  2.091644
{% endhighlight %}



{% highlight r %}

apply(airQuality[,c(-5)], 1, sd, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##   [1]  72.89058  46.94296  58.69988 121.77277  25.62174  25.75497 115.47911
##   [8]  38.64267  21.34867  81.09362  30.02192  98.62413 112.61584 105.66532
##  [15]  27.26847 129.50176 116.47159  31.26497 123.08330  23.93098  21.81966
##  [22] 123.51997  23.04112  33.19412  26.94703 110.01967  25.26733  22.88824
##  [29]  92.82220  84.03591 104.86704 122.41928 122.31465 102.42537  79.76670
##  [36]  94.18712 111.56434  51.01858 116.07814 110.38572 123.47021 109.27081
##  [43] 105.86196  58.30500 140.07391 135.54122  72.33150 106.82007  23.63969
##  [50]  46.01597  53.22244  63.11980  33.84056  41.67048 103.81005  55.83172
##  [57]  53.47395  29.03317  42.86913  29.24985  57.85399 106.70907  95.40798
##  [64]  91.31892  48.18947  67.71641 120.77618 105.84699 102.34370 104.07476
##  [71]  67.97639  60.74067 101.58831  66.48642 121.75326  30.67241  98.43243
##  [78] 104.27405 107.64244  72.14305  81.66779  26.80088 107.47906 122.58368
##  [85] 109.45345  84.18191  35.62429  36.17203  79.75871 103.09283  93.26686
##  [92]  94.07138  38.88395  29.95196  38.00552  43.19716  35.16671  41.00030
##  [99]  99.41880  87.31363  81.25121  94.66409  59.49559  73.33740 104.78695
## [106]  59.10313  35.31902  32.01702  31.20583  45.29166  91.96314  70.91207
## [113]  98.68951  25.94546 105.50772  78.26531  97.84691  80.28066  64.05905
## [120]  75.83915  86.56595  88.41150  70.34087  68.32943  77.89078  72.86685
## [127]  75.04048  43.14471  39.50083  97.28408  85.08832  88.34328  99.40968
## [134]  89.14843  99.03010  90.96073  25.09182  44.32411  89.59789  84.73321
## [141]  27.09205  90.80568  77.70208  91.01537  25.24025  52.22038  26.51072
## [148]  21.49442  72.38703  58.93778  72.25072  50.24947  83.25093
{% endhighlight %}

# mapply #

`mapply` is a multivariate apply (like `lapply`) that applies a function over a set of arguments.

{% highlight r %}
mapply(range, airQuality[,c(1,3,6)], na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##      Ozone Wind Day
## [1,]     1  1.7   1
## [2,]   168 20.7  31
{% endhighlight %}

# tapply #

`tapply` is used to apply a function over subsets of a vector. It takes two arguements: a vector to apply to function on and a factor variable that subsets the vector. It will simplify the result, like sapply. 


{% highlight r %}
tapply(airQuality$Ozone, airQuality$Month, range, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
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
{% endhighlight %}

