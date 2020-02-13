#Data Frames are used to represent tabular data
#It is used to store multiple types of data in different measurements.
#creating a dataframe
#Each Row in the data frame must have equal length
#ie) It should have equal no of column values
my_dataframe <- data.frame(a =c(1,2,3+2i,4), b=c(1,2,3.0,4))
#print is not possible since there is an
#error in initialization of dataframe due to different no of columns
print(my_dataframe)
my_dataframe <- data.frame(a =c(1,2,3,4,5), b=c(1,2,3,4,5))
#when having equal column count for all rows it's feasible
print(my_dataframe)
#creating a reasonable dataframe for employees
my.name = "balaji"
my.age ="33"
my.company.age = 10
my.company.dataframe.employees <- data.frame(name=c("Raj","Kumar","Priya","Peter"),
             age =c(29,36,24,26),
             Designation = c("HR","Designer","Administrator","Developer")
             )
#print(my)
print(my.company.dataframe.employees)
#Students
my.school.students <- data.frame(name=c("Krishna","Akshay","Nancy","Preethi"),
                                 Gender= c("male","male","female","female"),
                                 age =c(19,17,20,18))

my.school.teachers <- data.frame(name=c("Krishna","Akshay","Nancy","Preethi"),
                                 Gender= c("male","male","female","female"),
                                 age =c(39,47,29,38))

print(my.school.students)
print(my.school.teachers)
#Students
#my.College.students_1 <- data.frame(name=c("Krishna","Akshay","Nancy","Preethi"),
#                                 Gender= c("male","male","female","female"),
#                                 age =c(19,17,20,18),
#                                 Subjects = c(c("maths","Biology","Physics"),
#                                             c("Drawing","Painting","Crafting"),
#                                             c("maths","Chemistry","Physics"),
#                                             c("English","Tamil","French")))
#print(my.College.students_1)

#my.College.students_2 <- data.frame(name=c("Krishna","Akshay","Nancy","Preethi"),
#                                    Gender= c("male","male","female","female"),
#                                    age =c(19,17,20,18),
#                                    Subjects = c(list("maths","Biology","Physics"),
##                                                 list("Drawing","Painting","Crafting"),
#                                                 list("maths","Chemistry","Physics"),
#                                                 list("English","Tamil","French")))


#Using Cbind and Rbind to add additional rows and columns to students
#Extending the Data Frame
#Lets reinitialize the data frame to keep it normal
my.school.students <- data.frame(name=c("Krishna","Akshay","Nancy","Preethi"),
                                 Gender= c("male","male","female","female"),
                                 age =c(19,17,20,18))

my.school.students$name
my.school.students$age
my.school.students$Gender

#NA while adding same named row to dataframe
my.school.students$Gender 
print(typeof(my.school.students$Gender))
print(typeof(my.school.students$name))

my.school.students$Specialization <- c("Maths","Chemistry","Biology","Physics")

print(my.school.students)
#Lets add another column using cbind

Rank <- c(2,4,1,5)
newcolumn = cbind(my.school.students,Rank)
#Actual DataFrame is not assigned
my.school.students<-cbind(my.school.students,Rank)
print(my.school.students)
# To add an Additional Row
new_student = c("Akash","male",21,"Drawing",3)
typeof(new_student)
result = rbind(my.school.students,new_student)
new_student = data.frame(name = "Akash",Gender = "male",age = 21,Specialization= "Drawing",Rank=3)
typeof(new_student[1])
typeof(new_student[2])
typeof(new_student[3])
my.school.students<-rbind(my.school.students,new_student)
print(my.school.students)
