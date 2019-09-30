# Open library "tidyverse", "readr" and "ggplot2"
library("tidyverse")
library("readr")
library("ggplot2")

# Reads .csv file which has names of countries, continents, years, life expectancy throughout the years 1952,
# 1957, 1961, 1967, population and GDP per capita and saves it in "gap_5060"
# Readr reads rectangular data (csv)
gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

# Filters the data in gap_5060 and obtains the data corresponding to Canada, using the title "country" as reference
# for the column to be searched
gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

# ggplot initializes a ggplot object using the dataset gap_5060_CA, where the x axis will have the year, 
# the y axis will have the life expectancy and it will be plotted with a geometrical line
# the instruction "aes" describes how variables in the data are mapped aesthetically.
# aes(x,y) will list the names of the value pair.
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

# gap_5060 will be modified to add new variables and preserve existing ones. This will replace the specific
# data corresponding to Canada in the year 1957 for the life expectancy from 70.0 to 69.96
gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

# The new data for Canada is saved in gap_5060_CA
gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")

# The data for gap_5060_CA is plotted again, where the x axis corresponds to the year, and the y axis corresponds
# to the life expectancy. Note how the line goes from point to point on the graph. 
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

# gap_5060_NA will have data corresponding to North America, where it filters the data from the original
# gap_5060 by country: Canada, Mexico and the United States
gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

# the data will be plotted using the data in gap_5060_NA, but now plots a different color per country, meaning
# it will be divided depending on the country. The graph will be a line graph.
ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()