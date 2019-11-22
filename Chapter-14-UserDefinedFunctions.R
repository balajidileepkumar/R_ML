###
#User Defined Functions are custom functions which is used to perform or compute some logic
###

#function_name <- function(arg1, arg2,arg3,....)
#{
#  statement list
#  returnobject  
#}
farentheit_kelvin <- function(temp_farent) {
  temp_kelvin <- ((temp_farent-32)*(5/9))+273.15
  temp_kelvin
}
farentheit_kelvin(100)
###
kelvin_celsius <- function(temp_kelvin){
  temp_celcius <- (temp_kelvin -273.15)
  temp_celcius
}
kelvin_celsius(273.15)
###
farent_celsius = function(temp_farent){
  kelvin_celsius(farentheit_kelvin(temp_farent))
  }
farent_celsius(100)
#Default Parameters
#Keyword argument follows positional argument
input_1 =10
Increment_x<-function(input1, input2 =5){
  output <-input1 + input2
  output
}
Increment_x(input_1)
Increment_x()
### alternatively a return keyword can also be used for returning data in a function
Increment_x<-function(input1, input2 =5){
  output <-input1 + input2
  return(output)
}
Increment_x(input_1)


f<-function(x){return(x^2+3)}
f(3)
#####
#Anonymous functions
#####
#Anonymous Functions are functions which doesn't have a function name
a = c(1,2,3,4,5)
sapply(a,function(x){x+1})

bythree <- function(f){f(3)}
bythree(function(x){x*2})
### To Know the inputs of a function
args(Increment_x)