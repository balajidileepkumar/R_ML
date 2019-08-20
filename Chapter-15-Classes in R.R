##OOPS - Classes in R 
## R follows S3,S4 and R5 class structures
## Each having it's own way of implementation.

#S3 CLASS
#S3 class type is an simplified class creation type.
var1<-list(name="hari",age=40,Dept="HR")
var2<-list(name="Vignesh",age=20,Dept="SALES")

class(var1) <- "Employee"
class(var2) <- "Employee"

x<-structure(list(name="Rajesh",age=25,Dept="Production"),class="Employee")
class(x)

ceo <-list(name="Rajesh",age=25,Dept="CEO")
attr(ceo, "class") <- "CEO"
class(ceo)
##We have created the Employee objects in different ways

print(var1)
print("#############")
print(var2)
print("#############")
print(x)
print("#############")
#Now we can access the properties of each object independently
print(paste(var1$name,var2$name,x$name, sep ="1:3"))


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
### S Far we have created s3 class and object, lets see how to create methods to it which will
## which will define the behaviour of it's objects

print(student_1)
## the above statement prints the student_1 information by listing up all properties. 
#we can provide a different implementation according to the needs

print.student(student_2)
#here its applicable to other objects since it accepts objects of any different type
student_1$name

student_1$age

student_1$GPA

print(student_1)

student.print<- function(obj){
  cat("Name : ", obj$name,"\n") 
  cat("Age : ", obj$age,"\n") 
  cat("Grade : ", obj$GPA,"\n")
}
student.print(student_1)
############
#S4 Classes
#setClass((classname,attributes/components),prototype(name=attributes/components default))
