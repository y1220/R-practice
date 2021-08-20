
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

# BAR PLOT
barplot(mtcars$cyl) #wrong
barplot(table(mtcars$cyl))

# fill colour, col will put a color only on the border
ggplot(data=mtcars, aes(x=cyl)) + geom_bar()
ggplot(data=mtcars, aes(x=cyl)) + geom_bar(fill='red')
ggplot(data=mtcars, aes(x=cyl)) + geom_bar(col='red')
ggplot(data=mtcars, aes(x=cyl)) + geom_bar(aes(fill=factor(cyl))) + coord_flip()
ggplot(data=mtcars, aes(x=cyl)) + geom_bar(aes(col=factor(cyl)))

# count sum of each cylinders
# . means everything we specified previously
mtcars %>% group_by(cyl) %>% summarise(n=n()) %>%
  ggplot(., aes(x=cyl, y=n)) +
  geom_bar(stat='identity',aes(fill=factor(cyl))) +
  geom_text(aes(label=n))

# add facet layer, graph is equally divided
mtcars %>% group_by(cyl,gear,am) %>% summarise(n=n()) %>%
  ggplot(., aes(x=cyl, y=n)) +
  geom_bar(stat='identity',aes(fill=factor(cyl))) +
  geom_text(aes(label=n)) + facet_grid(gear~am)

# utilize a space wisely
mtcars %>% group_by(cyl,gear,am) %>% summarise(n=n()) %>%
  ggplot(., aes(x=cyl, y=n)) +
  geom_bar(stat='identity',aes(fill=factor(cyl))) +
  geom_text(aes(label=n)) + 
  facet_grid(gear~am, scales='free', space='free')

# Heat map -> show the intensity of colours
a= mtcars %>% group_by(cyl,gear) %>% summarise(n=n())
a
ggplot(a, aes(x=factor(cyl), y=factor(gear), fill=n)) + geom_tile()
ggplot(a, aes(x=factor(cyl), y=factor(gear), fill=n)) + geom_tile() +
  geom_text(aes(label=n),size=6) 
ggplot(a, aes(x=factor(cyl), y=factor(gear), fill=n)) + geom_tile() +
  geom_text(aes(label=n),size=6) + scale_fill_gradient2()


