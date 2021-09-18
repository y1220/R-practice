# Load the packages
library(dplyr)
# library(readr)
library(readxl)

# Import the data
# performance_data <- read_csv("performance_data.csv")
# hr_data <- read_csv("hr_data.csv")
# Import the data
#survey <- read_csv("survey_data.csv")
excel_sheets("performance_data.xlsx")
performance_data <- read_excel("performance_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

excel_sheets("hr_data.xlsx")
performance_data <- read_excel("hr_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

# Examine the datasets
hr_data %>% summary()
performance_data %>% summary()

# count(hr_data, department)