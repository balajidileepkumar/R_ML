

#This version of R 3.6 is called as feather spray
#Variables in R
a = 3
typeof(a)
b <- 2.0 
typeof(b)
a + b -> c
20 + a -> c
90 -> d
e <- 1 + 2i
typeof(e)
#Type Casting Methods is and as
#is - used to check the type of the object
#as -  used to convert the object to different type.

c<-123.123
typeof(c)

d<- as.character(c)
typeof(d)

is.character(c)# [1] FALSE

is.numeric(c) # [1] TRUE

is.character(d)# [1] TRUE

#install any library
install.packages("nutshell")

typeof(c)
#10 k
#1:1 50 - 5000
#1:2 40 -8000
#1:3 30 -9000
#1:4&5 25 -10000, 12500
#1:6+:  20 - 12000

# create an integer using as 
a = 1
typeof(a)
b = as.integer(a)
typeof(b)

#################
##methods - ls() rm() class(x)
ls() # list out all the variables available for coding

#class(x) - lists out what's the class of the given type of data
typeof(b)
class(a)

typeof(d)
class(d)

#rm(x) used to remove the data from the memory

rm(d)
typeof(d)
class(d)

