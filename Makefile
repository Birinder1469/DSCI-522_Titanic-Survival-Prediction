# Makefile
# Objective : This script is to carry out the Titanic Survival prediction analysis from beginning to end
# Team members :
# Alden Chen (aldenchen)
# Birinder Singh (birinder1469)

###########################
# Run all the analysis
###########################

# The Master step :
# The all command will carry out the entire analysis from
# - cleaning the data ,
# - EDA,
# - hyperparameter tuning
# - fitting the decision tree and finding the most important feature.

all : doc/report_titanic-predictors.pdf

#################################
# Steps involved in the analysis
#################################

# Step 1 : Takes in the train data csv, cleans it and outputs titanic_data.csv.
data/titanic_data.csv : data/train.csv src/cleaning.R
	Rscript src/cleaning.R data/train.csv data/titanic_data.csv

# Step 2: Carries out the Exploratory Data Analysis on the titanic_data.csv and outputs the EDA lots
results/eda_boxplot-age-survival.png results/eda_boxplot-fare-survival.png results/eda_barplot-survival.png results/eda_barplot-sex-survival.png results/eda_barplot-class-survival.png results/eda_barplot-port-survival.png : data/titanic_data.csv src/eda.R
	Rscript src/eda.R data/titanic_data.csv results/

# Step 3: Takes in the titanic_data.csv and carries out hyperparameter tuning to find the optimum depth of the tree with 5 fold cross validation
# Splits the data in Test and Train with (80:20 ratio)
data/X_test.txt data/X_train.txt data/y_test.txt data/y_train.txt results/validation_5-fold-performance-plot.png :  data/titanic_data.csv src/hyperparameter-tuning.py
	Python src/hyperparameter-tuning.py data/titanic_data.csv data/ results/

# Step 4: Takes in the Train and Test data and fits the decision tree with optimum tree depth obtained in step 3
# Obtains the most important features and computes the train test accuracy
results/plot_decision-tree.png results/plot_feature-importance.png :  data/X_train.txt data/y_train.txt data/X_test.txt data/y_test.txt src/fit-decision-tree.py
	Python src/fit-decision-tree.py data/ results/

# Step 5: Prepares the report of the above analysis as a pdf file.
doc/report_titanic-predictors.pdf : doc/report_titanic-predictors.Rmd results/eda_barplot-class-survival.png results/eda_barplot-sex-survival.png results/eda_barplot-port-survival.png results/eda_boxplot-age-survival.png results/eda_boxplot-fare-survival.png results/validation_5-fold-performance-plot.png results/plot_feature-importance.png
	Rscript -e "rmarkdown::render('doc/report_titanic-predictors.Rmd')"

###########################
# Remove all files
###########################

# Cleans all the results to bring the project to the scratch.
clean:
	rm -f data/titanic_data.csv
	rm -f results/eda_boxplot-age-survival.png results/eda_boxplot-fare-survival.png results/eda_barplot-survival.png results/eda_barplot-sex-survival.png results/eda_barplot-class-survival.png results/eda_barplot-port-survival.png
	rm -f data/X_test.txt data/X_train.txt data/y_test.txt data/y_train.txt results/validation_5-fold-performance-plot.png
	rm -f results/plot_decision-tree.png results/plot_feature-importance.png
	rm -f doc/report_titanic-predictors.pdf
	rm -f doc/report_titanic-prediction.tex
