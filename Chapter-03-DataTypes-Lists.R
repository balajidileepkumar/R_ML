#Creating Normal List From Vectors
m = c(1,2,3)
n = c(1.0,2.0,3.0)
o = c(1.0+2.0i,2.0+3.0i,3.0+4.0i)
p = c(TRUE,FALSE)
Q_list = list(m,n,o,p)
print(Q_list)
#Creating named Lists
my_named_list = list(name=c("Raj","Dilip","Jai"),age=c(23,27,25),salary=c(14000.00, 12000.00, 15000.00))
print(my_named_list)
#List Slicing (is equivalent to indexing only it's when read)
print(my_named_list["name"])
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
#attach and detach
detach(my_named_list)
attach()