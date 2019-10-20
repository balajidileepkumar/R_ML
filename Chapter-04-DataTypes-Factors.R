#Factors in R
#Factors in R
#Factors are vector datatypes containing limited type of items.
#Usage
#factor(x = character(), levels, labels = levels,
#       exclude = NA, ordered = is.ordered(x), nmax = NA)
#Consider the example
myfactor =  factor(c("male", "female","male" ,"female","male","male","male"))
is.factor(myfactor)
levels(myfactor)
class(myfactor)
nlevels(myfactor)

#another example
directions_vector = c("NOrth","South","East", "West","Northeast","Northwest")
is.factor(directions_vector)
is.vector(directions_vector)

mydirectionalfactor =factor(x = directions_vector, labels = c("PrimaryDirection"))
mydirectionalfactor =factor(x = directions_vector,c("South","East"))
levels(mydirectionalfactor)
class(mydirectionalfactor)

is.factor(mydirectionalfactor)

levels(mydirectionalfactor)
nlevels(mydirectionalfactor)
class(mydirectionalfactor)

nlevels(mydirectionalfactor)
mydirectionalfactor =factor(x = directions_vector, labels = c("N","S","E","N","NE","NW"))
#Setting up the levels



# Create a vector as input.
data <- c("East","West","East","North","North","East","West","West","West","East","North")

print(data)
print(is.factor(data))

# Apply the factor function.
factor_data <- factor(data)

print(factor_data)
print(is.factor(factor_data))
