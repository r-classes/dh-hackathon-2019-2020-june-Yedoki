library(tidyverse)
eda <- read_csv('/Users/tonleon/Downloads/ingredients_from_eda.ru.csv')

setwd('/Users/tonleon/Documents/GitHub/recipesproject')

salaty <- eda%>%
  filter(type == 'salaty')%>%
  select(ingredient, name)%>%
  mutate(exist = as.integer(1))%>%
  group_by(name, ingredient)%>%
  distinct(ingredient)%>%
  mutate(exist = as.integer(1))%>%
  pivot_wider(names_from = ingredient, values_from = exist)

salaty[is.na(salaty)] <- 0

salaty %>%
  write_delim(path = './salaty.csv', delim = ',')


  