##############Apply Functions################################
#Apply
#lapply
#SApply
#mapply
#rapply
#tapply
#vapply


#Apply
#Applies a Function to a Matrix
data <- matrix(c(1:10,21:30), nrow = 5, ncol = 4,byrow = FALSE)
print(data)
#apply(x,Margin(dimension, function))
result = apply(data,1,mean)
print(result)
result_all = apply(data,2,mean)
print(result_all)
result_all = apply(data,c(1,2),mean)
print(result_all)
###############################################
#lapply
#takes a list as an input and performs the calculation
data <-list(x=1:15, y= 6:20, z =20:35)
print(data)
data$x

data$y

data$z

median_list = lapply(data, median)

#result_mean_list = mean_list =lapply(data, FUN=mean, simplify = TRUE)
#typeof(result_mean_list)

#mean_list =lapply(data, FUN=mean)

data_a <- matrix(c(1:10), nrow = 3, ncol = 3,byrow = FALSE)
data_b <- matrix(c(11:20), nrow = 3, ncol = 3,byrow = FALSE)
data_c <- matrix(c(21:30), nrow = 3, ncol = 3,byrow = FALSE)

mylist <- list(data_a,data_b,data_c)
#lapply(data,function,itemno)#select the particular item
#lapply(data,function,c(itemno1,itemno2.....) #select the value at given row and column
#lapply(data,function,rowno,)#select the particular row
#lapply(data,function,rowno,columnno) #select the value at given row and column
#lapply(data,function,c(rownos),columnno) #all the valeus at given rows in rowvector and the given column
#lapply(data,function,c(rownos),c(columnnos) #all the valeus at given rows in rowvector and the given column


a= lapply(mylist,"[",c(4,3))
b= lapply(mylist,"[",2)
c =lapply(mylist,"[",1,2)
d =lapply(mylist,"[",4)
e = lapply(mylist,"[",3,)
f = lapply(mylist,"[",,2)
g = lapply(mylist,"[",,c(2,1))
h = lapply(mylist,"[",1:2,2:3)
mylist
typeof(a)
typeof(b)
typeof(c)
typeof(d)
typeof(e)
typeof(f)
################################################
#sapply 
#returns vector instead of a list

mean_vect = sapply(data,mean)
typeof(mean_vect)

mean_list = lapply(data, mean)
typeof(mean_list)

median_vect = sapply(data,FUN= median)
typeof(median_vect)
print(class(median_vect))

mylist <- list(data_a,data_b,data_c)
a = sapply(mylist,"[",4)
typeof(a)
b = sapply(mylist,"[",2)
c = sapply(mylist,"[",1,2)
typeof(c)
d = sapply(mylist,"[",3,)
typeof(d)
################################################
#mapply
#mulitvariate apply -  applies  elementwise operation in differents sets of elements
#vectorize arguments to functions that donot accept vectors as arguments
x <-11:15
y <-6:10
result = mapply(sum,x,y)
result_matrix = mapply(sum,data_a,data_b)
res = mapply(sum,1:4,1:4,1:4)
typeof(1:4)
res = mapply(sum,1:4,11:14,21:24)
res = mapply(rep,1,1:4)
res = mapply(rep,1:4,2)
res = mapply(rep,1:4,1:2)


#tapply
#Applies a function to a group of data
#Applies a function or an operation on a vector subset
library(datasets)
mtcars

no_of_rows =nrow(mtcars)
no_of_col =ncol(mtcars)
library("magrittr")
library("dplyr")

result_total = subset(mtcars, mtcars$cyl == 6) %>% select(wt) %>% sum()
total_selected_rows = nrow(subset(mtcars, mtcars$cyl == 6))
result_total/total_selected_rows

result = tapply(mtcars$wt,mtcars$cyl,mean)

result = tapply(mtcars$cyl,mtcars$wt,mean)

result = subset(mtcars, mtcars$cyl == 8) %>% select(wt) %>% nrow()

result = subset(mtcars, mtcars$cyl == 6) %>% select(wt) %>% nrow()

result = subset(mtcars, mtcars$cyl == 4) %>% select(wt) %>% nrow()

result
res = mapply(rep,1,1:4)

#R apply 
# Recursive apply
x = list(1,2,3,4)
rapply_result = rapply(x,function(x){x+2})
lapply(x,function(x){x+2})

rapply_result = rapply(x,function(x){x+2},class=c("numeric"))

x = list(3,list(4,5),6,list(7,list(8,9)))

x_1 = list(3,list(4,5))

square.function =  function(x){  
  x**2
  }
square.function(10)
rapply_result = rapply(x,square.function)
lapply_result = lapply(x, square.function)
rapply_result = rapply(x_1,square.function)
rapply_result = rapply(x,mean)

#Vapply#
#checks for the Specified Return Types
vapply_result = vapply(1:5,sqrt,1.0)
typeof(vapply_result)
vapply_result = vapply(1:5,sqrt,TRUE)
vapply_result


