import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import argparse
import os

from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split


#parser = argparse.ArgumentParser()
#parser.add_argument('input_file')

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


    
#plot of validation performance
plt.plot(depths, accuracy)
plt.xlabel("Tree Depth")
plt.ylabel("Average Accuracy")
plt.title("Validation Performance")


# save testing and training data to data
np.savetxt("data/X_train.txt", X_train)
np.savetxt("data/X_test.txt", X_test)
np.savetxt("data/y_train.txt", y_train)
np.savetxt("data/y_test.txt", y_test)

# save plot of validation performance to results
plt.savefig("results/validation_5-fold-performance-plot.png", format = "png")
   
print("Best depth:", np.argmax(accuracy) + 1)

