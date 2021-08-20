
# y= ax + b
# b is called intercept
str(women)
dim(women)

plot(women$height, women$weight)
lmodel = lm(weight~height, data=women)
lmodel
summary(lmodel)
