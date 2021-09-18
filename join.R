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
hr_data <- read_excel("hr_data.xlsx", sheet = 1, col_names = TRUE, col_types = NULL, na = "", skip = 0)

# Examine the datasets
hr_data %>% summary()
performance_data %>% summary()

count(hr_data, department)

# Join the two tables
joined_data <- left_join(hr_data, performance_data, by = "employee_id")

# Examine the result
summary(joined_data)

# Check whether the average performance rating differs by gender 
joined_data %>%
  group_by(gender) %>%
  summarize(avg_rating = mean(rating))

# Add the high_performer column
performance <- joined_data %>%  
  mutate(high_performer = ifelse(rating >= 4, 1, 0))

# Test whether one gender is more likely to be a high performer
chisq.test(performance$gender, performance$high_performer)   

# Do the same test, and tidy the output
library(broom)
chisq.test(performance$gender, performance$high_performer) %>% 
  tidy()

# Is the test result significant?
significant <- TRUE

# Visualize the distribution of high_performer by gender
performance %>% 
  ggplot(aes(x = gender, fill = factor(high_performer))) +
  geom_bar(position = "fill")

# Visualize the distribution of all ratings by gender
performance %>% 
  ggplot(aes(x = gender, fill = factor(rating))) +
  geom_bar(position = "fill") 
