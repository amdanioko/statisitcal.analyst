install.packages("gapminder")
library(gapminder)
data("gapminder")

#Apply the function summary to the object gapminder
summary(gapminder)
x <- mean(gapminder$gdpPercap)
x

#attach function so that way we dont have to type the name of the dataframe everytime
attach(gapminder)
median(pop)
hist(lifeExp)
hist(log(pop))

## boxplot to look at the distribution of the dataset

boxplot(lifeExp ~ continent)
plot(lifeExp ~ log(gdpPercap))

### Data set maniplation dplyer packages

install.packages("dplyr")
library(dplyr)

gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "South Africa" |
          country == "Ireland") %>%
  group_by(country) %>%
  summarise(Average_life = mean(lifeExp))
  

##### T-test
df1 <- gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "South Africa" |
           country == "Ireland") 
t.test(data = df1, lifeExp ~ country)


#### ggplot

library(ggplot2)

gapminder %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap), y= lifeExp, col = year, size=pop)) +
  geom_point(alpha =0.3) +
  geom_smooth(method = lm) +
  facet_wrap(~continent)

summary(lm(lifeExp ~ gdpPercap+ pop))

######### Data Analysis in R #########
#Arithmetic and assisgnment
2+2
9/3
5%%2


var <- 10
acos(-1)  #arc cosine function
acos(cos(pi)) + 10


## Logicals and characters
foo <-TRUE
class(foo)
bar <- "hi!" # bar is of the character data type
class(bar)

foo && 1
foo && 2
foo && 0

lang.domain <- "statistics"
lang.domain <- toupper(lang.domain)
print(lang.domain)
## retrieves substring from first character to fourth character
substring(lang.domain, 1, 4)
gsub("I", "1", lang.domain)# substitues every "I" for "1"

#combines character strings
paste ("R does", lang.domain,"!!!")

### Flow of control 

if(2+2 == 4)
  print("very good")

if (2+2 == 5)
  print ("all hail to the theif")
### it is possible to execute more than one statement if an 
### if condition is triggered
if ((4/2==2) && (2+2== 4)){
  print("four divided by two is two...")
  print("and two times two is four")
}

## it is also possible to specify a block of code 
## that will get executed if the  condition is false.
closing.time <- TRUE
if(closing.time){
  print("you don't have to go home")
  print("but you can't stay here")
}else{
  print("you can stay here!")
}
if (closing.time){
  print("you don't have to go home")
  print("but you can't stay here")
}else{
  print("you can stay here!")
}

#### Vectors #####
our.vect <- c(8,6,7,5,3,0,9)
another.vect <- c("8",6,7,"-",3,"0",9)
another.vect

### Subsetting
our.vect[1] # to get the first value
length(our.vect)# the function length returns the length of a vector
our.vect[length(our.vect)] # get the last element of the vector
our.vect[c(1,3,5,7)]# extracting the 1st,3rd,5th and 7th element 

other.vector <- 1:10
another.vector <- seq(50, 30, by=-2)

our.vect[1:5]

## Vectorized functions 
mean(our.vect)
sd(our.vect)
min(our.vect)
max(our.vect)
sum(c(1,2,3))

messy.vector <-c(8,6,NA, 7,5,NA,3,0,9)
length(messy.vector)

mean(messy.vector)
mean(messy.vector, na.rm = TRUE)
sum(messy.vector,na.rm = FALSE)
sum(messy.vector, na.rm = TRUE)

log.vector <- c(TRUE, TRUE, FALSE)
sum(is.na(messy.vector))
our.vect >5

#Advanced subsetting
messy.vector[!is.na(messy.vector)]
our.vect[our.vect >5]

our.vect[1] <- 9
messy.vector[is.na(messy.vector)] <- 0

ifelse(is.na(messy.vector), 0, messy.vector)## function that take 3 arugments

our.vect + 3
our.vect + c(3, 3, 3, 3, 3, 3, 3)
our.vect[c(TRUE,FALSE)]
our.vect[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)]
our.vect + c(3,0)

## Functions ##
is.even <- function(a.number) {
  remainder <- a.number %% 2
  if(remainder==0)
    return(TRUE)
  return(FALSE)
}
is.even(10)## testing it
is.even(9)
### creating a function that determines whether the first 
### arugment is divisible by its second arugment

is.divisible.by <- function(large.number, smaller.number){
if(large.number %% smaller.number != 0)
  return(FALSE)
return(TRUE)
}
## testing it
is.divisible.by(9,3)
is.divisible.by(10,3)
is.divisible.by(10,2)

is.even <- function(num) {
  is.divisible.by(num,2)
}

sapply(our.vect, is.even)
sapply(our.vect, function(num){is.divisible.by(num,3)})

### Matrices ###
# R has the matrix, data frame, list and array data structures
a.matrix <- matrix (c(1,2,3,4,5,6))
a.matrix

a.matrix <- matrix(c(1,2,3,4,5,6), ncol = 2)
## binding two vectors by columns using the cbind function
a3.matrix <- cbind(c(1,2,3), c(4,5,6))
a3.matrix
### binding by row rbind funtion
a3.matrix <- rbind(c(1,2,3), c(4,5,6))
a3.matrix

a3.matrix
colSums(a3.matrix)
rowMeans(a3.matrix)
apply(a3.matrix,2,sum)

### Loading data in R
favs <- read.table(file.choose(), sep=",", header=TRUE) # Choose the path 
favs <- read.csv("favorites.csv")
head(favs)
class(favs)
class(favs$flavor)
class(favs$number)
favs <- read.csv("favorites.csv", stringsAsFactors=FALSE)
class(favs$flavor) # $the extract operator
favs$flavor
favs[["flavor"]]
favs[,1]

str(favs) # Polymorphism

## Working with packages
### CRAN is the primary repository for user-created packages
## ggplot2 is a plotting system for R
ggplot(favs, aes(x= flav, y=number)) +
  geom_bar(stat = "identity") +
  ggtitle("Soy ice cream flavor preferences")

### gdata and foreign allows you to 
## directly import excel spreadsheets and SPSS data files respectively into R these packages are required
library(gdata)
library(foreign)

