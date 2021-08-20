
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
