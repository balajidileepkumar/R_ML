#Data Types in R
#Primary
 #character
 #double
 #complex
 #logical

#Secondary
#Vectors
#Lists
#Matrices
#data.frame
#Factors
#Formulas
#Arrays

#Vectors
#Vectors are datasctructure that contain similar type of data
vector_numerical = c(6,7,8+2i)
vector_numerical[1]
#pi
#typeof operator is used determine the type of the object
typeof(vector_numerical) # [1] "double"
length(vector_numerical) # [1] 3
#Here C is called as the categorical/combinational operator which does the 
#work of Combining multiple types to one single type based on their 
#precedence
vector_logical = c(TRUE,FALSE,FALSE)
typeof(vector_logical) # Result [1] "logical"
vector_strings = c("aa","bb","cc")
typeof(vector_strings) # Result [1] "character"
vector_complex = c(1+2i, 2+3i,3+4i,12)
typeof(vector_complex) # Result  [1] "complex"

#Combining Vectors
m =c(6,7,8,9)
#typeof(m)
n =c(1,2,3,4,5)
#typeof(n)
o = c(m,n)
typeof(o)
# Result [1] 6 7 8 9 1 2 3 4 5
#combining different type of vectors
Q= c("aa","bb","cc")
P= c(1,2,3)
R  = c(Q,P)
typeof(R)
#Result [1] "aa" "bb" "cc" "1"  "2"  "3"
O = c(TRUE,FALSE)
Q= c("aa","bb","cc")
P= c(1,2,3)
R  = c(Q,P,O)
typeof(R)
R  = c(O,P)
typeof(R)


#Arithmetic Operations on Vectors
a = c(1,2,3,4,5)
b = c(4,5,6,7)
# Recycling is used here to match both vectors
a*b #Multiply # Result [1]  4 10 18 28 20
a+b #Add # Result [1]  5  7  9 11  9
a-b #Subtract Result [1] -3 -3 -3 -3  1
b-a #Subtract Result [1]  3  3  3  3 -1
a/b #Divide Result [1] 0.2500000 0.4000000 0.5000000 0.5714286 1.2500000
a%%b #Modulus Result [1] 1 2 3 4 1
a%/%b#quotient 
b%%a #Modulus Result [1] 0 1 0 3 4
b%/%a
#Here the vector with shortest length is recycled to match the vector with higher length to perform the arithmetic operation.

#Relational Operators
a =c(1,2,3,4,5)
b = c(4,5,6,7)
a>b # Result [1] FALSE FALSE FALSE FALSE  TRUE
b>a # Result [1]  TRUE  TRUE  TRUE  TRUE FALSE
a==b# Result [1] FALSE FALSE FALSE FALSE FALSE
a<=b# Result [1]  TRUE  TRUE  TRUE  TRUE FALSE
a>=b# Result [1] FALSE FALSE FALSE FALSE  TRUE
a!=b# Result [1] TRUE TRUE TRUE TRUE TRUE

#Logical Operators
#Here are the set of logical operators that R language allows to use. This operator is valid only to vectors of type logical, number or complex numbers.
#For Numeric - Values are considered to be true if it's value is greater than  1
#For Logical - Values are considered to be true if it's value is TRUE

#Element Wise /Bit Wise And
#Result is true if the equivalent elements in both vectors are true
x <- c(1, 1, TRUE, 2+3i)
y <- c(2,1,FALSE, 2+3i)
x&y #Result [1]  TRUE  TRUE FALSE  TRUE
x&&y
#Element Wise /Bitwise OR
#Combines first vector with second vector the result is true if one element in a is true.
x <- c(0,0, TRUE, FALSE,2+2i)
y <- c(1,0, FALSE, FALSE,2+3i)
x | y #Result  [1]  TRUE FALSE  TRUE FALSE  TRUE
#Element Wise Not Operation
#Provides Negated value for each element in a vector
x <- c (FALSE, 3,0, TRUE, 2+2i)
!x #Result [1]  TRUE FALSE TRUE FALSE FALSE

