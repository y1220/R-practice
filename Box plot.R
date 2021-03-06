
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

legend('topleft',c('Cars','Trucks','SUVs'),cex=1,
       bty='n',fill=heat.colors(3))

# histgrm
?hist

hist(rnorm(1000))
hist(rnorm(1000),probability=T)

hist(islands)
hist(islands,probability=T)

hist(islands,breaks=10,main='islands histogram',xlab='Area range',
     border='red',col='grey')

head(airquality$Temp)

hist(airquality$Temp,
     main='Temperature Histogram',
     xlab='Temperature', # add label
     ylab='Temperature Frequency',
     las=1,
     col=c('skyblue','chocolate2') # add colour
)

# remove all annotation
# labels put numbers on each bar
hist(airquality$Temp,
     axes=F, ann=F, labels=T,ylim=c(0,35),col=c('skyblue','chocolate2'))

# specify own annotation     
hist(airquality$Temp,
     main='Temperature Histogram',
     xlab='Temperature',
     ylab='Temperature Frequency',
     las=1,
     col=c('skyblue','chocolate2'),
     xlim=c(50,100),
     ylim=c(0,40),
     density=80)

# breaks
hist(airquality$Temp,
     main='Temperature Histogram',
     xlab='Temperature',
     ylab='Temperature Frequency',
     las=1,
     col=c('skyblue','chocolate2'),
     labels=T,
     breaks=20,
     ylim=c(0,25) 
     )

# changing frequency on y axis to density/probability values
# add a density line
hist(airquality$Temp,
     breaks=20,
     freq=F, #mens that probability =T
     main='Temperature Histogram',
     xlab='Temperature',
     ylab='Temperature Frequency',
     las=1,
     col=c('skyblue','chocolate2'),
     labels=T
     )
lines(density(airquality$Temp),lwd=4,col='red')

cars <- c(1,3,6,4,9)
pie(cars)

pie(cars,main='Cars',col=rainbow(length(cars)),
    labels=c('Mon','Tue','Wed','Thu','Fri'))

colors <- c('white','grey70','grey90','grey50','black')

car_labels <- round(cars/sum(cars)*100, 1) #deciaml place
car_labels

# concatenate %
car_labels <- paste(car_labels,'%',sep=' ')
car_labels

pie(cars,main='Cars',col=colors,labels=car_labels,cex=0.8)
legend('topright',c('Mon','Tue','Wed','Thu','Fri'),cex=0.8, fill=colors)

# 3D exploded pie chart
library(plotrix)
slices <- c(10,12,4,16,8)
lbls <- c('US','UK','Australia','Germany','France')
pie3D(slices,labels=lbls,explode=0.1,
      main='Pie Chart of Countries')
