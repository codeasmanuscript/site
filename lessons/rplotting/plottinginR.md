---
title: "Plotting in R"
published: true
author: "Sarah Meister"
date: 2015-10-15
layout: page
sidebar: false
output: slidy_presentation
---




# ggplot2 #

The ggplot2 package is an R package that uses the "Grammar of Graphics" to put together different aspects of data visualization to build quality graphics. It is a very popular package. 


```r
install.packages("ggplot2")

library(plyr)
library(dplyr)
library(tidyr)
 
library(ggplot2)
```
 
# the Basics #
 
 `qplot()` is the basic plotting function in `ggplot2` and plots are made up of aesthetics (size, shape, color, etc.) and geoms (points, lines, etc.). 
 
However `qplot` is harder to modify. `ggplot()` is the core function and can do things that `qplot` cannot. 
 

```r
str(mpg) #this dataset come with the ggplot2 package.

qplot(displ, hwy, data = mpg) #x corordinate first, then y coordinates, then the dataframe these columns are from

qplot(displ, hwy, data = mpg, color=drv) #here we are colouring by the drv variable. (colors have not been specified)

qplot(displ, hwy, data = mpg, geom=c("point", "smooth")) #here we are adding a smooth geom with 95% CI intervals in the grey zone. This is in addition to the points geom. 

qplot(hwy, data=mpg, fill=drv) # here we are making a histogram of the hwy variable, colouring by the drv variable. 

qplot(displ, hwy, data=mpg, facets =.~drv) # another option is to separate the data into different plots (facets). 

# the facets variable takes two arguments: one on the left and one on the right, and they are separated by a tilde. The one on the right determines the columns of the facets and the one on the right determines the rows. 

qplot(hwy, data=mpg, facet=drv~., binwidth=2) #here we have 3 rows with each plot. 

```

Density PLots with `qplot`


```r
qplot(log(displ), data= mpg, geom="density")

qplot(log(displ), data= mpg, geom="density", color= drv)

```


Scatterplots PLots with `qplot`


```r
qplot(log(displ), log(hwy), data=mpg)

qplot(log(displ), log(hwy), data=mpg, shape = drv)

qplot(log(displ), log(hwy), data=mpg, color = drv)

qplot(log(displ), log(hwy), data=mpg, color = drv, geom=c("point", "smooth"), method="lm") #method is a standard linear regression model. 

qplot(log(displ), log(hwy), data=mpg, geom=c("point", "smooth"), method="lm", facets=.~drv)

```

# Basic components of a ggplot2 plot #
* A dataframe
* aesthetic mappings: how data are mapped to color, size
* geoms: geometric objects like points, lines, shapes 
* facets: for conditional plots
* stats: statistical transformations like binning, quantiles, smoothing
* scales: what scale an asthetic map uses (e.g. male= blue, female = red)
* coordinate system

The `ggplot()` function

Plots are built in layers. 


```r
g <- ggplot(mpg, aes(displ, hwy))

summary(g) ## no plot yet! It doesn't know how to draw the data yet

p <- g + geom_point() # use the + operator to add onto the ggplot function
print(p)

ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method="lm") 


ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method="lm") + facet_grid(.~drv) # order is not important after the ggplot() function!

```

# Added annotations #
* labels: `xlab()`, `ylab()`, `labs()`, `ggtitle()`
* each geom function is modifiable
* use the `theme()` function for thing that are global to the plot (e.g. `theme(legend.position="none")`)
* the standard themes are `theme_gray()` and `theme_bw()`


```r
g + geom_point(color= "steelblue", size=4, alpha = 1/2) + geom_smooth(method="lm") + facet_grid(.~drv) # the alpha value is the transparency of the points. 

g + geom_point(aes(color= drv), size=4, alpha = 1/2) + geom_smooth(method="lm") # here we need color to be the value of a variable, so we need to put it within aes(), as color is no longer a constant. 

g + geom_point(aes(color= drv), size=4, alpha = 1/2) + labs(title= "Fuel economy of 38 popular car models", x = "Engine displacement (L)", y = "Highway miles per gallon" ) + geom_smooth(size = 2, linetype = 2, method="lm", se = FALSE) # se = FALSE turns off the confidence intervals

g + geom_point(aes(color= drv), size=4, alpha = 1/2) + labs(title= "Fuel economy of 38 popular car models", x = "Engine displacement (L)", y = "Highway miles per gallon" ) + geom_smooth(size = 2, linetype = 2, method="lm", se = FALSE) + theme_bw(base_family = "Times")
```


