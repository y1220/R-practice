
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

# check the accuracy
library(caret)
confusionMatrix(test$admit, test$predictV)

# divide the dataset into training and test for analysis
n= nrow(mydata)
sample= sample(1:n, size= round(0.7*n), replace = FALSE)
train= mydata[sample,]
test2= mydata[-sample,]

# remove the least significant value(gpa)
logR2= glm(admit~gre+rank, train, family='binomial')
logR2
summary(logR2)

pred= predict(logR2, newdata= test2, type= 'response')
predict= factor(ifelse(pred<0.5, 0, 1))
test2= cbind(test2, predict)
head(test2)

confusionMatrix(test2$admit, test2$predict) #better

# show the result separately
# confusion matrix using table command
table(test2$admit, pred>0.5)

# check the accuracy of model using mean command
mean(test2$predict == test2$admit)

# New data prediction
range(mydata$gre) # check it to have idea which value to put
# put 700 which is between 220-800
df2= data.frame(gre=700, rank= factor(3))
df2
p= predict(logR2, newdata= df2)
p
p1= factor(ifelse(p<0.5, 0, 1))
p1
df.p= cbind(df2,p1)
df.p
