#DataTypes - Formulas
# ~ Operator
#response variable âˆ¼ predictor variables
#y ~ (a + b + c )
#y = 2a+3b+2c
# ~ Represents y is a function of a,b,c (ie) y = f(a,b,c)
# + +X include this variable
# - -X delete this variable
# : X:Z include the interaction between these variables
#y~a:b
#y=(a*a)b+a(b*b) 
# aˆ—X aˆ—Y include these variables and the interactions between them
#y~a..b
#y = a + b + ab 
# | X | Z conditioning: include x given z
# ^ (X + Z + W)^3 include these variables and all interactions up to three way
# I I(Xaˆ—Z) as is: include a new variable consisting of these variables multiplied
#I(xa..b)
#ab+bba 
# 1 X - 1 intercept: delete the intercept (regress through the origin)

Y ~ X + Z + W + X:Z + X:W + Z:W + X:Z:W
Y ~ X * Z * W
Y ~ (X + Z + W)^3Y ~ X + Z + W + X:Z + X:W + Z:W + X:Z:W
Y ~ X * Z * W
Y ~ (X + Z + W)^3

