
X1 = 1:10
Y1 = X1^2
X1
Y1
plot(x=X1, y=Y1)

# try several linetype
plot(x=X1, y=Y1, type='p')
plot(x=X1, y=Y1, type='l')
plot(x=X1, y=Y1, type='b')

# lwd = line width
plot(x=X1, y=Y1, type='b', lwd=1, col='red', cex=1)
plot(x=X1, y=Y1, type='b', lwd=2, col='blue', cex=1.5)
plot(x=X1, y=Y1, type='b', lwd=3, col='purple', cex=2)

# change the limits of x and y axis
plot(x=X1, y=Y1, xlim=c(0,20), ylim=c(0,100),type='b',cex=1,col='blue')

# use mtcars
# pch can be from 1 to 25, different point shape
plot(mtcars$wt, mtcars$mpg, col='blue', pch=3,cex=1.5)
# labeling
plot(mtcars$wt, mtcars$mpg, col='blue', pch=20,cex=1.5, xlab='Weight', ylab='Mileage'
     ,main='Weight vs Mileage')

table(mtcars$gear)
table(mtcars$cyl)
# dynamical colour and shape
plot(x=mtcars$wt,y=mtcars$mpg,col=mtcars$cyl,pch=mtcars$gear,cex=1,xlab='Weight', ylab='Mileage'
     ,main='Weight vs Mileage')

# regression line (y~x)
abline(lm(mtcars$mpg~mtcars$wt), col='red')

# count how many types exist
lapply(mtcars[,c('cyl','gear','am')],table)

plot(x=mtcars$wt,y=mtcars$mpg,col=c(1,2,3),pch=c(20,21,22),cex=c(1,2),xlab='Weight', ylab='Mileage'
     ,main='Weight vs Mileage')

?legend
legend('topright',legend=c('Cyl-4','Cyl-6','Cyl-8'),pch=10,col=1:3,title='Cylinder',cex=0.75)
legend('bottomleft',inset=.02, legend=c('Gear-3','Gear-4','Gear-5'),pch=20:23
       ,title='Gear')
legend('top',legend=c('Auto','Manual'),pch=c(20,21),pt.cex=c(1,1,5),title='Tx Type' )

# Pair plot
my_cols <- c('#00AFBB','#E7B800','#FC4E07')
pairs(mtcars,pch=19,cex=0.5,col=my_cols[mtcars$carb],lower.panel=NULL)
