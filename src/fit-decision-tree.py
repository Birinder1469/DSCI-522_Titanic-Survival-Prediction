##! /usr/bin/env Rscript 
# Authors: Alden Chen, Birinder Singh
# Date: 2018/11/23
# This script takes in the training dataset and fits a depth 3 decision tree.
# It also computes the feature importance for the tree and produces a plot.
# A plot of the tree and a plot of the feature importances are saved 
# usage: python src/fit-decision-tree.py "data" "results"

# Import required libraries
import argparse
import numpy as np
from sklearn import tree
import graphviz
import matplotlib.pyplot as plt

# Parse Command line arguments
parser=argparse.ArgumentParser()
parser.add_argument('input_file_location')
parser.add_argument('output_file_location')
args=parser.parse_args()

# function to save a plot of decision tree
def save_and_show_decision_tree(model,
                                class_names=[0,1],
                                save_file_prefix = args.output_file_location + '/plot_decision-tree', **kwargs):

    features=["Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked" ]
    dot_data = tree.export_graphviz(model, out_file=None,
                                 feature_names=features,
                                 class_names=['Not Survived','Survived'],
                                 filled=True, rounded=True,
                                 special_characters=True, **kwargs)

    graph = graphviz.Source(dot_data)
    graph.format='png'
    graph.render(save_file_prefix)
    return graph

# define main function
def main():

    # load training and test data
    X_train = np.loadtxt(args.input_file_location + '/X_train.txt')
    y_train = np.loadtxt(args.input_file_location + '/y_train.txt')
    X_test = np.loadtxt(args.input_file_location + '/X_test.txt' )
    y_test = np.loadtxt(args.input_file_location + '/y_test.txt' )


    # initialize depth-3 decision tree
    model = tree.DecisionTreeClassifier(max_depth=3)
    model.fit(X_train, y_train)

    # save a plot of the decision tree
    save_and_show_decision_tree(model)

    # plot feature importances
    features=["Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked" ]
    plt.bar(features,model.feature_importances_);
    plt.xlabel('Feature names ')
    plt.title('Feature Importances')
    plt.ylabel('Feature importance')
    plt.savefig(args.output_file_location+'/plot_feature-importance.png')
    
    accuracy = model.score(X_test, y_test)
    print("Model Score:", accuracy)
    

if __name__ == "__main__":
    main()
