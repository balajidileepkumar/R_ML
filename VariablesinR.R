#Basic Datatypes in R
# Numeric
# integer
# Complex
# Logical
# Character

# Variables in R
# Variables are defined by three ways
  # Variable_name = Variable_Value
  # variable_name<- Variable_Value
  # Variable_Value -> Variable_name
#examples
var_x =10
var_y <- 20
30->var_z
#all the above statements are valid
#we can also say
var_x + var_y ->var_a

#Functions on module
#class,ls,rm
#class() defines the class of the variable
#ls list of variables available in the current scope
#remove the variable in the available scope
ls()
# Result - [1] "var_a" "var_x" "var_y" "var_z"
rm(var_x)#removes the variable var_x from the current scope.
ls()

#Functions on module
#class,ls,rm
#class() defines the class of the variable
#ls list of variables available in the current scope
#remove the variable in the available scope
ls()
# Result - [1] "var_a" "var_x" "var_y" "var_z"
rm(var_x)#removes the variable var_x from the current scope.
ls()
#Result [1] "var_a" "var_y" "var_z"

class(var_x) # provides the type of the object,
#[1] "numeric"
deci_1 = 1234.56
#[1] "numeric"
class(deci_1)
abc_a ="abc"
class(abc_a)
#[1] "character"
comp_1 = 1+2i
class(comp_1)
#[1] "complex"
log_1 = TRUE
class(log_1)
#[1] "logical"