#Logical AND
#Atleast one element is true in bitwise and operation
x <- c(3,0,TRUE,2+2i)
y <- c(1,3,TRUE,2+3i)

a <- c(FALSE, FALSE,1)
b <- c(TRUE,TRUE,0)

e <- c(TRUE, FALSE,1)
f <- c(TRUE,TRUE,0)

x&&y # Result [1] TRUE
a&&b # Result [1] FALSE
e&&f # Result [1] FALSE

#Lets go for Logical OR operation on the above variables now
#Atleast one element is true in bitwise OR operation

x <- c(3,0,TRUE,2+2i)
y <- c(1,3,TRUE,2+3i)

a <- c(FALSE, FALSE,1)
b <- c(TRUE,TRUE,0)

#lets change data for e and f
e <- c(FALSE, FALSE,0)
f <- c(FALSE, FALSE,0)

x|y
x||y

a|b
a||b

e|f
e||f


#Assignment Operations

a1 <- c(2,1,TRUE, 2+3i)

a2 <<- c(2,1,TRUE, 2+3i)

a3 = c(2,1, TRUE, 2+3i)

c(2,1, TRUE, 2+3i) -> a4

c(2,1, TRUE, 2+3i) ->> a5

a1
a2
a3
a4
a5

#Indexing Vectors
a <- c(11,12,13,14,15,6,6,7,7,8,9)
a[0] # Result numeric(0) # indexing starts from 1, unlike other programming languages where it starts from on hence
#numeric(0) would be the result
a[1]
a[3] #Result [1] 3
a[8]
a[1:3] #Result [1] 1 2 3 # Between Start Index and End Index
a[3:7]  # Result [1] 3 4 5 6 6 # Value Between Two Sequences
a[-9]
a[-5:-1] # Eliminates the negative sequence from 5th poisiton to 1st position

a[c(1,3,7,9)] #Result [1] 1 2 3 6 7 # Selecting Particular values with input vector containg indexe to be selected
a[-1:-6]#Result [1] 6 7 7 8 9 negative index starts from the right.
a[-3:-9]#Result [1] 11 12  8  9
a[c(-1,-2,-4,-5)]
#Result [1] 6 6 7 7 8 9  # Selecting Particular values with input vector containg indexe to be selected
a[c(-1,-4,-5)] #Result [1] 6 6 7 7 8 9  # Selecting Particular values with input vector containg indexe to be selected
#Logical Indexing
Vector_bool = c(TRUE, FALSE, TRUE , TRUE, FALSE)
typeof(Vector_bool)
#``````````````````````````````````````````````````````````````````````````````````````````````````

Vector_any = c("JOHN", "MIKE", "PETE", "WeSCHE","SEBASTIN")
Vector_any[Vector_bool] #Result [1] "JOHN"   "PETE"   "WeSCHE"
#Here Only True Values for Vector is Selected.
#Recycling is not followed in the indexing operation
Vector_languages =c("Python","R Language", "Java", "C#")
Vector_bool = c(FALSE, TRUE)
Vector_languages[Vector_bool] # Result [1] "R Language" "C#"         NA
#Recycling is followed in the indexing operation
Vector_languages =c("Python","R Language", "Java", "C#")
Vector_bool = c(TRUE, FALSE)
Vector_languages[Vector_bool]

#Naming a Vector
languages = c("Python","R Language", "Java", "C#")
names(languages) = c("Best", "Very Best", "Good", "Mediocre")
#lets print the data for languages vector now
languages # Result     Best    Very Best         Good     Mediocre
# "Python" "R Language"       "Java"         "C#"
languages["Good"]
#We can also retrieve the element using it's name
languages["Very Best"] #Result Very Best
"R Language"
languages[c("Best","Very Best")]
#Some Example


