
#From 
a_seq = seq(10)
#From, To
b_seq = seq(2,10)
#By -  Step 
b_seq = seq(2,10,3)
b_seq = seq(2,10,7)
seq_jump = seq(from =20, to = 100, by =10)
#Length.Out - No of Values Required
b_seq = seq(2,10,length.out = 25)
seq_jump = seq(from =20, to = 100, length.out = 10)
print(seq_jump)
#along.with
a_seq_1 =  seq(along.with = 20)
a_seq_1
a_seq_2 =  seq(along.with = list(1,2,3+4i,TRUE, "Hello World"))
a_seq_2
a_seq_3 = seq(c(1,2,1))
a_seq_3
a_seq_4 = seq(c(1,2,1))
a_seq_4
a_seq_5 = seq(c(10001,2,5,20))
###
#length.out
a_seq = seq(length.out = 20)

#rep function
repeatedvalues_times = rep(c(1,2,3),times = 5)
print(repeatedvalues_times)
repeatedvalues_each = rep(c(1,2,3),each = 5)
print(repeatedvalues_each)
repeatedvalues_nat_seq = rep(1:8,each = 2)
print(repeatedvalues_nat_seq)
repeatedvalues_nat_seq = rep(1:8,times = 2)
print(repeatedvalues_nat_seq)
repeatedvalues_fun_seq_each = rep(seq(5,15,by=3),each = 3)
print(repeatedvalues_fun_seq_each)
repeatedvalues_fun_seq_times = rep(seq(5,15,by=3),times = 3)
print(repeatedvalues_fun_seq_times)

x = c(1,1,1,3,4,5,5,6,2,2,2)
#unique
y_unique = unique(x)
print(y_unique)
#duplicated
y_duplicated = duplicated(x)
print(y_duplicated)
x[y_duplicated]
print(class(y_duplicated))
print(y_duplicated)
#x[!y_duplicated]
print(!y_duplicated)
unique_using_duplicated = x[!y_duplicated]
print(unique_using_duplicated)
#dplyr distinct
#dplyr::distinct_(x,TRUE)

#sort[x]
sort(x,decreasing = FALSE)#decreasing -> descending order
sort(x)

sort(x, TRUE)

#ORDER 
x <- c(2,4,6,1,2,3)
order(x)


x <- c(2,4,6,1,2,3)
order(x, decreasing = TRUE)
order(-x)



x =20

"%>%" <- function(x,f) do.call(f,list(x))

# Perform the same computations on `x` as above
x %>% log() %>%
  diff() %>%
  exp() %>%
  round(1)

#Op Null Default -> represents the value of  y if x is null
library(tidyverse)
x %||% y
x = NULL
y<-5
a <-  NULL %||% y
x =1
b <-  x %||% y
x <-10
c <-  x %||% y


