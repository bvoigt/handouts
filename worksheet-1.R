## The Editor

vals <- seq(1, 100)

vals <- seq(from = 1,
            to = 50)

## Vectors
counts <- c(4, 3, 7, 5)

## Exercise 2

...

## Factors

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college"))

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college"),
                 ordered = TRUE)

## Data Frames

df <- data.frame(education, counts)

## Exercise 3
species <- c("alpaca", "hedgehog", "salmon")
abund <- c(9, 6, 13)
data <- data.frame(species, abund)

## Load data into R

plots <- read.csv('data/plots.csv')
animals <- read.csv('data/animals.csv')

## Exercise 4

animals <- read.csv('data/animals.csv', stringsAsFactors = FALSE)
## this is how I tried it first
## animals <- data.frame(animals$id, animals$month, animals$day, animals$year, animals$plot_id, animals$species_id, factor(animals$sex), animals$hindfoot_length, animals$weight)

## this is an easier way to do this
animals$sex <- factor(animals$sex)
## Names

names(df) <- c('ed', 'ct')

## Subsetting ranges

days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
weekdays <- days[2:6]

## Exercise 5

weekdays <- days[c(-1, -7)]
mwf <- days[seq(from = 2, to = 6, by = 2)]


## Exercise 6

## efficient solution
ex6 <- df[2:3, "ed"]

## alternate solution 1
ex6 <- df[c(2,1), "ed"]

## alternate solution 2
df$ed[2:3]

## Base plotting

plot(animals$hindfoot_length, animals$weight)

## Histograms

hist(animals$weight)
hist(animals$weight, xlab = "Animal Weight (kg)")

## Boxplots

boxplot(log(weight)~year, data=animals)

## Anatomy of a function

first <- function(dat) {
  result <- dat[1, ]
  return(result)
}

## this one works
first(df)

##this one does not work because "dat" is expecting an array, not a list
first(counts)

## Flow control

if (...) {
    ...
} else {
    ...
}

first <- function(dat) {
    if (is.vector(dat)) {
        result <- dat[1]
    } else {
        result <- dat[1,]
    }
  return(result)
}

first(df)
first(counts)

## Exercise 7

first <- function(dat) {
  if (is.vector(dat)) {
    result <- dat[1]
  } 
  else if (is.matrix(dat)){
    result <- dat[1,3]  
  }
  else {
    result <- dat[1,]
  }
  return(result)
}

## Distributions and statistics

samp <- ...


x <- rnorm(n = 100, mean = 25, sd = 7)
y <- rbinom(n = 100, size = 50, prob = 0.85)

t.test(x, y)

fit <- lm(y~x)
summary(fit)

## Exercise 8

## this is my first effort (worked)
aw <- lm(log(animals$hindfoot_length)~log(animals$weight))
summary(aw)

## alternatively
animals.linr <- lm(log(hindfoot_length)~log(weight), data = animals)
summary(animals.linr)

## Scripting Challenges
## 1
fib <- c(1, 1)
for (i in 2:11) {
  lessI = i - 1
  fib <- c(fib, sum(fib[lessI:i]))
  i = i + 1
}

fib

## 2
## original
plots[plots$id = 4, ]

## fixed
plots[plots$id[4], ]

## original
plots[-1:4, ]

## fixed
plots[-1, ]

## original
plots[plots$id <= 5]

## fixed
plots[plots$id <= 5, ]

## original
plots[plots$id == 4 | 6, ]

## fixed
plots[plots$id == 4 | plots$id == 6, ]

## 3
size <- seq(1:5)
year <- factor(c(2017, 2015, 2016, 2016, 2015))
prop <- rnorm(n = 5, mean = 25, sd = 7)

ex3df <- data.frame(size, year, prop)

lm.ex3df <- lm(prop ~ size + year)
summary(lm.ex3df)

## 4
sel.data <- animals[animals$year == 1980 | animals$year == 1990 | animals$year == 2000, ]
eval.data <- data.frame(factor(sel.data$year), sel.data$weight)
ex4fit = lm(sel.data$weight ~ sel.data$year)
anova(ex4fit)

## 5
## Try that Fibonnacci challenge again, but use an approach called "recursion". 
## That is, write a function that calls itself to calculate the nth Fibonacci number. 
## Just because this is an "advanced" approach doesn't mean it's a good one: don't 
## try it for any number over your age!
i <- 2
fib <- c(1, 1)
fib.func <- function(dat,counter) {
      if length(fib) <= 12 {
        lessI = i - 1
        fib <- c(fib, sum(fib[lessI:i]))
        i = i + 1
      }
      else {
        return(fib)
      }
}