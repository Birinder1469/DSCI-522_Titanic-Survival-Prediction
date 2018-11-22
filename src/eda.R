## some plots for EDA

library(tidyverse)

titanic_data <- read_csv("data/train.csv")

fare_distribution <- titanic_data %>% 
  ggplot(aes(Fare)) +
  geom_histogram(bins = 20)

boxplot_survival_age <- titanic_data %>% 
  ggplot(aes(x = as.factor(Survived), y = Age)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.2)

barplot_survival <- titanic_data %>% 
  ggplot(aes(x = as.factor(Survived))) +
  geom_bar()

barplot_survival
  

