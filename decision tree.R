# Decision Tree
library(rpart)
library(rpart.plot)
pacman::p_load(rpart, rpart.plot, dplyr)

# classification tree
# created for categorical variable and results in qualitative response
str(mtcars)

head(mtcars)
df= mtcars
df$am= factor(df$am)
str(df)

# establish the relationship, classification tree
dt1 <- rpart(am ~ mpg, data= df, method= 'class')
dt1
rpart.plot(dt1)
rpart.plot(dt1, type=1, nn=T)
rpart.plot(dt1, type=2, extra=104, nn=T)

# see the values
df%>% select(mpg,am) %>% arrange(mpg)

rpart.rules(dt1, nn=T)
rpart.rules(dt1, cover=T, nn=T) # print %

# take only 3 rows for samples
(sample1 <- dplyr::sample_n(df,3))
# predict from decision tree
rpart.predict(dt1, newdata = sample1, rules=TRUE)
rpart.predict(dt1, newdata = sample1)

# new data
data(ptitanic)
head(ptitanic)

# predict survive or not
str(ptitanic)
names(ptitanic)
dim(ptitanic)
# . means everything
dt2 <- rpart(survived ~ . , data = ptitanic)
dt2

rpart.plot(dt2)
rpart.plot(dt2, cex= 0.8)

# divide into 2 parts(1 for training, another for testing)
library(caret)
# times == how many times we want to partition the data
trgIndex= createDataPartition(ptitanic$survived, p= .8, list= FALSE, times= 1)
trgSet= ptitanic[trgIndex, ]
testSet= ptitanic[-trgIndex, ]
dim(trgSet);dim(testSet) # total matching

dt3= rpart(survived ~ ., data= trgSet)
dt3
rpart.plot(dt3)
rpart.plot(dt3, type= 1, extra=104, nn= T, cex= .9)
rpart.plot(dt3, type= 2, extra=104, nn= T, cex= .9)

# prune tree basis of complexity parameter
# cp values reduces errors in prediction
printcp(dt3)

# select cp such that cross validation error(xerror) is least : cp=.01 for xerror=.515
# it may vary in some cases due randomness
dt3b <- prune(dt3, cp=.01)
dt3b
rpart.plot(dt3b, type=2, extra=104, nn= T, cex=.9)

# however we will select another value to show effect of cp
# taking cp randomly 
dt3c <- prune(dt3, cp=.018)
dt3c
rpart.plot(dt3c, type=2, extra=104, nn= T, cex=.8)

# prediction
head(testSet)
pred1= predict(dt3b, newdata= testSet, type= 'class') # qualitative response
head(pred1)
# response is in probability of death and survival
pred2= predict(dt3b, newdata= testSet, type= 'prob') 
head(pred2)
# confusion matrix to find accuracy
caret::confusionMatrix(testSet$survived, pred1)

# predict age based on other variables
dt4= rpart(age ~ ., data=ptitanic, method= "anova")
# anova is used for regression tree
dt4
dim(ptitanic)
rpart.plot(dt4, nn=T, cex= .8)
rpart.rules(dt4, cover=T, nn= T)

sample2= sample_frac(ptitanic, size= .1) # 1% will be saved
head(sample2)
dim(sample2)
predAge <- predict(dt4, newdata= sample2, type= 'vector')
head(predAge)
predict(dt4, newdata= sample2)
# combine the values
sample2= cbind(sample2, predAge)
head(sample2)

caret::RMSE(sample2$age, predAge, na.rm= T)
