---
title       : 
subtitle    : 
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Developing Data Projects

2/21/2015

---

## Purpose

The purpose of this project is to create a random number generator and see how random numbers are distributed using a histogram and a scatter plot.

---

## Random Numbers

1. Demonstrate random numbers follows an even distribution.
2. The larger the number of random variables, the more even the distribuion will be.

--- .class #id 

## Histogram

A histogram is provides a nice graphical representation of the distribution of the data.


```r
   dist <- rnorm(input$obs)
```

```
## Error in rnorm(input$obs): object 'input' not found
```

```r
    par(mfrow=c(2,1))
    hist(dist)
```

```
## Error in hist.default(dist): 'x' must be numeric
```

```r
    plot(dist)
```

```
## Error in curve(expr = x, from = from, to = to, xlim = xlim, ylab = ylab, : 'expr' did not evaluate to an object of length 'n'
```

 
---

## Scatter Plot

We see that there is no grouping in any of the random variables and the dots are fairly well scattered.

---


