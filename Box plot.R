
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

cars <- c(1,3,6,4,9)
trucks <- c(2,5,4,5,12)
suvs = c(4,4,6,6,16)
autos_data = data.frame(cars,trucks,suvs)
autos_data
barplot(autos_data$cars, main='Auto Data',xlab='Days',
        ylab='Total',names.arg=c('Mon','Tue','Wed','Thu','Fri'),
        border='blue', density=c(10,20,30,40,50))

# plot each 3 data separately
?as.matrix # attempts to turn its argument into a matrix.
barplot(as.matrix(autos_data),main='Autos',ylab='Total',
        col=rainbow(5))
barplot(as.matrix(autos_data),main='Autos',ylab='Total',
        beside=T,col=rainbow(5))

legend('topleft',c('Mon','Tue','Wed','Thu','Fri'),cex=1,
       bty='n',fill=rainbow(5))

# t: transpose
# bty: box type
autos_data
t(autos_data)
barplot(t(autos_data),main='Autos',ylab='Total',
        col=heat.colors(3),space=0.1,cex.axis=0.8,las=1,
        names.arg=c('Mon','Tue','Wed','Thu','Fri'),cex=0.8)
barplot(as.matrix(t(autos_data)),main='Autos',ylab='Total',
        col=heat.colors(3),space=0.1,cex.axis=0.8,las=1,
        names.arg=c('Mon','Tue','Wed','Thu','Fri'),cex=0.8,beside=T) # Not the one I want...

