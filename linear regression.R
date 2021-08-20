
# y= ax + b
# b is called intercept
str(women)
dim(women)

plot(women$height, women$weight)
lmodel = lm(weight~height, data=women)
lmodel
summary(lmodel)

# regression line
abline(lm(weight~height, data=women), col='red', lwd=1)

# predict the value of y(weight) with a new data set of x(height)
head(women)
range(women$weight)
range(women$height)
newdata= data.frame(height=c(50,75,80,85))
newdata
pred_weight= predict(lmodel, newdata)
pred_weight

# check assumption of the model by dignostic plotting
plot(lmodel)
