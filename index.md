---
title       :  Predict wine prices
subtitle    :  replace expert with statistics 
author      :  Eason
job         :  Analyst on keyboard
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read data from wine.csv

```r
wine = read.csv("wine.csv")
```

Take a look at the data

```r
summary(wine)
```

```
##       Year          Price        WinterRain       AGST       HarvestRain 
##  Min.   :1952   Min.   :6.21   Min.   :376   Min.   :15.0   Min.   : 38  
##  1st Qu.:1960   1st Qu.:6.52   1st Qu.:536   1st Qu.:16.2   1st Qu.: 89  
##  Median :1966   Median :7.12   Median :600   Median :16.5   Median :130  
##  Mean   :1966   Mean   :7.07   Mean   :605   Mean   :16.5   Mean   :149  
##  3rd Qu.:1972   3rd Qu.:7.50   3rd Qu.:697   3rd Qu.:17.1   3rd Qu.:187  
##  Max.   :1978   Max.   :8.49   Max.   :830   Max.   :17.6   Max.   :292  
##       Age         FrancePop    
##  Min.   : 5.0   Min.   :43184  
##  1st Qu.:11.0   1st Qu.:46584  
##  Median :17.0   Median :50255  
##  Mean   :17.2   Mean   :49694  
##  3rd Qu.:23.0   3rd Qu.:52894  
##  Max.   :31.0   Max.   :54602
```


--- .class #id 

## Fit multivariate regression model on wine price

```r
model = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data = wine)
summary(model)[4]
```

```
## $coefficients
##              Estimate Std. Error t value  Pr(>|t|)
## (Intercept) -3.429980  1.7658975  -1.942 6.631e-02
## AGST         0.607209  0.0987022   6.152 5.197e-06
## HarvestRain -0.003972  0.0008538  -4.652 1.538e-04
## WinterRain   0.001076  0.0005073   2.120 4.669e-02
## Age          0.023931  0.0080969   2.956 7.819e-03
```

Here you can see the most important factor amongst all is AGST, of which coefficienct is 0.607. Age, to our surprise, does not affect as much as AGST does.



--- .class #id 

## Test our regression model

```r
wineTest = read.csv("wine_test.csv")
predictTest = predict(model, newdata = wineTest)
```

Take a look at out-of-sample error

```r
sum((wineTest$Price - predictTest)^2)
```

```
## [1] 0.06926
```


Compare it with in-sample error

```r
sum(model$residuals^2)
```

```
## [1] 1.74
```



--- .class #id 

## Conclusion
As you can see, the prediction is pretty impressive.
You want to buy great wine but being afraid of getting ripped off?




# Predict it!

--- .class #id 
