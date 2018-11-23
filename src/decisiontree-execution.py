
# coding: utf-8

# In[1]:

import argparse
parser=argparse.ArgumentParser()
parser.add_argument('input_file_location')
parser.add_argument('output_file_location')
args=parser.parse_args()

import numpy as np
import pandas as pd
from sklearn import tree
import graphviz
import matplotlib.pyplot as plt



# In[3]:

def main():

    Xtrain=np.loadtxt(args.input_file_location+'/X_train.txt')
    ytrain=np.loadtxt(args.input_file_location+'/y_train.txt')
    Xtest=np.loadtxt(args.input_file_location+'/X_test.txt')
    ytest=np.loadtxt(args.input_file_location+'/y_test.txt')
    
    
    # In[4]:
    
    
    model=tree.DecisionTreeClassifier(max_depth=3)
    model.fit(Xtrain,ytrain)
    
    
    # In[5]:
    
    
    features=["Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked" ];
    def save_and_show_decision_tree(model, 
                                    class_names=[0,1], 
                                    save_file_prefix = args.output_file_location+'\DecisionTree', **kwargs):
        dot_data = tree.export_graphviz(model, out_file=None, 
                                 feature_names=features,  
                                 class_names=['Not Survived','Survived'],  
                                 filled=True, rounded=True,  
                                 special_characters=True, **kwargs)  
    
        graph = graphviz.Source(dot_data) 
        graph.render(save_file_prefix) 
        return graph
    
    
    # In[6]:
    
    
    graph = save_and_show_decision_tree(model)
    graph
    
    
    # In[7]:
    
    
    Importantfeature=features[np.argmax(model.feature_importances_)]
    Importantfeature
    
    
    # In[8]:
    
    
    plt.bar(features,model.feature_importances_);
    plt.xlabel('Feature names ')
    plt.title('Contribution of features to the Survival')
    plt.ylabel('Feature importance')
    plt.savefig(args.output_file_location+'/Feature_importance.png')
    
if __name__ == "__main__":
    main()