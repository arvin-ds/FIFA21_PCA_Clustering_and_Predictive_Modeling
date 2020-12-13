# FIFA21_Project
## Hofstra University Graduate Business Analytics and Data Mining Course Final Project Fall 2020
In this project, my goal is to showcase the Data Mining and Preprocessing methods I have spent the last few months learning and put them to use. I use the FIFA data on [Kaggle](https://www.kaggle.com/ekrembayar/fifa-21-complete-player-dataset).

# Python
In the IPYNB notebook, I've preprocessed the FIFA 21 data upon which I then attempt to run a Linear Regression model and a Random Forest Regressor model.
## Results
__Linear Regression:__
MAPE: __1.274%__ 
Train r2 Score: 96.791% 
Test r2 Score: 96.688 
Adjusted r2 Score: 97.494% 
RMSE: 3570337.072269582 
MAE: 716693.0674474129 
Cross Validation Score: 91.488% 

__Random Forest Regressor:__
MAPE: __0.61%__
Train r2 Score: 99%
Test r2 Score: 99%
Adjusted r2 Score: 99%
RMSE: 1021000.98
MAE: 268742.83
Cross Validation Score: 97.5%

# R
In the R code, I attempt to run a Sequential Neural Network model with the use of Keras/TensorFlow. The data I use for this is the (un-normalized) preprocessed data from the IPYNB file  - the only difference here is I handle the methodical data normalization in RStudio; It seemed more fitting to normalize the data column-wise for the Neural Network model.
## Results
__Neural Network:__
MAPE: __.5%__
Accuracy: __99.5%__
