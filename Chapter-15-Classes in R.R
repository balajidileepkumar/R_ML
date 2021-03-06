##OOPS - Classes in R 
## R follows S3,S4 and R5 class structures
## Each having it's own way of implementation.

#S3 CLASS
#S3 class type is an simplified class creation type.
#method 1
var1<-list(name="hari",age=40,Dept="HR")
var2<-list(name="Vignesh",age=20,Dept="SALES")

class(var1) <- "Employee"
class(var2) <- "Employee"
#method2
ceo <-list(name="Rajesh",age=25,Dept="CEO")
attr(ceo, "class") <- "CEO"
class(ceo)
#method3
x<-structure(list(name="Rajesh",age=25,Dept="Production"),class="Employee")
class(x)

##We have created the Employee objects in different ways

print(var1)
print("#############")
print(var2)
print("#############")
print(x)
print("#############")
#Now we can access the properties of each object independently
print(paste(var1$name,var2$name,x$name,2:3, sep ="-"))


###
#Instead of creating multiple objects by defining the class 
#we can also create a constructor for a S3 class and create multiple objects for it.
#lets create a class constructor for students
student <- function(stname,stage,stgrade){
  if(stgrade>6||stgrade<0){
    stop("grade must be between 0 and 6")
  }
  value <-list(name=stname,age=stage,GPA=stgrade)
  attr(value,"class")<-"student"
  return(value)
}

student_1 = student("Patrick",30,4)
student_2 = student("Vinay",33,6)
student_3 = student("Priya",20,5)
##################################################
teacher <- function(stname,stage,st_subj){
  if(stage<20||stage>60){
    stop("grade must be between 20 and 60")
  }
  value <-list(name=stname,age=stage,sub= st_subj)
  attr(value,"class")<-"teacher"
  return(value)
}

teacher_1 = teacher("Patrick",30,"Maths")
teacher_2 = teacher("Vinay",33,"6","Physics")
teacher_3 = teacher("Priya",20,"Chemistry")

###############

print.student <- function(x) paste(x$name," is a ", "student")
print.teacher <- function(x) paste(x$name," is a ", "teacher and his age is ", x$age) 
print.default <- function(x) "All others"

print(student_2)
print(student_3)
print(student_1)
print(teacher_2)
print(teacher_1)
print(teacher_3)
print(ceo)

#Adding a Method to Student Class
student.print<- function(obj){
  cat("Name : ", obj$name,"\n") 
  cat("Age : ", obj$age,"\n") 
  cat("Grade : ", obj$GPA,"\n")
}
student.print(student_1)

student.print(Employee_1)
###########################################################################################
##Employee Class
#using structure keyword in constructor 
Employee <- function(Em_name,Em_Age,Em_Dept){
  if (!(Em_Age>21 && Em_Age<60)){
    stop("Age must be between 21 and 60")
  }
  x<-structure(list(name=Em_name, age=Em_Age,Dept=Em_Dept),class="Employee")
  return(x)
}

Employee_1 = Employee("Rajsree",35,"dancer")
Employee_2 = Employee("Balaji",59,"Ds")
Employee_3 = Employee("Priya",20,5)
#######################################################
print(Employee_1)
print(Employee_2)
print(Employee_3)

## the above statement prints the student_1 information by listing up all properties. 
#we can provide a different implementation according to the needs


############
#S4 Classes
#setClass((classname,attributes/components),prototype(name=attributes/components default))


setClass("Person", slots = list(name = "character", age = "numeric"))
Person <- function(P_name,P_age){
  value <-list(name=P_name,age=P_age)
  attr(value,"class")<-"Person"
  return(value)
}

setClass("Employee",slots = list(boss = "Person"), contains = "Person")

alice <- new("Person", name = "Alice", age = 40)
P1 <- Person("Ravi", 26)

john <- new("Employee", name = "John", age = 20, boss = P1)

john@boss
john@.Data

slot(john, boss)
john@.Data



setClass("Person", representation(name = "character", age = "numeric"))
setClass("Employee", representation(boss = "Person"), contains = "Person")

