#! /usr/bin/env Rscript 
## some plots for EDA

library(tidyverse)

args = commandArgs()
input = args[1]

main <- function(){
  
  require(tidyverse)
  titanic_data <- read_csv("data/titanic_data.csv")
  
  boxplot_age <- titanic_data %>% 
    ggplot(aes(x = as.factor(Survived), y = Age)) +
    geom_boxplot() +
    geom_jitter(alpha = 0.2) 
  
  
  boxplot_fare <- titanic_data %>% 
    ggplot(aes(x = as.factor(Survived), y = Fare)) +
    geom_boxplot() +
    geom_jitter(alpha = 0.2)
  
  barplot_survival <- titanic_data %>% 
    ggplot(aes(x = as.factor(Survived))) +
    geom_bar()
  
  barplot_sex_survival <- titanic_data %>%
    ggplot(aes(x = as.factor(Survived))) +
    geom_bar() +
    facet_wrap(~Sex) +
    ggtitle("Survival by Sex, Female = 0, Male = 1")
  
  ggsave("eda_boxplot-age-survival.png", plot = boxplot_age, device = "png",
         path = "results/")
  ggsave("eda_boxplot-fare-survival.png", plot = boxplot_fare, device = "png",
         path = "results/")
  ggsave("eda_barplot-survival.png", plot = barplot_survival, device = "png",
         path = "results/")
  
  ggsave("eda_barplot-sex-survival.png", plot = barplot_sex_survival, device = "png",
          path = "results/")
  
  }

main()
  

