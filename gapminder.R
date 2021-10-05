# Load the gapminder package
library(gapminder)

# Load the dplyr package
library(dplyr)

# Look at the gapminder dataset
gapminder

# Filter the gapminder dataset for the year 1957
gapminder %>% filter(year == 1957)

# Filter for China in 2002
gapminder %>% filter(country == "China", year == 2002)

# Sort in ascending order of lifeExp
gapminder %>% arrange(lifeExp)


# Sort in descending order of lifeExp
gapminder %>% arrange(desc(lifeExp))

# Filter for the year 1957, then arrange in descending order of population
gapminder %>% filter(year == 1957) %>% arrange(desc(pop))

# Use mutate to change lifeExp to be in months
gapminder %>% mutate(lifeExp= 12*lifeExp)

# Use mutate to create a new column called lifeExpMonths
gapminder %>% mutate(lifeExpMonths= 12*lifeExp)

# Filter, mutate, and arrange the gapminder dataset
gapminder %>%
  filter(year == 2007) %>%
  mutate(lifeExpMonths = 12 * lifeExp) %>%
  arrange(desc(lifeExpMonths))


library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
ggplot(gapminder_1952, aes(x= pop, y= lifeExp)) + geom_point()


# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point() +
  scale_x_log10() + scale_y_log10()

# Scatter plot comparing pop and lifeExp, with color representing continent
ggplot(gapminder_1952, aes(x= pop, y= lifeExp, color= continent)) + 
  geom_point() +
  scale_x_log10()

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) +
  geom_point() +
  scale_x_log10()

# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, siz = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ year)

# Filter for 1957 then summarize the median life expectancy
gapminder %>%
  filter(year== 1957) %>%
  summarize(medianLifeExp= median(lifeExp))

# Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita

gapminder %>%
  filter(year== 1957) %>%
  summarize(medianLifeExp= median(lifeExp), maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(year, continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))