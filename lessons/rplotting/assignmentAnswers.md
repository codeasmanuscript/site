# Answers


```r
knitr::opts_chunk$set(eval = FALSE)
```


1. 

```r
library(ggplot2)
qplot(carat, price, data=diamonds)
```

2. 

```r
qplot(carat, price, data=diamonds, color=cut)
```

3. 

```r
qplot(carat, data=diamonds, fill=cut)
```

4. 

```r
qplot(carat, data=diamonds, fill=cut, binwidth = 1)
```

5. 

```r
b <- ggplot(diamonds, aes(color, depth))
```

6. 

```r
b + geom_boxplot()
```

7. 

```r
b + geom_boxplot() + labs(title="Depth and color of round cut diamonds", x= "Diamond color, from J(worst) to D(best)", y="Depth (mm)")
```

8. 

```r
b + geom_boxplot() + labs(title="Depth and color of round cut diamonds by clarity", x= "Diamond color, from J(worst) to D(best)", y="Depth (mm)") + facet_wrap(~clarity, ncol=4)
```

9.

```r
library(tidyr)
library(dplyr)

diamonds %>%
  selects (-cut, -color, -clarity) %>%
  cor() %>%
  round(2) %>%
  as.data.frame() %>%
  add_rownames() %>%
  gather(Var1, Corr, -rowname) %>%
  ggplot(aes(Var1, rowname, fill=Corr)) + 
  geom_tile()
```

10.


```r
library(ggplot2)
library(dplyr)
library(tidyr)

diamonds %>%
    select(carat, depth, table, price, x, y, z) %>% 
    gather(Variable, Value) %>% 
    group_by(Variable) %>% 
    summarize(mean = mean(Value)) %>% 
    ggplot(aes(mean, Variable)) +
    geom_point() +
    labs(x = 'Mean of the value for the variable',
         y = 'Variable from the diamonds dataset') +
    ggtitle('Means of the numerical variables from the diamonds dataset') +
    theme_bw()
```


11. 


```r
diamonds %>% 
    mutate(PriceGroup = as.factor(ifelse(price > 2000, 'Expensive', 'Inexpensive'))) %>% 
    select(PriceGroup, carat, depth, table, x, y, z) %>% 
    gather(Variable, Value, -PriceGroup) %>% 
    group_by(PriceGroup, Variable) %>% 
    summarize(mean = mean(Value)) %>% 
    ggplot(aes(mean, Variable, shape = PriceGroup)) +
    geom_point() +
    labs(x = 'Mean of the value for the variable',
         y = 'Variable from the diamonds dataset') +
    ggtitle('Means of the numerical variables from\nthe diamonds dataset by cost')
```


12. 


```r
diamonds %>%
    mutate(PriceGroup = as.factor(ifelse(price > 2000, 'Expensive', 'Inexpensive'))) %>% 
    select(PriceGroup, carat, depth, table, x, y, z) %>% 
    gather(Variable, Value, -PriceGroup) %>% 
    group_by(PriceGroup, Variable) %>% 
    summarize(mean = mean(Value),
              sd = sd(Value)) %>% 
    ggplot(aes(mean, Variable, shape = PriceGroup)) +
    geom_point() +
    geom_errorbarh(aes(xmin = mean - sd, xmax = mean + sd),
                   height = .25) +
    labs(x = 'Mean of the value for the variable',
         y = 'Variable from the diamonds dataset') +
    ggtitle('Means and SD of the numerical variables from\nthe diamonds dataset by cost') +
    theme_light()

```
