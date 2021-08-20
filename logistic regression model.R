
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)
str(mydata)
summary(mydata)
sapply(mydata,sd)
# rank is categorial values, not integer data type
mydata$rank = as.factor(mydata$rank)
mydata$admit = as.factor(mydata$admit)
str(mydata)
dim(mydata)

# admission result
xtabs(~admit + rank, data= mydata)

mylogit = glm(admit~gre+gpa+rank, data=mydata, family='binomial')
summary(mylogit)

# divide the dataset into training and test for analysis
n= nrow(mydata)
sample= sample(1:n, size= round(0.7*n), replace = FALSE)
train= mydata[sample,]
test= mydata[-sample,]

# again build the logistic regression model
logR1= glm(admit~gre+gpa+rank, train, family='binomial')
logR1
summary(logR1)

# predict on test set
predicted= predict(logR1, newdata= test, type= 'response')
head(predicted)
predictV= factor(ifelse(predicted<0.5, 0, 1))
head(predictV)
test= cbind(test, predictV)
head(test)
str(test)
