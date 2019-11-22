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
print(trunc(y))

#sqrt 
x = 2
sqrt(x)
#round 
x  =1.451789
round(x,2) #rounds to that no of decimal places
round(x,3)
round(x,4)
round(x,5)
x = -1.451789
#signif 
signif(x,2)#considers rounding off from that digit specified
signif(x,3)
signif(x,4)

#cos, sin , tan 
a = 0 
sin(a)
cos(a)
tan(a)
#log , log10x , exp
b =1112
log(b)
log2(b)
log10(b)

exp(b)
exp(0)
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
#to know about regular expressions
#https://www.regular-expressions.info/

pattern ="[0-9]"#"hello", "HeLLo"

x1 =c("1dac","a2bc","abc","b5ca")
y1 = grep(pattern,x1, ignore.case = TRUE, fixed = FALSE)
print(y1)
#get matches
x1[y1]


x2 = "helloworld"
y2 = grep(pattern,x2, ignore.case = TRUE, fixed = FALSE)
print(y2)

pattern ="[0-9]+"
y2 = grep(pattern,x2, ignore.case = TRUE, fixed = FALSE)
print(y2)
##################################
#sub#
pattern = "[a-z]+"
y ="#Welcome 2 R studio"
z = sub(pattern, "Language", y, ignore.case = TRUE, fixed = FALSE)
y1 =c("dac","a2bc","b5ca")
z1 = sub(pattern, "Language", y1, ignore.case = FALSE, fixed = FALSE)

y2 = c("Dac","a2bc","b5ca")
pattern = "[a-z]+"
z2 = sub(pattern, "to", y2, ignore.case = FALSE, fixed = FALSE)

y3 = c("Dac","a2bc","b5ca")
pattern = "[a-z]+"
z3 = sub(pattern, "to", y3, ignore.case = FALSE, fixed = TRUE)
#fixed = TRUE -> Disable Regex
#fixed = FALSE -> Enable Regex
#ignore.case = TRUE -> ignore the case sensitivity
#ignore.case = FALSE -> consider the different cases separtely
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
g = casefold(a,  TRUE)#TRUE - > upper case , # FALSE -> Lower case
print(g)
g = casefold(a,  FALSE)
print(g)
####################################################################
library("stringr")
x = "hello welcome to python 2 real world"
b = str_to_upper(a)
c = str_to_lower(b)
d = str_to_title(c)
d1 = str_to_title(x)
d2 = str_to_title("welcome to python")

####################################################################


