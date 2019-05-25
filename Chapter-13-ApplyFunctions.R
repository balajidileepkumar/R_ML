##############Apply FUnctions################################
#Apply
#lapply
#SApply
#mapply
#rapply
#tapply
#vapply


#Apply
#Applies a Function to a Matrix
data <- matrix(c(1:10,1:30), nrow = 5, ncol = 4,byrow = FALSE)
print(data)
result = apply(data,1,mean)
print(result)
result_all = apply(data,c(2),mean)
print(result_all)

#lapply
#takes a list as an input and performs the calculation
data <-list(x=1:15, y= 6:20, z =20:35)
median_list = lapply(data, median)
mean_list =lapply(data, FUN=mean)

data_a <- matrix(c(1:10), nrow = 3, ncol = 3,byrow = FALSE)
data_b <- matrix(c(11:20), nrow = 3, ncol = 3,byrow = FALSE)
data_c <- matrix(c(21:30), nrow = 3, ncol = 3,byrow = FALSE)

mylist <- list(data_a,data_b,data_c)
lapply(mylist,"[",4)
lapply(mylist,"[",2)
lapply(mylist,"[",1,2)
lapply(mylist,"[",3,)


#sapply 
#returns vector instead of a list
mean_vect = sapply(data,FUN= mean)
median_vect = sapply(data,FUN= median)
print(class(median_vect))
mylist <- list(data_a,data_b,data_c)
sapply(mylist,"[",4)
sapply(mylist,"[",2)
sapply(mylist,"[",1,2)
sapply(mylist,"[",3,)

#mapply
#mulitvariate apply -  applies  elementwise operation in differents sets of elements
#vectorize arguments to functions that donot accept vectors as arguments
x <-11:15
y <-6:10
result = mapply(sum,x,y)
result_matrix = mapply(sum,data_a,data_b)
res = mapply(sum,1:4,1:4,1:4)
res = mapply(sum,1:4,11:14,21:24)
res = mapply(rep,1:4,1)
res = mapply(rep,1:4,1:2)


#tapply
#Applies a function to a group of data
#Applies a function or an operation on a vector subset
library(datasets)
mtcars
result = tapply(mtcars$wt,mtcars$cyl,mean)
result = tapply(mtcars$cyl,mtcars$wt,mean)
result

#R apply 
# Recursive apply
x = list(1,2,3,4)
rapply_result = rapply(x,function(x){x+2})
rapply_result = rapply(x,function(x){x+2},class=c("numeric"))
x = list(3,list(4,5),6,list(7,list(8,9)))
x_1 = list(3,list(4,5))
rapply_result = rapply(x,square.function)
rapply_result = rapply(x_1,square.function)
rapply_result = rapply(x,mean)

#Vapply#
#checks for the Specified Return Types
vapply_result = vapply(1:5,sqrt,1.0)
vapply_result = vapply(1:5,sqrt,TRUE)
vapply_result

#Data Analysis

#Data Manipulation
#right_join, left_join,semi_join,anti_join,

#Data Cleansing
#Filter, Aggregate, Select, Group_by, Arrange, mutate

#Dat Visualization
#ggplot, geom_points, geom_line

df_primary <- tibble(ID=1:10,~y,)