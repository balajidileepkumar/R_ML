##Generic Functions and Methods in R

#Data Analysis

#Data Manipulation
#right_join, left_join,semi_join,anti_join,

#Data Cleansing
#Filter, Aggregate, Select, Group_by, Arrange, mutate,gather spread

#Data Visualization
#ggplot, geom_points, geom_line
library(dplyr)
df_primary <- tibble(ID=1:10,y=21:30)
df_secondary <- tibble(ID=1:10,y=2)

df_primary <- tribble(
  ~x, ~y,  ~z,
  "a1", 2,  3.6,
  "a2", 4,  NA,
  "a3", 2,  3.6,
  "a4", 1,  NA,
  "a5", 4,  NA,
  "a6", 1,  8.5
)
df_secondary <- tribble(
  ~x, ~y,  ~z,
  "b1", 3,  3.1,
  "b2", 2,  1.2,
  "b3", 1,  3.2,
  "b4", 3,  1.2,
  "b5", 2,  2.2,
  "b6", 1,  8.5
)

result <- left_join(df_secondary,df_primary)
df_primary
df_secondary

result = left_join(df_primary, df_secondary, by = c("y"="y"))

result = left_join(df_primary, df_secondary, by = c("y"="y"), suffix = c(" From Primary", " From Secondary"))

result = left_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c(" From Primary", " From Secondary"))

result = left_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c(" From Primary", " From Secondary"))

result_1 = left_join(result,df_secondary, by = c("y"="y"), suffix =c(" table1"," table2"), keep = TRUE)

result_1 = right_join(result,df_secondary, by = c("y"="y"), suffix =c(" table1"," table2"), keep = TRUE)

right_join(result,df_secondary, by = c("y"="y"), suffix =c(" table1"," table2"), keep = TRUE)

right_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c(" From Primary", " From Secondary"), keep= TRUE)

result_inner = inner_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c(" From Primary", " From Secondary"), keep= TRUE)

result_full = full_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c("From Primary", "From Secondary"), keep= TRUE)

#Gives Columns for First table
#return all rows from x  where there are matching values in y, keeping just columns from x.
result_semi = semi_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c("From Primary", "From Secondary"), keep= TRUE)
#return all rows from x where there are not matching values in y, keeping just columns from x
result_antijoin = anti_join(df_secondary, df_primary, by = c("y"="y"), copy= TRUE, suffix = c("From Primary", "From Secondary"), keep= TRUE)

result_nestjoin = nest_join(df_primary, df_secondary, by = c("y"="y"), copy= TRUE, suffix = c("From Primary", "From Secondary"), keep= TRUE)
###############################################################################
#Data Cleansing

iris
tail(iris,5)


#Filter, Aggregate, Select, Group_by, Arrange, mutate

add <- function(x) Reduce("-", x)#Reduce a list to a single value by iteratively applying a binary function
add <- function(x) Reduce("-", x)#Reduce a list to a single value by iteratively applying a binary function
add(list(1, 2, 3))
#########################################

iris
dimnames(iris)
#library(dplyr) 
#PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/travel_times.csv"
#df <- read.csv(PATH)
#glimpse(df)
#FILTER
result_data = filter(iris,Species == "setosa")

result_data = filter(iris, Petal.Length >= 2.0)

result_data = filter(iris, Sepal.Length >= 5, Petal.Length >= 5)

filter(iris, Sepal.Length >= 5, Petal.Length >= 4) %>% select(Sepal.Length, Sepal.Width) 
select_result = select(filter(iris, Sepal.Length >= 5, Petal.Length >= 4))

#pipe line
library("tidyverse")
library("magrittr")
library("dplyr")
x<-5

#SELECT
#SELCECT
#"%>%" <- function(x,f) do.call(f,list(x))

result  = iris %>%  select(Petal.Length)

#result = "Hello World" %>% substring(7, 11) %>% grepl(pattern = "Wo")

result = filter(iris, Sepal.Length >= 2, Petal.Length >= 6) %>% select(Sepal.Length,Species)

result = filter(iris, Sepal.Length >= 2, Petal.Length >= 6) %>% select(Sepal.Length,Species)

result_data = filter(iris, Sepal.Length >= 2, Petal.Length >= 6) %>% select(Species)


select(iris,Petal.Length,Species)

#Group_BY
mtcars
length(mtcars)
typeof(mtcars)
nrow(mtcars)
ncol(mtcars)

result <- group_by(mtcars, cyl)

result <- group_by(mtcars, gear)
nrow(result)

bySpecs <- group_by(mtcars, gear, drat, hp)
nrow(bySpecs)

Flower <- group_by(iris, Petal.Length, Sepal.Length,Petal.Width)

Flower <- summarise(iris, result = mean(Petal.Length))

#applies the function to each individual group
Flower <- group_by(iris,Species) %>% summarise(result = mean(Petal.Length))
Flower <- group_by(iris,Species) %>% summarise(result = sum(Petal.Length))

Flower <- group_by(iris,Species) %>% ungroup() %>% summarise(result = mean(Petal.Length))

#arrange
result <- group_by(iris, Sepal.Length) %>% arrange(.,Sepal.Length)


#arrange order by column asc
select(iris,Petal.Length,Species) %>% arrange(.,Petal.Length)
select(iris,Petal.Length,Species) %>% arrange(Petal.Length)
select(iris,Petal.Length,Species) %>% arrange(Species)
#arrange order by column desc
select(iris,Petal.Length,Species) %>% arrange(.,desc(Petal.Length))
result =  select(iris,Petal.Length,Species) %>% arrange(desc(Petal.Length))

##Mutate
# adds new column based on any calculation
New_Iris = mutate(iris,
       length_difference = Petal.Length - Sepal.Length,
       width_difference = Petal.Width - Sepal.Width,
)

#library(tidyverse)
#library(dplyr)
#create a resultant variable based on all the values of a column in a table
result = summarise(mtcars, result_value = mean(wt, na.rm = TRUE))

summarise(mtcars, result_value = mean(wt, na.rm = TRUE))

PetalLengthMedian_value <- summarise(iris, median(Petal.Length))

summarise(mtcars, mean(mpg, na.rm = TRUE))

#aggregate
#Splits the data into subsets, computes summary statistics for each, 
#and returns the result in a convenient form.
aggregate(iris, Sepal.Length)

aggregate(iris, by = list(iris$Sepal.Length), FUN = mean)

iris %>% aggregate(list(Sepal.Length), FUN = sum)

aggregate(mtcars, list(mtcars$cyl), median)

aggregate(iris, list(iris$Petal.Length), mean)

aggregate(iris, list(iris$Petal.Length), mean)



mtcars$cyl

#subset
subset(iris, Petal.Length >5)


