#Operations in R
#Arithmetic Operations
#Relational Operations
#Logical Operations
#Assignment Operations
#Miscellaneous Operations
#-------------------------------------------------------------------#
##################
#- Arithmetic Operations
##################

x <- -2.456
y <- 3.4567
a_vector <- c(1,2,3,4,5)
b_vector <- c(4,5,6)
print(a_vector + b_vector)#Addition Operation
print(a_vector - b_vector)#Subtract Operation
print(a_vector * b_vector)#Multiply Operation
print(a_vector ^ b_vector)#Power of Second element
print(a_vector / b_vector)#Divide Operation
print(a_vector %% b_vector)#Gives Remainder Value
print(a_vector %/% b_vector)#Gives Quotient
#for instance
####
c_vector <- c(1,7,12)
d_vector <- c(4,2,5)
print(c_vector %% d_vector)#Gives Remainder Value
print(c_vector %/% d_vector)#Gives the Quotient
####
#for direct values also the same can be performed
a =12
b = 9

print(a+b)
print(a-b)
print(a*b)
print(a/b)

print(a%%b)

print(a + b)
print(abs(x))
print(abs(y))
print(x%%y)
print(x%/%y)
print(x*y)
print(x+y)
print(x-y)

##################
#-Logical Operations
##################

logical_a_vector <- c(1,2,TRUE, 1+2i)
logical_b_vector <- c(4,0,TRUE, 3+4i)
#logicaland
print(logical_a_vector&logical_b_vector)
print(logical_a_vector|logical_b_vector)
print(logical_a_vector&&logical_b_vector)
print(logical_a_vector||logical_b_vector)
print(!logical_a_vector)
print(!logical_b_vector)
print(logical_a_vector&logical_b_vector)
print(logical_a_vector&&logical_b_vector)
print(logical_a_vector|logical_b_vector)
print(logical_a_vector||logical_b_vector)

print(!logical_a_vector)
print(!logical_b_vector)
######################
#- Relational Operation
######################

relational_a_vector <- c(1,7,6,4,0)
relational_b_vector <- c(1,2,3,4,5)
print(relational_a_vector>relational_b_vector)
print(relational_a_vector<relational_b_vector)
print(relational_a_vector==relational_b_vector)
print(relational_a_vector>=relational_b_vector)
print(relational_a_vector<=relational_b_vector)
print(relational_a_vector!=relational_b_vector)
#try this
#relational_a_vector <- c(1,2,TRUE, 1+2i)
#relational_b_vector <- c(4,0,TRUE, 3+4i)

######################
#- Assignment Operators
######################
#Assignment Operators were used to create variables
assign_a = c(1,2,3)
assign_b <- c(1.1,2.2,3.3)
assign_a + assign_b -> assign_c
print(assign_a)
print(assign_b)
print(assign_c)
######################
#-Misc Operators
######################
#Sequence Operator
a <- 1:10
print(a)

a <- 0.3:7.0
print(a)
#special operator
# %any%
matrix_1 <- matrix(c(1,2,3,4,5,6),nrow = 2, ncol = 3, byrow = TRUE)

print(matrix_1)
print(t(matrix_1))
resultant_matrix = matrix_1%*%t(matrix_1)
print(resultant_matrix)
resultant_matrix = matrix_1%/%t(matrix_1)
print(resultant_matrix)

#pipeline operator
#used to pipeline output of one function or method to another pipeline.

"%>%" <- function(x,f) do.call(f,list(x))
pi %>% sin
sin(pi)
cos(sin(pi))
tan(cos(sin(pi)))
tan(1)

cos(sin(0))
tan(cos(sin(0)))

#0 %>% sin %>% cos %>% tan
#deg 0 30 45 60 90
#sin 0 1/2 1/root2 root3/2 1
#cos 1 root3/2 1/root2 1/2 0
#tan 0  1/root3 1 root3 infinte
#sec 1/cos
#cosec 1/sin
#cot 1/tan or cos/sin



library(magrittr)
names(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

iris %>%  subset(Petal.Length > 1) %>% aggregate(. ~ Species, ., mean)
mtcars
iris
iris %>%  subset(Petal.Length > 1)



####################
iris_1 <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)
iris_1
iris_1$V5
names(iris_1) <- c( "Petal.Length", "Petal.Width","Sepal.Length", "Sepal.Width", "Species")
iris_1
iris_1$Petal.Length

a = subset(Sepal.Length > 1)
subset(iris_1, Sepal.Length >1)
x = subset(iris_1, Petal.Length >6)
y= aggregate(. ~ Species, ., mean)
print(x)
iris_1 %>%  subset(Petal.Length >6)

aggregate(x,,x, mean)

iris_1 %>%  subset(Petal.Length > 6) %>% aggregate(. ~ Species, ., mean)

library(dplyr)
iris_1 %>%  subset(Petal.Length > 6) %>% subset(Sepal.Width < 1.5) %>% sum(select(filter(Petal.Width < 4),n))

iris_1 %>%  subset(Petal.Length > 6) %>% subset(Sepal.Width < 1.5) %>% aggregate(. ~ Species, ., mean)

print(iris_1$v1)
iris$Sepal.Length <- iris$Sepal.Length %>%  sqrt()

#####################################################
library(dplyr)
# Load the data
data(babynames)
# Count how many young boys with the name "Taylor" are born
sum(select(filter(babynames,sex=="M",name=="Taylor"),n))
# Do the same but now with `%>%`
babynames%>%filter(sex=="M",name=="Taylor")%>%
  select(n)%>% sum


# Perform the same computations on `x` as above
x %>% log() %>%
  diff() %>%
  exp() %>%
  round(1)

# Op Null Default -> represents the value of  y if x is null
library(tidyverse)
x %||% y
x = NULL
y<-5
a <-  NULL %||% y
b <-  x %||% y
x <-10
c <-  x %||% y
##################
#-Relational Operations
##################