Raghu <- new("Person", name = "Raghu", age = 30)
Ravi <- new("Person", name = "Hadley", age = 22)
Balaji <- new("Person")
# invalid class "Person" object: invalid object for slot "age" in class
#  "Person": got class "character", should be or extend class "numeric"

hadley <- new("Person", name = "Hadley", sex = "male")
# invalid names for slots of class "Person": sex
slot(Balaji, "age")
slot(Balaji)
#slot(hadley)

setClass("Person", representation(name = "character", age = "numeric"), 
         prototype(name = NA_character_, age = NA_real_))
hadley <- new("Person", name = "Hadley")
hadley@age
# [1] NA

typeof(hadley@age)
typeof(hadley@name)
balaji <- new("Person")
balaji@name
balaji@age
typeof(balaji@name)
typeof(balaji@age)
########################################
#to identify the properties that is available using the class name
getSlots("Person")
#        name         age 


# "character"   "numeric" 
check_person <- function(object) {
  errors <- character()
  length_age <- length(object@age)
  if (length_age != 1) {
    msg <- paste("Age is length ", length_age, ".  Should be 1", sep = "")
    errors <- c(errors, msg)
  }
  #print(typeof(object@weight))
  if (typeof(object@weight) != "integer") {
    msg <- paste("weight should be numeric - given", typeof(object@weight), sep=" ")
    errors <- c(errors, msg)
  }
  if (length(object@weight) != 1) {
    msg <- paste("weight is length ", length_age, ".  Should be 1", sep = "")
    errors <- c(errors, msg)
  }
  
  length_name <- length(object@name)
  if (length_name != 1) {
    msg <- paste("Name is length ", length_name, ".  Should be 1", sep = "")
    errors <- c(errors, msg)
  }
  
  if (length(errors) == 0) TRUE else errors
}
##################
setClass("Person", representation(name = "character", age = "numeric", weight = "integer",height = "numeric"), 
         prototype(name = NA_character_, age = NA_real_, weight= NA_integer_, height = NA_integer_),
         validity = check_person)

person_1 <- new("Person", name = "Hadley")

person_2 <- new("Person", name = "Hadley", age = 12, weight=50)
# invalid class "Person" object: Age is length 0.  Should be 1
person_3 <- new("Person", name = "Hadley", age = 1:10)


# But note that the check is not automatically applied when we modify 
# slots directly
hadley <- new("Person", name = "Hadley", age = 20)
hadley <- new("Person", name = "Hadley", age = c(20))
hadley <- new("Person", name = "Hadley", age = c(20,5))
#incorrect value setting via property
hadley@age <- 1:10

# Can force check with validObject:
validObject(hadley)
# invalid class "Person" object: Age is length 10.  Should be 1
#adding a method to the class
setClass("Shape")
setClass("Polygon", representation(sides = "integer"), contains = "Shape")
setClass("Triangle", contains = "Polygon")
setClass("Square", contains = "Polygon")
setClass("Circle", contains = "Shape")

sides <- function(object) 0
setGeneric("sides")
setMethod("sides", signature(object = "Polygon"), function(object) {
  object@sides
})
setMethod("sides", signature(object = "Polygon"), function(object) {
  object@sides
})
setMethod("sides", signature("Triangle"), function(object) 3)
setMethod("sides", signature("Square"),   function(object) 4)
setMethod("sides", signature("Circle"),   function(object) Inf)
#########################################################################################
################################################################################################
#R5 classes/Reference Class
# Reference classes
# R has three object oriented (OO) systems: [[S3]], [[S4]] and Reference Classes (where the latter were for a while referred to as [[R5]], yet their official name is Reference Classes). This page describes this new reference-based class system.
# Reference Classes (or refclasses) are new in R 2.12. 
#They fill a long standing need for mutable objects that had previously been filled by 
#non-core packages like R.oo, proto and mutatr. While the core functionality is solid,
#reference classes are still under active development and some details will change. 
#The most up-to-date documentation for Reference Classes can always be found in 
#ReferenceClasses.
# 
# There are two main differences between reference classes and S3 and S4:
#   
#Refclass objects use message-passing OO
#Refclass objects are mutable: the usual R copy on modify semantics do not apply
#These properties makes this object system behave much more like Java and C#. 
#Surprisingly, the implementation of reference classes is almost entirely in R code - 
#they are a combination of S4 methods and environments. This is a testament to the 
#flexibility of S4.
# 
#Particularly suited for: simulations where you're modelling complex state, GUIs.
# 
#Note that when using reference based classes we want to minimise side effects, 
#and use them only where mutable state is absolutely required. The majority of functions should still be "functional", and side effect free. This makes code easier to reason about (because you don't need to worry about methods changing things in surprising ways), and easier for other R programmers to understand.
# 
#Limitations: can't use enclosing environment - because that's used for the object.
# 


