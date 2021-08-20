
library(ggplot2)
library(dplyr)
head(mtcars)

# basic scatter plot
plot(mtcars$wt, mtcars$mpg)

# create a base
ggplot(data=mtcars, aes(x=wt, y=mpg))
# add geometry to graph
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point()
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point(color='red',size=3,shape=20)

# check the number of categorial vlaues
table(mtcars$cyl)
table(mtcars$gear)
table(mtcars$carb)
table(mtcars$am)

# add differnt dimentions
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point(aes(color=factor(cyl)),
                                                   size=3, shape=20)
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point(aes(color=factor(cyl),
       size=factor(am)), shape=20)
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point(aes(color=factor(cyl),
       size=factor(am), shape=factor(gear)))
# add labels
ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point(aes(color=factor(cyl),
       size=factor(am), shape=factor(gear))) + labs(title='Adding dimensions to graph', subtitle='Scatter Plot',
       x='Weight', y='Mileage')

# add facet layer & add more dimensions to graph
ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
geom_point(aes(color=factor(cyl),
               size=factor(am), 
               shape=factor(gear))) + 
labs(title='Adding dimensions to graph', 
     subtitle='Scatter Plot', x='Weight', y='Mileage') + 
facet_grid(vs~carb)

ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
geom_point(aes(color=factor(cyl),
                size=factor(am), 
                shape=factor(gear))) + 
labs(title='Adding dimensions to graph', 
     subtitle='Scatter Plot', x='Weight', y='Mileage') + 
facet_grid(cyl + vs~carb)

# add name of the cars to points
ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
  geom_point(aes(color=factor(cyl),
                 size=factor(am), 
                 shape=factor(gear))) + 
  labs(title='Adding dimensions to graph', 
       subtitle='Scatter Plot', x='Weight', y='Mileage') + 
  facet_grid(cyl + vs~carb) +
  geom_text(aes(label=rownames(mtcars)),size=2.5)
# better version
library(ggrepel)
ggplot(data=mtcars, aes(x=wt, y=mpg)) + 
  geom_point(aes(color=factor(cyl),
                 size=factor(am), 
                 shape=factor(gear))) + 
  labs(title='Adding dimensions to graph', 
       subtitle='Scatter Plot', x='Weight', y='Mileage') + 
  facet_grid(cyl + vs~carb) +
  ggrepel::geom_text_repel(aes(label=rownames(mtcars)),size=2.5)





