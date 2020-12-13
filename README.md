# FIFA21_Project
## Hofstra University Graduate Business Analytics and Data Mining Course Final Project Fall 2020
In this project, my goal is to showcase the Data Mining and Preprocessing techniques I have spent the last several months researching and practicing and put them to use. I use the FIFA 21 dataset which is found on [Kaggle](https://www.kaggle.com/ekrembayar/fifa-21-complete-player-dataset). My target variable in this project is 'Value', which is the monetary worth of a player. Predicting 'Value' can lead us further into more detailed player analysis that can potentially help us capitalize on stars, current or future.

# Python
In the IPYNB notebook, I've preprocessed the FIFA 21 data upon which I attempt to run a Linear Regression model and a Random Forest Regressor model to predict 'Value'. Before that, however, I run a Principal Component Analysis and K-Means Clustering. My Results are the following:
## PCA + Clustering Results
I projected the variables onto two PCA dimensions in an effort to visualize them on a 2D graph. Looking at the PCA graph, we can see that most of the variables cluster together. However, we can also see that there is a smaller cluster of variables that is out on its own.
I wanted to make sense of these clusters, so I performed K-Means clustering. The distortion score Elbow method showed me that I needed at least three clusters. In discerning these clusters, I found that they tend to form around the four general positions (GPOS, a variable I created in the dataset). However, since there are four general positions in soccer, I changed my value of K to 4 - one for each position, and the results I found were that most midfielders in the dataset are attacking oriented. I, of course, could have kept clustering all the way to K=24 to see if the clusters form around each of the 24 positions in the game, but I decided to dig into the four clusters first.
Looking at the neighboring 3 clusters and how they formed, I was intrigued in seeing that the area between the centroids was sort of a ‘middle ground’ between them. The features I fed into this model would tell me that well rounded players would reside close to the borders of the 3 clusters. I wanted a better to visualize this so I came up with Figure 11, A Venn diagram layover as well as a connection between the three centroids that forms a triangle connoting the general area where a players with those stats would be considered ‘well-rounded’ – that area is defined by the red circle in the middle that overlaps everything as a sort of ‘hot zone’ for that potential player. We can keep clustering to see which clusters form in that area.


## Model Results
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
## Model Results
__Neural Network:__
MAPE: __.5%__
Accuracy: __99.5%__

Figure 1
Distribution of non-normalized Value
 
Figure 2
Distribution of log-normalized Value
 
Figure 3
Percent of Missing Values per Column
 



Figure 4
Object Type Columns Before Transformation
 
Figure 5
Object Type Columns After Transformation
 
Figure 6
Description of Value and Wage After Transformation
 



Figure 7
Two PCA Dimensional Scatter Plot
 







Figure 8
Distortion Score Elbow for K-Means Clustering
 
Figure 9
Three Cluster K-Means
 
Figure 10
Four Cluster K-Means
 









Figure 11
Four Cluster Venn Diagram/Centroid Connection Diagram
 








Figure 12
Linear Model Predictions vs Actual
 










Figure 13
Random Forest Predictions vs Actual
 


