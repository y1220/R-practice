# Load rbokeh, gapminder and dplyr libraries
library(rbokeh)
library(gapminder)
library(dplyr)

# Explore gapminder dataset 
str(gapminder)

# Filter gapminder data by year 1982
dat_1982 <- gapminder %>% filter(year == 1982)

# Plot life expectancy Vs GDP per Capita using data_1982
figure(legend_location = "bottom_right",
       title = "Life Expectancy Vs. GDP per Capita in 1982") %>% 
  ly_points(x = gdpPercap, y = lifeExp, data = dat_1982,
            color = continent, hover = c(continent, country, pop))

