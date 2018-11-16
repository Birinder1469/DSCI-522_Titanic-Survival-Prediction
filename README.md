# DSCI-522_Titanic_Tragedy

Team members :
Alden Chen (aldenchen)
Birinder Singh (birinder1469)  

## Analysis Question
Which was the strongest indicator/predictor of the survival of the passengers in the Titanic tragedy and will the passengers in the Test data set survive or not ?

## Data Overview:
We have the dataset from [Kaggle](https://www.kaggle.com/c/titanic) with the details of the passengers on Titanic when it crashed. We also have the output as to which of these passengers survived and who all did not.
There is another test data set in which we have all the details of another set of passengers without the information of if they survived or not.

Below is the detail of the variables in the training dataset :

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


## Workflow
Since this is a prediction problem we aim to use the Classification Decision Tree to train our model and see which variables were the strongest predictor of the survival of the passengers on the Titanic. We will also use the model we obtain on the Test data and check the accuracy.

## Deliverables :
We are aiming to provide the Decision tree from the Trained model and the results of the model tested on the Test data with the accuracy confirmed from Kaggle.
