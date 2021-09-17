# Load the packages
#library(readr)
library(dplyr)
library(readxl)
library(ggplot2)
library(tidyr)

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

# Create the disengaged variable and assign the result to survey
survey_disengaged <- survey %>% 
  mutate(disengaged = ifelse(engagement <= 2, 1, 0)) 

survey_disengaged

# Summarize the three variables by department
survey_summary <- survey_disengaged %>%
  group_by(department) %>%
  summarise(pct_disengaged= mean(disengaged),
            avg_salary= mean(salary),avg_vacation_taken= mean(vacation_days_taken))

survey_summary

# Gather data for plotting
survey_gathered <- survey_summary %>% 
  gather(key = "measure", value = "value",
         pct_disengaged, avg_salary, avg_vacation_taken)

# Create three bar charts
ggplot(survey_gathered, aes(measure, value, fill= department)) +
  geom_col(position= 'dodge') +
  facet_wrap(~ measure, scale="free")

# Add the in_sales variable
survey_sales <- survey_disengaged %>%
  mutate(in_sales = ifelse(department == "sales", "Sales", "Other"))

# Test the hypothesis using survey_sales
chisq.test(survey_sales$in_sales, survey_sales$disengaged)

# Is the result significant?(manually check p-value <0.05)
# 5e-1 in decimal form is 0.5 (means 5×10^-1 )
significant <- TRUE

# Test the hypothesis using the survey_sales data
t.test(vacation_days_taken ~ in_sales, data = survey_sales)

# Is the result significant?
significant <- TRUE

# Import the data
#pay <- read_csv("fair_pay_data.csv")
pay <- read_excel("survey_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

# Get an overview of the data
summary(pay)

# Perform the correct statistical test
t.test(salary ~ new_hire, data = pay)

# Do the same test, and tidy up the output
library(broom)
t.test(salary ~ new_hire, data = pay) %>%
  tidy()

# Is the result significant? (p-value > 0.05)
significant <- FALSE
