#Functions in R 
#Numeric FUnctions 
# abs 
x =125
print(abs(x))
y= -125
print(abs(y))
#Ceiling 
x = 1.456
ceiling(x)
y = 1.7
ceiling(y)
#Floor
floor(x)
floor(y)
#Trunc
print(trunc(x))
#sqrt 
x = 2
sqrt(x)
#round 
x  =1.451789
round(x,2)
round(x,3)
round(x,4)
round(x,5)
#signif 
signif(x,2)
signif(x,3)
#cos, sin , tan 
a = 0 
sin(a)
cos(a)
tan(a)
#log , log10x , exp
b =1
log(b)
log10(b)
exp(b)
################################
#Character Functions
################################
#substr#
x = "Hello World "
y = substr(x, start=5, stop =10 )
print(y)
print(x)
##################################
#grep
#grep(pattern,x, ignore.case = FALSE,fixed = FALSE)

pattern ="[0-9]"
x1 = c("dac","a2bc","b5ca")
y1 = grep(pattern,x1, ignore.case = TRUE, fixed = FALSE)
print(y1)
##################################
#sub#
pattern = "studio"
y ="Welcome 2 R studio"
z = sub(pattern, "Language", y, ignore.case = FALSE, fixed = TRUE)
pattern = "\\d"
z1 = sub(pattern, "to", z, ignore.case = FALSE, fixed = FALSE)
####################################################################
#paste
a = paste("x",1:3,sep ="-")
b = paste("x","Hello", "world")
b1 = paste("x","Hello", "world",sep ="-")
c = paste("x","Hello", "world",2:4, sep ="_")
####################################################################
#to upper
#to lower
a = "inDia"
e = tolower(a)
f = toupper(a)
g = casefold(a, upper = FALSE)
####################################################################
library("stringr")
b = str_to_upper(a)
c = str_to_lower(b)
d = str_to_title(c)
####################################################################


