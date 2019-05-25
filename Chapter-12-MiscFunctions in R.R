###
#seq function # generates sequence
seq(c(1,2,3))
seq(2,10)
r = seq(from =20, to = 100, by =10)
print(r)
#rep function
repeatedvalues_times = rep(c(1,2,3),times = 5)
print(repeatedvalues_times)
repeatedvalues_each = rep(c(1,2,3),each = 5)
print(repeatedvalues_each)
repeatedvalues_nat_seq = rep(1:8,each = 2)
print(repeatedvalues_nat_seq)
repeatedvalues_fun_seq_each = rep(seq(5,15,by=3),each = 3)
print(repeatedvalues_fun_seq_each)
repeatedvalues_fun_seq_times = rep(seq(5,15,by=3),times = 3)
print(repeatedvalues_fun_seq_times)

x = c(1,1,1,3,4,5,5,6,2,2,2)
y_unique = unique(x)
print(y_unique)
y_duplicated = duplicated(x)
print(y_duplicated)
print(class(y_duplicated))
print(y_duplicated)
print(!y_duplicated)
unique_using_duplicated = x[!y_duplicated]
print(unique_using_duplicated)
#dplyr::distinct(x,TRUE)

x =20

"%>%" <- function(x,f) do.call(f,list(x))
pi %>% sin
sin(pi)
cos(sin(pi))
tan(cos(sin(pi)))
tan(1)

cos(sin(0))
tan(cos(sin(0)))
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


