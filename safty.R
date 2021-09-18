# Load the packages
# library(readr)
library(dplyr)
library(readxl)
# Import the data 
# hr_data <- read_csv("hr_data_2.csv")
excel_sheets("hr_data_2.xlsx")
hr_data <- read_excel("hr_data_2.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

# accident_data <- read_csv("accident_data.csv")
excel_sheets("accident_data.xlsx")
accident_data <- read_excel("accident_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)


# Create hr_joined with left_join() and mutate()
hr_joined <- left_join(hr_data, accident_data, by = c("year", "employee_id")) %>% 
  mutate(had_accident = ifelse(is.na(accident_type),0,1)) 

hr_joined
