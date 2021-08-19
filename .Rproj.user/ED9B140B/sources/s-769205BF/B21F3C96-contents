# Subsetting the data
# square bracket notation
df = matrix(1:12, nrow = 4, byrow = T)
df
df = matrix(1:12, nrow = 4, byrow = F)
df
# Return row 1
df[1, ]

# value of Rows 1:3 in column 2
df[1:3, 2]
df[,2]

# subset of a vector
x <- c(2.1, 4.2, 3.3, 5.4)
# extracting 3rd and 1st elements
x[c(3,1)]
# omit elements at the specified positions:
x[-c(3,1)] # remains 2nd and 4th

# Logical vectors select elements where the corresponding logical value is TRUE
x
x[c(T,T,F,F)]
x[x>3]
x[] # all will be accepted

# Name a vector
(y <- setNames(x, letters[1:4]))
(z <- setNames(x, c('ku','chi', 'fu', 'tora')))
w <- setNames(x, c('ku','chi', 'fu', 'tora'))
w
y[c('d','c','a')]

a <- matrix(1:9, nrow = 3)
colnames(a) <- c('A', 'B', 'C') # only columns have names
a

a[1:2,]
a[3,3]
# - refers to exclude
a[-2,-2]

# subset of data frame
df <- data.frame(x= 1:3, y= 3:1, z= letters[1:3])
df

df[df$x==2, ]
df[df$z=='c', ]

set.seed(1234)
x <- round(matrix(rnorm(30,1),ncol = 5),2)
y <- c(1,seq(5))
x
y
x <- cbind(x,y)
x
# converting x into a data frame called x.df
x.df <- data.frame(x)
x.df

# return matching rows
subset(x.df, y>2)
subset(x.df, y>2 & V1>0.2)

# mathcing on row and column
subset(x.df, y>2 & V2>0.4, select=c(V1,V4))

# Returns the position of "z" and "s" in the letters object
letters
which(letters=='z')
which(letters=='s')
which(letters=='A')

# data frame women
women
which(women$height==66)
which(women$height>=70)

# subset of vector
j = c(2,3,4,5,6,7,8,9,23,24,22,1,10)
j>6
which(j>6) # returns index
a = j[which(j>6)] # returns values
a

letters
LETTERS
which(LETTERS == 'K')

marks = c(10,30,40,60)
which(marks>30)
marks[which(marks>30)]

# grep
names = c('jack','jill','tom','jerry','buggs','bunny')
# which names have bu
grep('[bu]', names, ignore.case = T)
grep('[j]', names, ignore.case = T)
names[grep('[bu]',names, ignore.case = T)]

mtcars
which(mtcars$mpg > 25)
# column restriction stays empty to return all
mtcars[which(mtcars$mpg > 25),] 
