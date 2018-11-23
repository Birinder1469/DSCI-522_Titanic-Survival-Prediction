# Predictors of Survival for Titanic Passengers

Team members:  
Alden Chen (aldenchen)  
Birinder Singh (birinder1469)    

## Analysis

The target variable for the analysis is Survived, a dummy variable that takes the value 0 if the passenger did not survive and
1 is he or she did survive. We have data on 712 passengers for these seven features :

|Feature	           |Description	                                    |
|--------------------|-------------------------------------------------|
|Passenger Class	   |First, Second or Third Class |
|Sex	               |Male or Female |    
|Age                 |Age of each passenger years	|
|Siblings/Spouses	   |Number of siblings and spouses aboard the Titanic |
|Parents/Children	   |Number of parents and children aboard the Titanic |
|Fare	               |The amount each passenger paid for a his or her ticket |

We carry out the Exploratory data analysis to visualize the dependence of different features on the chances of survival.
Cross validation level 5 is carried out to find the depth giving maximum accuracy for the test dataset.
Decision Tree classification using this depth is carried out and the
feature with maximum contribution to the survival is calculated.
From the analysis we conclude that the two best predictors of survival for Titanic passengers are sex and passenger class.

## Execution

The analysis contains 4 scripts which need to be run in the same order in run_all.sh script:

- cleaning.R
- eda.R
- hyperparameter-tuning.py
- fit-decision-tree.py

Flowchart with details of execution, inputs and outputs for each script:

![Execution workflow](doc/Execution_workflow.png)


## Package Dependencies
R version 3.5 or above and Python 3.0 is recommended to be used for running this analysis.

To run the analysis following packages need to be installed.
They have been preloaded in the scripts.

| R     | Python    |
| :------------- | :------------- |
| ggplot2       | pandas      |
| tidyverse       | numpy       |
| grid       | sklearn     |
| png       | argparse       |
| gridExtra       | graphviz       |
|       | matplotlib       |
|        | os       |
