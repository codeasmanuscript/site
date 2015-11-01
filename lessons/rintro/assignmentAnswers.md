---
published: true
---

1. 


{% highlight r %}
a <- c(1:10)
b <- c(11:20)

(c <- a*b)
{% endhighlight %}



{% highlight text %}
##  [1]  11  24  39  56  75  96 119 144 171 200
{% endhighlight %}



{% highlight r %}

c[5]
{% endhighlight %}



{% highlight text %}
## [1] 75
{% endhighlight %}



{% highlight r %}

subset(c, c > 50)
{% endhighlight %}



{% highlight text %}
## [1]  56  75  96 119 144 171 200
{% endhighlight %}


2. 

{% highlight r %}
(d <- matrix(c(7,9,12,2,4,13), 2, 3))
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3]
## [1,]    7   12    4
## [2,]    9    2   13
{% endhighlight %}



{% highlight r %}

(e <- matrix(c(1,7,12,19,2,8,13,20,3,9,14,21), 3, 4))
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    1   19   13    9
## [2,]    7    2   20   14
## [3,]   12    8    3   21
{% endhighlight %}



{% highlight r %}


(f <- d %*% e)
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]  139  189  343  315
## [2,]  179  279  196  382
{% endhighlight %}

3. 


{% highlight r %}
library(datasets)

(g <- mtcars)
{% endhighlight %}



{% highlight text %}
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
{% endhighlight %}



{% highlight r %}

apply(g, 2, mean)
{% endhighlight %}



{% highlight text %}
##        mpg        cyl       disp         hp       drat         wt 
##  20.090625   6.187500 230.721875 146.687500   3.596563   3.217250 
##       qsec         vs         am       gear       carb 
##  17.848750   0.437500   0.406250   3.687500   2.812500
{% endhighlight %}



{% highlight r %}

(h <- g[,"mpg"])
{% endhighlight %}



{% highlight text %}
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
{% endhighlight %}



{% highlight r %}

#OR 

(h <- g$mpg)
{% endhighlight %}



{% highlight text %}
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
{% endhighlight %}



{% highlight r %}

(i <- g[, 4])
{% endhighlight %}



{% highlight text %}
##  [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230
## [18]  66  52  65  97 150 150 245 175  66  91 113 264 175 335 109
{% endhighlight %}



{% highlight r %}

(j <- g[c(3,5),])
{% endhighlight %}



{% highlight text %}
##                    mpg cyl disp  hp drat   wt  qsec vs am gear carb
## Datsun 710        22.8   4  108  93 3.85 2.32 18.61  1  1    4    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.44 17.02  0  0    3    2
{% endhighlight %}



{% highlight r %}

(k <- subset(g, g$hp < 100))
{% endhighlight %}



{% highlight text %}
##                 mpg cyl  disp hp drat    wt  qsec vs am gear carb
## Datsun 710     22.8   4 108.0 93 3.85 2.320 18.61  1  1    4    1
## Merc 240D      24.4   4 146.7 62 3.69 3.190 20.00  1  0    4    2
## Merc 230       22.8   4 140.8 95 3.92 3.150 22.90  1  0    4    2
## Fiat 128       32.4   4  78.7 66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4  75.7 52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4  71.1 65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona  21.5   4 120.1 97 3.70 2.465 20.01  1  0    3    1
## Fiat X1-9      27.3   4  79.0 66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2  26.0   4 120.3 91 4.43 2.140 16.70  0  1    5    2
{% endhighlight %}

4. 


{% highlight r %}

ani <- c("cat", "dog", "cow", "pig")
for (i in ani) {
 if (i == "dog") {
 print(i) }
 else {
 }
}
{% endhighlight %}



{% highlight text %}
## [1] "dog"
{% endhighlight %}

5. 


{% highlight r %}
stats <- function(a,b) {
  print (mean(a))
  print (sd(a))
  print(median(b))
}

stats(g$disp, g$drat)
{% endhighlight %}



{% highlight text %}
## [1] 230.7219
## [1] 123.9387
## [1] 3.695
{% endhighlight %}

6. 

{% highlight r %}
lapply(g, range, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
## $mpg
## [1] 10.4 33.9
## 
## $cyl
## [1] 4 8
## 
## $disp
## [1]  71.1 472.0
## 
## $hp
## [1]  52 335
## 
## $drat
## [1] 2.76 4.93
## 
## $wt
## [1] 1.513 5.424
## 
## $qsec
## [1] 14.5 22.9
## 
## $vs
## [1] 0 1
## 
## $am
## [1] 0 1
## 
## $gear
## [1] 3 5
## 
## $carb
## [1] 1 8
{% endhighlight %}



{% highlight r %}

sapply(g, range, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##       mpg cyl  disp  hp drat    wt qsec vs am gear carb
## [1,] 10.4   4  71.1  52 2.76 1.513 14.5  0  0    3    1
## [2,] 33.9   8 472.0 335 4.93 5.424 22.9  1  1    5    8
{% endhighlight %}



{% highlight r %}

## lapply always returns a list while sapply simiplied the result and returned a matrix
{% endhighlight %}

7. 

{% highlight r %}
mapply(range, mtcars[,c(1,6,7)], na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##       mpg    wt qsec
## [1,] 10.4 1.513 14.5
## [2,] 33.9 5.424 22.9
{% endhighlight %}

8.

{% highlight r %}
tapply(mtcars$hp, mtcars$gear, max, na.rm = TRUE)
{% endhighlight %}



{% highlight text %}
##   3   4   5 
## 245 123 335
{% endhighlight %}
