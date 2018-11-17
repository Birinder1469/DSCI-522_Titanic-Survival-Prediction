# DSCI-522_Titanic_Tragedy

Team members :
Alden Chen (aldenchen)
Birinder Singh (birinder1469)  

##  Question
What are the two strongest predictors of survival for Titanic passengers? This is a predictive question. 

## Data Overview:
We have two datasets from [Kaggle](https://www.kaggle.com/c/titanic) with the details on the Titanic passengers and information on whether or not they survived. One is for training and the other is for testing. Below is a summary of the features in the dataset. The script for loading the data in the [src] (https://github.com/UBC-MDS/DSCI-522_Titanic-Survival-Prediction/blob/master/src/load-training-data.ipynb) directory. 

| Variable	|Definition	| Key|
|----|----|----|
|survival|	Survival|	0 = No, 1 = Yes|
|pclass	|Ticket class	|1 = 1st, 2 = 2nd, 3 = 3rd|
|sex	|Sex	| |
|Age|	Age in years	| |
|sibsp	|# of siblings / spouses aboard the Titanic	| |
|parch	|# of parents / children aboard the Titanic	| |
|ticket	|Ticket number	| |
|fare	|Passenger fare	| |
|cabin	|Cabin number	| |
|embarked	|Port of Embarkation|	C = Cherbourg, Q = Queenstown, S = Southampton|


## Analysis Plan  
Using the training data, we will generate a classification tree model to predict whether or not a titanic passenger survived the accident. We will then use the test data provided to test the model's accuracy and make adjustments to the model as needed. After finalizing our model, we will use the `feature_importances` field to determine the which features are the best predictors of survival.

## Deliverables  

To summarize our results, we will produce a bar plot with the features and their importance scores. We will also submit a plot of the classification tree and report the overall accuracy of our model. 
