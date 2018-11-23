#! /usr/bin/env Rscript 
# Authors: Alden Chen, Birinder Singh
# Date: 2018/11/23
# This script takes in the train.csv data and does some
# cleaning It produces and saves a cleaned dataset to the
# data folder It takes two arguments: the input filepath and the outpu filepath
# usage: Rscript src/cleaning.R "data/train.csv" data/titanic_data.csv"


library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# input_file <- "data/train.csv"
# output_file <- "data/test.csv"

# main function for cleaning titanic data
main <- function(){
  require(tidyverse)
  titanic_data <- read_csv(input_file)
  titanic_data <- titanic_data %>% 
    mutate(Embarked = as.factor(Embarked),
           Sex = as.factor(Sex),
           Survived = as.factor(Survived)) %>% 
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

  
  write_csv(titanic_data, output_file)
  }

main()
  
