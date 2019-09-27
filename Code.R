# Tarea: Comentar el siguiente código.
## Describir brevemente lo que hace cada línea.
## Si no saben que hace una línea, pueden escribirme o googlear la función
## Recuerden hacer comentarios usando #

# Open library "tidyverse"
library("tidyverse")
library("readr")
library("ggplot2")

gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")

ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()