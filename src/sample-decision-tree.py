

# Importing the required packages 

import pandas as pd
import matplotlib.pyplot as plt
%matplotlib inline
import numpy as np
import seaborn as sns
from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn import tree 
import graphviz


# Loaded the training dataset 
titanic_data=pd.read_csv("..\\data\\train.csv")
titanic_data.columns.values
feature_cols=['Age','Fare','Pclass']

# fit model
titanic_model=DecisionTreeClassifier()
titanic_data_dropped=titanic_data.dropna(subset=['Age','Fare','Pclass','Survived'])
X=titanic_data_dropped.loc[:,feature_cols]
y=titanic_data_dropped['Survived'].dropna()
titanic_model.fit(X,y)
titanic_model.predict(X)
titanic_model.score(X,y)

titanic_data_test=pd.read_csv('..\\data\\test.csv')
titanic_data_test.head()


titanic_data_test_dropped=titanic_data_test.dropna(subset=['Age','Fare','Pclass'])
X_test=titanic_data_test_dropped.loc[:,feature_cols]
titanic_model.predict(X_test)
titanic_data_test_dropped['Survived']=titanic_model.predict(X_test)
titanic_data_test_dropped.head()
titanic_submission=titanic_data_test_dropped[['PassengerId','Survived']]
titanic_submission.to_csv('..\\data\\titanic_submission.csv')
feature_cols_3c=X.columns.values;
feature_cols_3c
