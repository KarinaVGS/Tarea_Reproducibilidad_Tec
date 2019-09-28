# Tarea: Comentar el siguiente código.
## Describir brevemente lo que hace cada línea.
## Si no saben que hace una línea, pueden escribirme o googlear la función
## Recuerden hacer comentarios usando #

# Open library "tidyverse"
library("tidyverse")
library("readr")
library("ggplot2")

# Reads .csv file which has names of countries, continents, years, life expectancy throughout the years 1952,
# 1957, 1961, 1967, population and GDP per capita and saves it in "gap_5060"
# Readr reads rectangular data (csv)
gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

# Filters the data in gap_5060 and obtains the data corresponding to Canada
gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

# ggplot initializes a ggplot object using the dataset gap_5060_CA, where the x axis will have the year, 
# the y axis will have the life expectancy and it will be plotted with a geometrical line
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

ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()