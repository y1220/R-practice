# Load the packages
#library(readr)
library(dplyr)
library(readxl)

# Import the data
#survey <- read_csv("survey_data.csv")
excel_sheets("survey_data.xlsx")
survey <- read_excel("survey_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

# Get an overview of the data
summary(survey)

# Examine the counts of the department variable
survey %>%
  count(department)

# Output the average engagement score for each department, sorted
survey %>%
  group_by(department) %>%
  summarise(avg_engagement= mean(engagement)) %>%
  arrange(avg_engagement)
