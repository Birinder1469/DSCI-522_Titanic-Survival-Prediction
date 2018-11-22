library(tidyverse)

titanic_data <- read_csv("data/train.csv")

# cleaning titanic data to get numerical variables for
# embarked and gender.
# drop cases where there is an na for a feature
titanic_data <- titanic_data %>% 
  mutate(Embarked = as.factor(Embarked),
         Sex = as.factor(Sex)) %>% 
  mutate(Embarked = fct_recode(titanic_data$Embarked, 
                    "1" = "C",
                    "2" = "Q",
                    "3" = "S"),
         Sex = fct_recode(titanic_data$Sex,
                          "1" = "male",
                          "0" = "female")) %>% 
  filter(is.na(Embarked) == FALSE,
         is.na(Age) == FALSE,
         is.na(Pclass) == FALSE,
         is.na(Sex) == FALSE,
         is.na(SibSp) == FALSE,
         is.na(Parch) == FALSE,
         is.na(Survived) == FALSE)


write_csv(titanic_data, "data/titanic_data.csv")

