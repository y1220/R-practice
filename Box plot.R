
names(mtcars)
boxplot(x=mtcars$mpg, col='green')

?abline # add straight lines to a plot
abline(h=mean(mtcars$mpg))
abline(h=quantile((mtcars$mpg)))

# direction of box plot 
boxplot(x=mtcars$mpg, col='green', horizontal=T)

# on formula
?InsectSprays
head(InsectSprays)
boxplot(count~spray, data=InsectSprays,col='lightgray')
# add notches
boxplot(count~spray,data=InsectSprays,notch=TRUE,col='blue')

head(mtcars %>% select(mpg, cyl))
boxplot(mpg~cyl,data=mtcars,
        xlab = 'Number of Cylinders',
        ylab = 'Miles per Gallon',
        notch = T,
        main = 'Mileage Data',
        col = c('green','yellow','purple'),
        names = c('High','Medium','Low'))


