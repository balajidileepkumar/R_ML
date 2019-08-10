## Conditional and Block statements 
a = 10 
b = 10
#if(a >b) { print(a) } else {  print(b) }

if(a >b)
{
  print(a) 
} else if(a ==b ) {
    print("equal")
}else {
  print(b) 
  }

#Block Statements
###################
#Swtich
###################
#a = switch(expression, case1,case2,case3,.....casen)
a = switch(1, FALSE,"case2","case3")
print(a)
a>b
b = switch(a>b, TRUE,FALSE)
print(b)
selector = "color"
c = switch(selector,"color"="red", "number"=1, "logical"=TRUE)
print(c)

Invite = "Hello"
switch(Invite, Hello = {
  print("Hello to besant1")
  print("Hello to R Lang1")
},
Welcome  = {
  print("Welcome to besant2")
  print("Welcome to R Lang2")
})
##################
#For statement
##################
for(a in c(1,3,4))
{
  print(sqrt(a))
}
V <- LETTERS
month_abb <- month.abb 
months_name <- month.name

for(x in V)
{
  print(x)
}
###################
#Repeat
###################
x = 1
repeat{
  print(x*2)
  x = x+1
  if(x >100){
    break
  }
}
###################
#while 
###################
a = 100
b =1000
while(a < b)
{
  a = a + 100
  print(paste("a is lesser", a))
}
###################
#while 
###################


