#Creating Normal List From Vectors
#list is a collection of items of different type
#it's multidimenisional
basic_list  =list(1,2,3+4i,TRUE, "Hello World")
typeof(basic_list)

m = c(1,2,3)
n = c(1.0,2.0,3.0)
o = c(1.0+2.0i,2.0+3.0i,3.0+4.0i)
p = c(TRUE,FALSE)

Q_list = list(m,n,o,p)
print(Q_list)
names(Q_list) = c("numbers","float","complex", "boolean")
print(Q_list)
Q_list$float
Q_list$boolean

Q_list$numbers[3]

Q_list$boolean[2]

Q_list$float
Q_list$boolean

#Creating named Lists
NoNamedList = list(c("Raj","Dilip","Jai"),c(23,27,25),c(14000.00, 12000.00, 15000.00))
names(NoNamedList) = c("Name","Age")

my_named_list = list(name=c("Raj","Dilip","Jai"),age=c(23,27,25),salary=c(14000.00, 12000.00, 15000.00))
print(my_named_list)
#List Slicing (is equivalent to indexing only it's when read)
print(my_named_list["name"])
my_named_list$name[1]
my_named_list[["name"]]
print(my_named_list[["name"]][1])
my_named_list$name[1]

print(my_named_list["age"])
print(my_named_list["salary"])
#Get the MEMBER REFERENCED
print(my_named_list[["name"]][1])
print(my_named_list[["age"]][2])
print(my_named_list[["salary"]][3])
print(my_named_list[["name"]][1:2])
print(my_named_list[["name"]][c(1,3)])
print(my_named_list[c("name","salary")])
#APPLY THE INDEXING
my_named_list[["name"]][1] = "Peter"
my_named_list[["name"]][2] = "John"
my_named_list[["name"]][3] = "Mike"
#Reprinting the Values
print(my_named_list[["name"]][1])
print(my_named_list[["age"]][2])
print(my_named_list[["salary"]][3])
print(my_named_list[["name"]][1:2])
print(my_named_list[["name"]][c(1,3)])

#lapply(my_named_list,"[",1,2)


print(my_named_list[[c(1:3)]])
print(my_named_list[["name"]])
#attach and detach
#attach is used access the values by the column directly

#Default the header is attached until we give a detach method
my_named_list$name
name
detach(my_named_list)
name
age
salary
attach(my_named_list)

class(my_named_list)
a =5.0
class(a)
typeof(a)
