# Load and clean data
Rscript src/cleaning.R 'data/train.csv' 'data/titanic_data.csv'

# Exploratory data analysis
Rscript src/eda.R 'data/titanic_data.csv' 'results'

# 5-fold cross validation to 
python src/hyperparameter-tuning.py 'data/titanic_data.csv' 'data' 'results'

# Fit decision tree and generate plot of tree and feature importances
python src/fit-decision-tree.py 'data' 'results'

# Report
Rscript -e "rmarkdown::render('doc/report_titanic-predictors.Rmd')"

