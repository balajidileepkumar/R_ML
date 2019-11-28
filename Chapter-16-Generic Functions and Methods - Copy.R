##Generic Functions and Methods in R

#Generic functions and methods
#Generic functions and methods work similarly to S3, but dispatch 
#is based on the class of all arguments, and there is a special syntax 
#for creating both generic functions and new methods.

#The setGeneric function provides two main ways to create a new generic. 
#You can either convert an existing function to a generic function, 
#or you can create a new one from scratch.

sides <- function(object){
  if(object > 0){
    return(TRUE)
  }else {
    return(FALSE)
  }
}
 

typeof(sides())
sides(-1)

setGeneric("sides")
#If you create your own, the second argument to setGeneric should be a function that 
#defines all the arguments that you want to dispatch on and contains a call to 
#standardGeneric:
  
setGeneric("sides", function(object) {
    standardGeneric("sides")
  })

#The following example sets up a simple hierarchy of shapes to use 
#with the sides function.

setClass("Shape")
setClass("Polygon", representation(sides = "integer"), contains = "Shape")
setClass("Triangle", contains = "Polygon")
setClass("Square", contains = "Polygon")
setClass("Circle", contains = "Shape")
#Defining a method for polygons is straightforward: we just use the sides slot. 
#The setMethod function takes three arguments: the name of the generic function,
#the signature to match for this method and a function to compute the result.
#Unfortunately R doesn't offer any syntactic sugar for this task so the code is a little verbose and repetitive.

setMethod("sides", signature(object = "Polygon"), function(object) {
  object@sides
})
#For the others we supply exact values. Note that that for generics with few 
#arguments you can simplify the signature without giving the argument names. 
#This saves spaces at the expense of having to remember which position corresponds to 
#which argument - not a problem if there's only one argument.

setMethod("sides", signature("Triangle"), function(object) 3)
setMethod("sides", signature("Square"),   function(object) 4)
setMethod("sides", signature("Circle"),   function(object) 0)
#You can optionally also specify valueClass to define the expected output of the generic. 
#This will raise a run-time error if a method returns output of the wrong class.

setGeneric("sides", valueClass = "numeric", function(object) {
  standardGeneric("sides")
})

setMethod("sides", signature("Triangle"), function(object) 3)
setMethod("sides", signature("Square"), function(object) 4)
#setMethod("area", signature("Square"), function(object) object$side*object$side)

a<- new("Triangle")
b<-new("Square")
sides(new("Triangle"))
sides(a)
sides(b)
# invalid value from generic function "sides", class "character", expected
# "numeric"
#Note that arguments that the generic dispatches on can't be lazily evaluated - otherwise how would R know which class the object was? This also means that you can't use substitute to access the unevaluated expression.

#To find what methods are already defined for a generic function, use showMethods:
  
showMethods("sides")
# Function: sides (package .GlobalEnv)
# object="Circle"
# object="Polygon"
# object="Square"
# object="Triangle"

showMethods(class = "Square")
# Function: initialize (package methods)
# .Object="Polygon"
#    (inherited from: .Object="ANY")
# 
# Function: sides (package .GlobalEnv)
# object="Polygon"