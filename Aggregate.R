
?aggregate

head(ChickWeight)

data = ChickWeight
# returns number of rows and columns
dim(data)

# mean weight depends on Diet (named as diet) 
aggregate(data$weight, by = list(diet= data$Diet), FUN = 'mean')

# mean weight depends on Diet & Time
aggregate(data$weight, by = list(time=data$Time, diet= data$Diet), mean)

# first 6 and last 6 data
head(aggregate(data$weight, by = list(time=data$Time, diet= data$Diet), mean))
tail(aggregate(data$weight, by = list(time=data$Time, diet= data$Diet), mean))

# find max
aggregate(data$weight, by = list(diet=data$Diet),max)
aggregate(data$weight, by = list(time=data$Time),max)

# use a package for excel 
library(xlsx)
# library(openxlsx)

ad= read.xlsx('Aggregation_data.xlsx', sheetName = 1)
ad

# mean salary based on shift
aggregate(ad$Salary, by = list(shift= ad$Shift),mean)

# mean salary based on role
aggregate(ad$Salary, by = list(role= ad$Role),mean)

# mean salary based on shift and role
aggregate(ad$Salary, by = list(shift= ad$Shift,role= ad$Role),mean)

mtcars
str(mtcars)

?table
table(mtcars$cyl)
table(mtcars$cyl, mtcars$gear)
# add indication (dimention name)
table(mtcars$cyl, mtcars$gear, dnn =c('cyl','gear') )

t1 = table(mtcars$cyl, mtcars$gear, dnn =c('cyl','gear') )
t1

# sum of all elements in a table
margin.table(t1)
margin.table(x=t1, margin=1) #row
margin.table(x=t1, margin=2) #column

# mean
addmargins(A=t1, margin=1) # sum is added
addmargins(A=t1, margin=2, mean) # mean is added
addmargins(A=t1, margin=c(1,2),sum)
addmargins(A=t1, margin=c(1,2),c(sum,mean))

# different functions in row and column
# (added sum,mean,length to row, sd,sum to column)
addmargins(A=t1, margin=c(1,2), list(list(sum,mean,length),list(sd,sum)))

# calculate probabilities
prop.table(t1)
1/32
8/32
prop.table(t1,margin=1) # row
1/11
8/11
2/7
prop.table(t1,2)
1/15





