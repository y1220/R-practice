# dplyr

# give an instruction
vignette('dplyr')
library(dplyr)

df = mtcars
head(df)

# for calling a subset
factorcols = c('cyl','vs','am','gear','carb')

df[factorcols] = lapply(df[factorcols], factor, ordered=T)
df[factorcols] 
sapply(df,class)
str(df)

# count each
sapply(df[factorcols],table)

head(select(mtcars,mpg))
a = mtcars %>% select(mpg)
head(a)
b = mtcars %>% select(mpg, cyl, am)
head(b)

# rename(newname = oldname)
b = b %>% rename(MPG = mpg) 
head(b)
b = b %>% rename(CYL = cyl, AM = am) 
head(b)

# summarise
?summarise
df %>% summarise(Mmpg= mean(mpg))
df %>% summarise(disp= mean(disp), hp= mean(hp))
head(df)
df %>% group_by(am) %>% summarise(meanmpg= mean(mpg), n= n())
df %>% group_by(cyl) %>% summarise(meands = mean(disp), n= n())

# filter
filter(df,cyl==6)
df %>% filter(carb>4)
df %>% filter(mpg>mean(mpg))
df %>% filter(cyl==4, disp>90)

head(airquality)
head(airquality %>% filter(Temp>70 & Month>5))
head(airquality %>% filter(Temp>70, Month>5))

# mutate -> add new variables to the data
median(airquality$Temp)
# temperture in celsius = (32℉-32)* 5/9 = 0℃
head(mutate(airquality,TempInC =(Temp-32)*5/9))

head(df %>% arrange(desc(cyl)))
head(df %>% group_by(cyl) %>% arrange(desc(mpg)))
head(arrange(df,cyl,desc(disp)))
head(df %>% arrange(desc(wt)))
head(arrange(airquality, desc(Month), Day))
