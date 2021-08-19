
# Vector
# Numeric
x = c(2,3,4)
x
class(x)
length(x)

# Character
y = c('a', 'b', 'c')
y

class(y)

# Logical
z = c(TRUE, TRUE, FALSE, FALSE) 

# Integers
a = c(1L, 2L, 3L)
class(a)

# Adding element to vector
y = c(y, 'd')
y

# Vectors from a sequence of numbers
series = 1:10
series
seq(10)
seq(1,10,1.5)
?seq

# Matrices
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)

# Creating a matrix
m = matrix(1:10, nrow = 2, ncol = 5)
m
# row column
dim(m)

# Matrix filled row wise with giving names to rows and columns
(mymatrix = matrix(1:6, nrow=3, byrow=TRUE, dimnames= list(c("d","e","f"),c("a", "b"))))

# Matrix filled column wise
(mymatrix = matrix(1:6, nrow=3, byrow=FALSE))

# Other way to create a matrix
m <- 1:10
dim(m) = c(5,2)
m

mymatrix

# Add row to a matrix
c = c(7,8,9)
mymatrix1 = cbind(mymatrix, c)
mymatrix1
# Add column to a matrix
g = c(10,11,12)
mymatrix2 = rbind(mymatrix1, g)
mymatrix2

# List
(v1 = 1:5)
class(v1)
(v2 = month.abb[4:10])
class(v2)
(v3 = c(T,F, TRUE, FALSE))
class(v3)
(combinedV = c(v1, v2, v3))
class(combinedV)

list1 = list(v1, v2, v3)
list1
class(list1)

# Array
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1", "Matrix2")

# Take these vectors as input to the array
result <- array(c(vector1,vector2),dim = c(3,3,2), dimnames = list(row.names, column.names, matrix.names))
print(result)

# Data Frame
# show structure of similar to excel data

# simplest way
df1 = data.frame(name = c('s1','S2','S3'), age = c(22,23,24))
df1

# create using vectors
(rollno = 1:10)
(name = paste('S', 1:10, sep=''))
(age = round(rnorm(10, mean=25, sd=2), 1))
(gender = sample(c('M','F'),size=10, replace=T))
df2 = data.frame(rollno, name, age, gender)
df2
