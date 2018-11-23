#! /usr/bin/env Rscript 
## some plots for EDA

library(tidyverse)
library(grid)

args = commandArgs(trailingOnly = TRUE)
input = args[1]
output = args[2]


main <- function(){
  
  require(tidyverse)
  require(grid)
  titanic_data <- read_csv(input)
  
  titanic_data <- titanic_data %>% 
    mutate(Sex = as.factor(Sex),
           Survived = as.factor(Survived),
           Embarked = as.factor(Embarked),
           Pclass = as.factor(Pclass)) 
  
  titanic_data <- titanic_data %>% 
    mutate(Survived = fct_recode(titanic_data$Survived,
                      "Survived" = "1",
                      "Did not Survive" = "0"),
           Sex = fct_recode(titanic_data$Sex,
                            "Female" = "0",
                            "Male" = "1"))
  
  boxplot_age <- titanic_data %>% 
    ggplot(aes(x = Survived, y = Age)) +
    geom_boxplot() +
    geom_jitter(alpha = 0.2) +
    ggtitle("Survival vs Age") +
    xlab(" ")
  
  boxplot_fare <- titanic_data %>% 
    ggplot(aes(x = Survived, y = Fare)) +
    geom_boxplot() +
    geom_jitter(alpha = 0.2) +
    ylim(0, 135) +
    ggtitle("Survival vs Fare") +
    xlab(" ")
  
  barplot_survival <- titanic_data %>% 
    ggplot(aes(x = Survived)) +
    geom_bar() +
    ggtitle("Survival")
  
  barplot_sex_survival <- titanic_data %>%
    ggplot(aes(x = Survived)) +
    geom_bar() +
    facet_wrap(~Sex) +
    ggtitle("Survival by Sex") +
    xlab(" ")
  
  barplot_class_survival <- titanic_data %>% 
    ggplot(aes(x = Survived)) +
    geom_bar() +
    facet_wrap(~Pclass) +
    ggtitle("Survival by Cabin Class") +
    xlab(" ")
  
  barplot_port_survival <- titanic_data %>% 
    mutate(Embarked = fct_recode(titanic_data$Embarked, 
                                 "Cherbourg" = "1",
                                 "Queenstown" = "2",
                                 "Southampton" = "3")) %>% 
    ggplot(aes(x = Survived)) +
    geom_bar() +
    facet_wrap(~Embarked) +
    ggtitle("Survival by Embarkation Port")+
    xlab(" ")
  

  ggsave("eda_boxplot-age-survival.png", plot = boxplot_age, device = "png",
         path = output)
  ggsave("eda_boxplot-fare-survival.png", plot = boxplot_fare, device = "png",
         path = output)
  ggsave("eda_barplot-survival.png", plot = barplot_survival, device = "png",
         path = output)
  ggsave("eda_barplot-sex-survival.png", plot = barplot_sex_survival, device = "png",
          path = output)
  ggsave("eda_barplot-class-survival.png", plot = barplot_class_survival, device = "png",
         path = output)
  ggsave("eda_barplot-port-survival.png", plot = barplot_port_survival, device = "png",
         path = output)

  
  }

main()
  

