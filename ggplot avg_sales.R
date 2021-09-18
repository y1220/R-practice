# Load the ggplot2 package
library(dplyr)
library(ggplot2)

avg_sales <- data.frame(
  recruiting_source = c("Applied Online", "Campus", "Referral", "Search Firm", "NA"), 
  avg_sales_quota_pct=c(1.06, 0.908, 1.02, 0.887, 1.17)
)

# Plot the bar chart
ggplot(avg_sales, aes(x=recruiting_source,y=avg_sales_quota_pct)) +
  geom_col()

avg_attrition <- data.frame(
  recruiting_source = c("NA", "Applied Online", "Campus", "Referral", "Search Firm"), 
  attrition_rate=c(0.132, 0.246, 0.286, 0.333, 0.5)
)

# Plot the bar chart
ggplot(avg_attrition,aes(x=recruiting_source, y=attrition_rate)) +
  geom_col()

# Run the simple regression
model_simple <- lm(salary ~ new_hire, data = pay)

# Display the summary of model_simple (dplyr is needed for %>%)
model_simple %>% 
  summary()

# Display a tidy summary
library(broom)
model_simple %>% 
  tidy()

# Is new hire pay significantly higher in this model?
significant <- TRUE

# Run the multiple regression
model_multiple <- lm(salary ~ new_hire + job_level, data = pay)

# Display the summary of model_multiple
model_multiple %>% 
  summary()

# Display a tidy summary
model_multiple %>% 
  tidy()

# Is new hire pay significantly higher in this model?
significant <- FALSE