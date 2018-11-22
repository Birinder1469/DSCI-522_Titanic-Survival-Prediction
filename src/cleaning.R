library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# input_file <- read_csv("data/train.csv")
# output_file <- "data/titanic.csv"

# main function for cleaning titanic data
main <- function(){
  titanic_data <- input_file %>% 
    mutate(Embarked = as.factor(Embarked),
           Sex = as.factor(Sex)) %>% 
    mutate(Embarked = fct_recode(input_file$Embarked, 
                      "1" = "C",
                      "2" = "Q",
                      "3" = "S"),
           Sex = fct_recode(input_file$Sex,
                            "1" = "male",
                            "0" = "female")) %>% 
    filter(is.na(Embarked) == FALSE,
           is.na(Age) == FALSE,
           is.na(Pclass) == FALSE,
           is.na(Sex) == FALSE,
           is.na(SibSp) == FALSE,
           is.na(Parch) == FALSE,
           is.na(Survived) == FALSE)
  write_csv(titanic_data, output_file)
  }

main()
  
