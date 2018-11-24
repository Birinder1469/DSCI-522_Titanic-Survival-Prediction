# run_all.sh
# Authors: Alden Chen, Birinder Singh
# Date: 2018/11/23
# 
# This driver script executes the analysis of the titanic data to
# find the best predictors of survival. See the repord in the doc
# directory for details. This script takes no arguments
#
# Usage: bash run_all.sh


# Load and clean data
Rscript src/cleaning.R 'data/train.csv' 'data/titanic_data.csv'

# Exploratory data analysis
Rscript src/eda.R 'data/titanic_data.csv' 'results'

# 5-fold cross validation to
python src/hyperparameter-tuning.py 'data/titanic_data.csv' 'data' 'results'

# Fit decision tree and generate plot of tree and feature importances
python src/fit-decision-tree.py 'data' 'results'

# Write the report
Rscript -e "rmarkdown::render('doc/report_titanic-predictors.Rmd')"
