#DataTypes - Formulas
# ~ Operator
#response variable ∼ predictor variables
#y ~ (a + b + c )
# ~ Represents is y is a function of a,b,c (ie) y = f(a,b,c)
# + +X include this variable
# - -X delete this variable
# : X:Z include the interaction between these variables
# ∗ X∗Y include these variables and the interactions between them
# | X | Z conditioning: include x given z
# ^ (X + Z + W)^3 include these variables and all interactions up to three way
# I I(X∗Z) as is: include a new variable consisting of these variables multiplied
# 1 X - 1 intercept: delete the intercept (regress through the origin)

Y ~ X + Z + W + X:Z + X:W + Z:W + X:Z:W
Y ~ X * Z * W
Y ~ (X + Z + W)^3Y ~ X + Z + W + X:Z + X:W + Z:W + X:Z:W
Y ~ X * Z * W
Y ~ (X + Z + W)^3