#Creating a new reference based class is straightforward: you use setRefClass. 
#Unlike setClass from S4, you want to keep the results of that function around, 
#because that's what you use to create new objects of that type:
  
# Or keep reference to class around.
Person <- setRefClass("Person")
Person$new()
#A reference class has three main components, given by three arguments to setRefClass:
#contains, the classes which the class inherits from. These should be other reference 
#class objects:
  
Account <- setRefClass("Account")
firstaccount <- Account$new()

Account <- setRefClass("Account",fields = list(balance = "numeric"))
a <- Account$new(balance = 100)
a$balance
b <- a$copy()
b$balance = 200

Account <- setRefClass("Account", fields = list(balance = "numeric"), methods = list(
                         withdraw = function(x) {
                           balance <<- balance - x
                         },
                         deposit = function(x) {
                           balance <<- balance + x
                         }
                       )
)

a <- Account$new(balance = 1000)
a$withdraw(100)
a$deposit(500)
a$withdraw(600)
a$withdraw(1600)

NoOverdraft <- setRefClass("NoOverdraft", contains = "Account",
                           methods = list(
                             withdraw = function(x) {
                               if (balance < x) stop("Not enough money")
                               balance <<- balance - x
                             }
                           )
)

a <- NoOverdraft$new(balance = 1000)
a$withdraw(1200)
a$deposit(500)


setRefClass("Polygon")
setRefClass("Regular")

# Specify parent classes
setRefClass("Triangle", contains = "Polygon")
setRefClass("EquilateralTriangle", 
contains = c("Triangle", "Regular"))

#fields are the equivalent of slots in S4. They can be specified as a vector of field 
#names, or a named list of field types:
  
setRefClass("Polygon", fields = c("sides"))
setRefClass("Polygon", fields = list(sides = "numeric"))
#The most important property of refclass objects is that they are mutable, or 
#equivalently they have reference semantics:
  
Polygon <- setRefClass("Polygon", fields = c("sides"))
square <- Polygon$new(sides = 4)

triangle <- square
triangle$sides <- 3

square$sides        
#methods are functions that operate within the context of the object and can modify its 
#fields. These can also be added after object creation, as described below.

setRefClass("Dist")
setRefClass("DistUniform", c("a", "b"), "Dist", methods = list(
mean <- function() {
    (a + b) / 2
  }
))
#You can also add methods after creation:
setRefClass(Class, fields = , contains = , methods =,
            where =, inheritPackage =, ...)

getRefClass(Class, where =)

#Example2 
Person <- setRefClass("Person")
typeof(Person)
Peter <- Person$new()
typeof(Peter)

#A reference class has three main components, given by three arguments to setRefClass:
#contains, the classes which the class inherits from. These should be other reference class objects:
    
setRefClass("Polygon")
setRefClass("Regular")
  
# Specify parent classes
setRefClass("Triangle", contains = "Polygon")
setRefClass("EquilateralTriangle", contains = c("Triangle", "Regular"))

#fields are the equivalent of slots in S4. 
#They can be specified as a vector of field names, or a named list of field types:
setRefClass("Polygon", fields = c("sides"))
setRefClass("Polygon", fields = list(sides = "numeric"))

