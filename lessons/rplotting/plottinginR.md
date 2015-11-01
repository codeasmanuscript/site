---
title: "Plotting in R"
author: "Sarah Meister"
date: 2015-10-15
fontsize: 12pt
geometry: margin=1in
papersize: letterpaper
layout: page
sidebar: false
output: slidy_presentation
---

# Base plotting systems #

The base plotting system in R is the `plot()` function. 


{% highlight r %}
library(datasets)
data(cars)
with(cars, plot(speed, dist))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/images/unnamed-chunk-1-1.png) 

# the Lattice system #

This is the second base plotting system in R. Plots are created with a single call function. Margins and spacing are set automatically because the entire plot is specified at once. It is good at putting many plots on a screen and thus you can see things like how y changes with x over z. 


{% highlight r %}
library (lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout = c(4,1))
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/images/unnamed-chunk-2-1.png) 

# ggplot2 #

The ggplot2 package is an R package that uses the "Grammar of Graphics" to put together different aspects of data visualization to build quality graphics. It is a very popular package. 

 
 {% highlight r %}
 install.packages("ggplot2")
 {% endhighlight %}
 
 
 
 {% highlight text %}
 ## Installing package into '/home/luke/R/x86_64-pc-linux-gnu-library/3.2'
 ## (as 'lib' is unspecified)
 {% endhighlight %}
 
 
 
 {% highlight text %}
 ## Error in contrib.url(repos, type): trying to use CRAN without setting a mirror
 {% endhighlight %}
 
 
 
 {% highlight r %}
 
 library(ggplot2)
 {% endhighlight %}
 
 
 
 {% highlight text %}
 ## Loading required package: methods
 {% endhighlight %}
 
 # the Basics #
 
 `qplot()` is the basic plotting function in `ggplot2` and plots are made up of aesthetics (size, shape, color, etc.) and geoms (points, lines, etc.). 
 
 `ggplot()` is the core function and can do things that `qplot` cannot. 
 

{% highlight r %}
str(mpg)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	234 obs. of  11 variables:
##  $ manufacturer: Factor w/ 15 levels "audi","chevrolet",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ model       : Factor w/ 38 levels "4runner 4wd",..: 2 2 2 2 2 2 2 3 3 3 ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
##  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
##  $ trans       : Factor w/ 10 levels "auto(av)","auto(l3)",..: 4 9 10 1 4 9 1 9 4 10 ...
##  $ drv         : Factor w/ 3 levels "4","f","r": 2 2 2 2 2 2 2 1 1 1 ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
##  $ fl          : Factor w/ 5 levels "c","d","e","p",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ class       : Factor w/ 7 levels "2seater","compact",..: 2 2 2 2 2 2 2 2 2 2 ...
{% endhighlight %}



{% highlight r %}

qplot(displ, hwy, data = mpg)
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-1.png) 

{% highlight r %}

qplot(displ, hwy, data = mpg, color=drv)
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-2.png) 

{% highlight r %}

qplot(displ, hwy, data = mpg, geom=c("point", "smooth"))
{% endhighlight %}



{% highlight text %}
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-3.png) 

{% highlight r %}

qplot(hwy, data=mpg, fill=drv)
{% endhighlight %}



{% highlight text %}
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-4.png) 

{% highlight r %}

qplot(displ, hwy, data=mpg, facets =.~drv)
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-5.png) 

{% highlight r %}

qplot(hwy, data=mpg, facet=drv~., binwidth=2)
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/images/unnamed-chunk-4-6.png) 
