## Conditional and Block statements 
a = 10 
b = 110
#if(a >b) { print(a) } else {  print(b) }

if(a>b)
{
  print(a) 
} else if(a==b) {
  print("equal")
} else {
  print(b) 
}

#Block Statements
###################
#Switch
###################
#a = switch(expression, case1,case2,case3,.....casen)
a = switch(3, FALSE,"case2","case3")
print(a)
a = 9 
b = 10
a>b
c = switch(a>b, FALSE,TRUE)
print(c)
selector = "logical"
c = switch(selector,"color"="red", "number"=1, "logical"=TRUE)
print(c)

Invite = "Welcome"
y = switch(Invite, Hello = {
  print("Hello to besant1")
  print("Hello to R Lang1")
},
Welcome  = {
  print("Welcome to besant2")
  print("Welcome to R Lang2")
  "I get to returned to the caller"
  })
y
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
letters
vowels = c('a','e','i','o','u')
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
  if(x >1000){
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


