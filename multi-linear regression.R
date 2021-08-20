
names(mtcars)
View(mtcars)

plot(mpg~hp, data=mtcars)
plot(mpg~wt, data=mtcars)
result <- lm(mpg~hp+wt, data=mtcars)
summary(result)
# R squared increases always when value are increasing

# 80% of data for model training + 20% of data for testing
trainingRowIndex <- sample(1:nrow(mtcars), 0.8*nrow(mtcars))
trainingData <- mtcars[trainingRowIndex,]
testData <- mtcars[-trainingRowIndex,]

# Build the model on training data
lmMod <- lm(mpg~
            # cyl 
            # + disp
            + hp
            + wt, data=trainingData)
# Review diagnostic measures
summary(lmMod)

# Prediction
testData$mpgPred <- predict(lmMod, testData)
testData

# MAPE (Mean Absolute Percentage Error)
# Lower its value is better accuracy
mape <- mean(abs((testData$mpgPred - testData$mpg))/testData$mpg)
mape

# check assumptions through diagnostic plots
plot(lmMod)
lmMod
