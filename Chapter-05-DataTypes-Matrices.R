#ALLOWS ONE TYPE OF TWO DIMENSIONAL DATASTRUCTURE
A_matrix= matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol =3, byrow =TRUE)
#Given Lesser Values the values start repeating for the matrix
#Given Higher Values the values are discarded beyond the matrix range
B_matrix = matrix(c(1,0,0,0,1,0,0,0,1), nrow = 3 , ncol = 3 , byrow = FALSE)
C_matrix= matrix(c(1,2,3,4,5,6,7,8), nrow = 2, ncol =4, byrow =TRUE)
C1_matrix= matrix(c(1+2i,2+3i,3+4i,4+5i,5+6i,6+7i,7+8i,8+9i), nrow = 2, ncol =4, byrow =TRUE)
D_matrix = matrix(c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0), nrow = 4 , ncol = 2 , byrow = FALSE)
E_matrix = matrix(c(1.0,2.0,3.0,4.0,5.0,6.0,7.0), nrow = 4 , ncol = 2 , byrow = FALSE)


print(A_matrix)
print(B_matrix)
print(C_matrix)
print(C1_matrix)
print(D_matrix)
print(E_matrix)

#Matrix Operations
F_matrix = A_matrix*B_matrix
print(F_matrix)
G_matrix = A_matrix/B_matrix
print(G_matrix)
H_matrix = B_matrix/A_matrix
print(H_matrix)
#Transpose of Matrix
t(A_matrix)#To Get the transpose of a matrix
t(B_matrix)
#dim is used to find the dimensions of a matrix
dim(C_matrix)
dim(C1_matrix)
#Rbind and Cbind Operations on Matrix
RowBindC_Matrix = rbind(C_matrix,C1_matrix)
#Auto Converted to Higher Element Type
print(RowBindC_Matrix)
C2_stringmatrix= matrix(c("a","b","c","d","e","f","g","h"), nrow = 2, ncol =4, byrow =TRUE)
RowBindedC_Matrix = rbind(RowBindC_Matrix,C2_stringmatrix)
#Auto Converted to Higher Element Type
print(RowBindedC_Matrix)

#Indexing In Matrices
#Lets Use new matrix
Row_Indexable_Matrix= matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol =3, byrow =TRUE)
print(Row_Indexable_Matrix)
#Get the First Element
print(Row_Indexable_Matrix[1])
#Get the First Row
print(Row_Indexable_Matrix[1,])
#Get the First Row And First COlumn Element
print(Row_Indexable_Matrix[1,1])
#Get the Second Element
print(Row_Indexable_Matrix[8])
#Get the Second Row
print(Row_Indexable_Matrix[2,])
#Get sequence of Rows from 1 to 2
print(Row_Indexable_Matrix[1:2,])
print(Row_Indexable_Matrix[c(1:3),1:2])
#Get Rows Selectively
print(Row_Indexable_Matrix[c(1,3),])
#Get the First Column
print(Row_Indexable_Matrix)
#Get the First Element
print(Row_Indexable_Matrix[1])
#Get the First Row
print(Row_Indexable_Matrix[1,])
#Get the First Row And First COlumn Element
print(Row_Indexable_Matrix[1,1])
#Get the Second Element
print(Row_Indexable_Matrix[2])
#Get the Second Row
print(Row_Indexable_Matrix[2,])
#Get sequence of Rows from 1 to 2
print(Row_Indexable_Matrix[1:2,])
print(Row_Indexable_Matrix[c(1:3),])
#Get Rows Selectively
print(Row_Indexable_Matrix[c(1,3),])
#Get the First Column
print(Row_Indexable_Matrix[,c(1)])
#Using Negative Index
#Eliminate First Row
print(Row_Indexable_Matrix[-1,])
#Eliminate First Row to 2 Row
print(Row_Indexable_Matrix[-1:-2,])
#Eliminate 1 Row & 3rd Row
print(Row_Indexable_Matrix[c(-1,-3),])
#Eliminate Certain values, removing first and third value
print(Row_Indexable_Matrix)
#Here 1 and 7 is element that is eliminated
print(Row_Indexable_Matrix[c(-1,-3)])
#Here 1 and 7 is element that is eliminated
#Removing Sequence in negative indexing
print(Row_Indexable_Matrix[-1:-6])
print(Row_Indexable_Matrix[-1:-2])
#since by Row = True it goes through each row elements.
# Removing Columns in negative indexes
print(Row_Indexable_Matrix[,c(-1,-3)])
#Setting up names for matrix

#Naming up the rows and columns
Colors_Additive_matrix = matrix(c("red","green","blue","yellow","pink","magneta"),nrow=3,ncol=2,byrow=FALSE)
print(Colors_Additive_matrix)
dimnames(Colors_Additive_matrix) = list(c("row1","row2","row3"),c("col1","col2"))
print(Colors_Additive_matrix)
#by using names method only for columns
#dimnames(Colors_Additive_matrix[,1]) = list(c("primary_colors"))
#print(Colors_Additive_matrix)

#Names can also be given during Construction
Colors_Additive_matrix1 = matrix(c("red","green","blue","yellow","pink","magneta"),nrow=3,ncol=2,byrow=FALSE, dimnames = list(c("r1","r2","r3"),c("c1","c2")))
print(Colors_Additive_matrix1)
#selecting on rows or column names
print(Colors_Additive_matrix["row1",])
print(Colors_Additive_matrix["row1", "col1"])
print(Colors_Additive_matrix["row3", "col1"])
#Error while sequencing
print(Colors_Additive_matrix[c("row1" : "row2"), "col1"])
#names and dim names differences when using for matrix