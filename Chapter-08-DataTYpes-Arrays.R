#multidimensional - stores only basic datas numbers, logical values and strings
# Create two vectors of different lengths.
vector1 <- c(1,2,3,4)
vector2 <- c(5,6,7,8,9,10,11,12,13,14,101)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3))
result <- array(c(vector1,vector2),dim = c(3,3,2))
result <- array(c(vector1,vector2),dim = c(3,2,3))
result <- array(c(vector1,vector2),dim = c(2,2,3,2))
print(result)
#1,2,3,4,5,6,7,8,9,10,11,12,13,14,101,1,2,3,4,5,6,7,8,9

#1,2
#3,4
#5,6
#7,8
#9,10
#11,12,
#13,14
#101,1
#2,3
#4,5
#6,7
#8,9

