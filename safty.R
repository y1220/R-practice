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

# Find accident rate for each year
hr_joined %>% 
  group_by(year) %>% 
  summarize(accident_rate = mean(had_accident))

# Test difference in accident rate between years
chisq.test(hr_joined$year, hr_joined$had_accident)

# Which location had the highest acccident rate?
hr_joined %>%
  group_by(location) %>%
  summarize(accident_rate = mean(had_accident)) %>%
  arrange(desc(accident_rate))

# Compare annual accident rates by location
accident_rates <- hr_joined %>% 
  group_by(location, year) %>% 
  summarize(accident_rate = mean(had_accident))

accident_rates

# Graph it
accident_rates %>% 
  ggplot(aes(factor(year), accident_rate)) +
  geom_col() +
  facet_wrap(~location)

# Answer the question
increased_most <- "West River"

# Filter out the other locations
westriver <- hr_joined %>% 
  filter(location == "West River")

# Find the average overtime hours worked by year
westriver %>%
  group_by(year) %>% 
  summarize(average_overtime_hours = mean(overtime_hours))

# Test difference in Southfield's overtime hours between years
t.test(overtime_hours ~ year, data = westriver) 

# Do the years have significantly different average overtime hours?  
significant <- TRUE

