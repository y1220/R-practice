#(1) Find the average sales quota attainment for each recruiting source
avg_sales <-  
  recruitment %>% 
  group_by(recruiting_source) %>%
  summarize(avg_sales_quota_pct=mean(sales_quota_pct))

# Display the result
avg_sales

#(2) Find the average attrition for the sales team, by recruiting source, sorted from lowest attrition rate to highest
avg_attrition <- recruitment %>%
  group_by(recruiting_source) %>% 
  summarise(attrition_rate= mean(attrition)) %>% 
  arrange(attrition_rate)

# Display the result
avg_attrition