import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split

# load data
titanic_data = pd.read_csv("data/titanic_data.csv")

# Split data X and y
features = titanic_data[["Pclass", "Sex", "Age", "SibSp", "Parch",
                         "Fare", "Embarked", ]]
target = titanic_data[["Survived"]]

X = features.values
y = np.reshape(target.values, len(target.values), )

# Get training set and test set
X_train, X_test, y_train, y_test = train_test_split(X, y, 
                                                    test_size = 0.2,
                                                    random_state = 1)

# initialize array to store validation performance data
accuracy = []

# 5-fold cross validation
depths = range(1, 51)
for i in depths:
    tree = DecisionTreeClassifier(max_depth = i)
    tree.fit(X_train, y_train)
    accuracy.append(np.mean(cross_val_score(tree, X_train, y_train, cv = 5)))
    
# plot of validation performance
plt.plot(depths, accuracy)
plt.xlabel("Tree Depth")
plt.ylabel("Average Accuracy")
plt.title("Validation Performance")
plt.show
    