# Note about ggplot() and axis limits #


```r

testdat <- data.frame(x=1:100, y = rnorm(100))
  
testdat[50,2] <- 100 ## make an outlier

ggplot(testdat, aes(x=x, y=y)) + geom_line()

ggplot(testdat, aes(x=x, y=y)) + geom_line() + ylim(-3, 3) ### this removes our outlier!!! ggplot2 subsets the data by the ylim. 

ggplot(testdat, aes(x=x, y=y)) + geom_line() + coord_cartesian(ylim=c(-3, 3))
```

# what if we want to show relationships with continuous data #


```r
# split into tertiles. the length is 4 as 0 is included. 
cutpoints <- quantile(mpg$cty, prob = seq(0,1,length = 4), na.rm=TRUE)
mpg$citycut <- cut(mpg$cty, cutpoints)
levels(mpg$citycut)
```


#Final plot #


```r
ggplot(mpg, aes(displ, hwy)) + geom_point(alpha = 1/3) + labs(title= "Fuel economy of 38 popular car models", x = "Engine displacement (L)", y = "Highway miles per gallon" ) + geom_smooth(method="lm", se = FALSE, col= "steelblue") + theme_bw(base_family = "Times", base_size=20) + facet_wrap(citycut ~ drv)

ggplot(mpg, aes(displ, hwy)) + geom_boxplot() + labs(title= "Fuel economy of 38 popular car models", x = "Engine displacement (L)", y = "Highway miles per gallon" ) + theme_bw(base_family = "Times", base_size=20) + facet_grid(.~drv)

ggplot(mpg, aes(displ)) + geom_histogram(breaks=c(1.5, 3, 4.5, 6, 7.5)) + labs(title= "Fuel economy of 38 popular car models", x = "Engine displacement (L)")+ theme_bw(base_family = "Times", base_size=20) 
```

# Scatterplot with error bars #


```r
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE, conf.interval=.95, .drop=TRUE) {
  
    # New version of length which can handle NA's: if na.rm==T, don't count them
    length2 <- function (x, na.rm=FALSE) {
        if (na.rm) sum(!is.na(x))
        else length(x)
    }

    # This does the summary. For each group's data frame, return a vector with
    # N, mean, and sd
    datac <- plyr::ddply(data, groupvars, .drop=.drop, .fun = function(xx, col) {
        c(N = length2(xx[[col]], na.rm=na.rm), mean = mean   (xx[[col]], na.rm=na.rm), sd = sd (xx[[col]], na.rm=na.rm))}
        ,measurevar)

    # Rename the "mean" column    
    datac <- rename(datac, c("mean" = measurevar))

    datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean

    # Confidence interval multiplier for standard error
    # Calculate t-statistic for confidence interval: 
    # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
    ciMult <- qt(conf.interval/2 + .5, datac$N-1)
    datac$ci <- datac$se * ciMult

    return(datac)
}


mpgsum2 <- summarySE(mpg, measurevar="displ", groupvars=c("class", "drv"))
mpgsum2

ggplot(mpgsum2, aes(x=drv, y=displ, color=class)) + 
    geom_errorbar(aes(ymin=displ-se, ymax=displ+se), width=.1) +
    geom_point()

```

Heat map


```r
library(reshape2)

cars <- mtcars[, c(1,3,4,5,6,7)]
head(cars)

carsCor <- round(cor(cars),2)
head(carsCor)

carsCor2 <- melt(carsCor)
head(carsCor2 )

ggplot(data = carsCor2, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()

```

