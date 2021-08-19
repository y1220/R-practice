
df <- data.frame(first = c(1:10), second = c(11:20))
df

# (margin = 2) is for columns
apply(df, 2, mean)
apply(df, 2, max)

# (margin = 1) is for rows
apply(df, 1, mean)

# sorting the data (cbind(first column,second column))
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
x

# indexing 
dimnames(x)[[1]] <- letters[1:8]
x

apply(x, MARGIN = 2, FUN = mean)
apply(x, 2, mean) # returns same result

col.sums <- apply(x,2,sum)
col.sums
row.sums <- apply(x,1,sum)
row.sums

apply(x, 2, sort)

# Lapply
# create a list of matrices
(A = matrix(1:9, nrow=3, byrow=F))
(B = matrix(4:15, nrow=4, byrow=F))
(C = data.frame(x=c(8,9,10),y=c(8,9,10)))
MyList <- list(A,B,C)
MyList

# Extract the second column from 'MyList' with the selection operator '['
lapply(MyList,'[',,2)
# Extract the first row 
lapply(MyList,'[',1,)
# Extract the position (1,2)
lapply(MyList,'[',1,2)

movies <- c('SPYDERMAN','BATMAN','VERTIGO','CHINATOWN')
movies_lower <- lapply(movies, tolower)
movies_lower

# sapply
A= lapply(MyList,'[',1,1)
A
Z= sapply(MyList,'[',1,1)
Z

?mtcars
?women
library(help='datasets')
names(mtcars)
AM1=mtcars[,'am']
AM1
# AM -> automatic
# CYL -> cylinder
AMCYL1=mtcars[,c('cyl','am')]
AMCYL1

MPG1=mtcars[,c('mpg')]
tapply(MPG1,AM1,mean)
tapply(MPG1,AMCYL1,mean)
?tapply
head(mtcars)

# rep : replicate values
z=sapply(MyList,'[',1,1)
z
a=rep(z,c(3,1,2))
a

# mapply
Q= matrix(c(rep(1,4),rep(2,4),rep(3,4),rep(4,4)),4,4)
Q
P= mapply(rep,1:4,4)
P

#(1+1+1), (2+2+2)...
mapply(sum,1:4,1:4,1:4)