#The most important property of refclass objects is that they are mutable, 
#or equivalently they have reference semantics:
Polygon <- setRefClass("Polygon", fields = c("sides"))
square <- Polygon$new(sides = 4)
class(square)  

x <- new("Polygon",sides=5)
class(x)
#objects copy by reference 
triangle <- square
square$sides <-4
triangle$sides <- 3
############################
class(triangle)
square$sides        
#methods are functions that operate within the context of the object and 
#can modify its fields. These can also be added after object creation, 
#as described below.

#Creating method during class creation  
setRefClass("Dist")

setRefClass("DistUniform", c("a", "b"), "Dist", methods = list(
mean <- function() {
(a + b) / 2
}
))
#You can also add methods after creation:
# Instead of creating a class all at once:

Person <- setRefClass("Person", fields = c("fullname"), methods = list(
      say_hello = function() message("Hello!"),
      say_hi = function() message("Hi!")
    ))
Person$methods()  
#a <- new("Person", Name="Karthick")
show(Person)

firstperson <- Person$new("Nithiya")
class(a)
class(firstperson)

a$say_hello()
firstperson$say_hello()
a$say_hi()
firstperson$say_hi()

#changing the property value 
firstperson$Name = "Balaji"


# You can build it up piece-by-piece
Person <- setRefClass("Person")
Person$methods()  
Person$methods(say_hello = function() message("Hi!"))
Person$methods()   

#It's not currently possible to modify fields because adding fields would invalidate 
#existing objects that didn't have those fields.
  
#The object returned by setRefClass (or retrieved later by getRefClass) is called a 
#generator object. It has methods:
    
#new for creating new objects of that class. The new method takes named arguments 
#specifying initial values for the fields
  
#methods for modifying existing or adding new methods
# help for getting help about methods
#  
#   fields to get a list of fields defined for class
#   
#   lock locks the named fields so that their value can only be set once
#   
#   accessors a convenience method that automatically sets up accessors of the form getXXX and setXXX.
#   
#   Methods
#   Refclass methods are associated with objects, not with functions, and are called using the special syntax obj$method(arg1, arg2, ...). (You might recall we've seen this construction before when we called functions stored in a named list). Methods are also special because they can modify fields. This is different
#   
#   We've also seen this construct before, when we used closures to create mutable state. Reference classes work in a similar manner but give us some extra functionality:
#     
#     inheritance
#   a way of documenting methods
#   a way of specifying fields and their types
#   Modify fields with <<-. Will call accessor functions if defined.
#   
#   Special fields: .self (Don't use fields with names starting with . as these may be used for special purposes in future versions.)
#   
#   initialize
#   
#   Common methods
#   Because all refclass classes inherit from the same superclass, envRefClass, they a have common set of methods:
#     
#     obj$callSuper:
#     
#     obj$copy: creates a copy of the current object. This is necessary because Reference Classes classes don't behave like most R objects, which are copied on assignment or modification.
#   
#   obj$field: named access to fields. Equivalent to slots for S4. obj$field("xxx") the same as obj$xxx. obj$field("xxx", 5) the same as obj$xxx <- 5
#   
#   obj$import(x) coerces into this object, and obj$export(Class) coerces a copy of obj into that class. These should be super classes.
#   
#   obj$initFields
# )


Assignment 
#1. 
#Create s4 AND R5 classes for person, student, employee, hr 
#student, employee and hr should inherit from person class
#student, employee and hr must have properties age, date of birth and Name as a compulsory property
#student should have other properties for subjects (maths , science, english, tamil, history)
#students should have methods for calculating total
#given a list of n no of student objects, method should be created to return the rank of each students

#employee
#employee should have properties designation and years of experience and salary as their properties
#given a list of employees, there should be a method to list the top five salaried persons 
#also create a method to sort the employees based on salary (asc/desc)

#Hr should inherit from employee class having value for property designation as HR
#HR should have properties hired and fired.

#2.
#Tabulate the differences between S3, S4, and R5 Class