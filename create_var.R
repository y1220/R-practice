# x = 1
# c = 2

x = read.csv("test.csv", header = F)
x
str(x)
x
j = read.csv("test.csv", header = T)
j

# save as a vector
abc = "http://www.abc.net.au/local/data/public/stations/abc-local-radio.csv"

# read data from URL
radio = read.table(abc, header = TRUE, sep = ",", stringsAsFactors = FALSE)
View(radio)

# save a file as MS DOS
y = read.table("test.txt", header = TRUE)
y

# importing an excel file
# install.packages("xlsx")
# library(xlsx)
install.packages("openxlsx")
library(openxlsx)
# excel = read.xlsx("test1.xlsx", sheetIndex= 1)
excel = read.xlsx("test1.xlsx")
excel

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1TvzhYcH4DS1CDUtjpxOCGO_8WOd9TiKF/edit#gid=392566956"
abc = as.data.frame(gsheet2tbl(url))
abc

# generate a csv file
data()
?write.csv

write.csv(abc, file= "y")
abc
