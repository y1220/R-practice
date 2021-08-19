mean(mtcars$mpg)
median(mtcars$mpg)
var(mtcars$mpg) # variance = how far a data is
# check covariance by ?var
sd(mtcars$mpg) #standard deviation
range(mtcars$mpg) # returns min and max

# look data into 4 separated ranges
summary(mtcars$mpg)
quantile(mtcars$mpg, probs = seq(0,1,0.25))

# column and row sum, column and row means
df = data.frame(a=c(1,2,3,4,5,6,7), b=c(7,6,5,4,3,2,4))
df

colSums(df)
rowSums(df)

colMeans(df)
rowMeans(df)
