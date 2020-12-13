library(nnet)
library(readr)
library(neuralnet)

#Min Max Formula
source("http://blogs.fiveelementanalytics.com/RCode/min_max_normalization.R")

#Import Data
FIFATrain <- read.csv("~/FIFATrain.csv")

#Column Wise Minmax + lognorm of 'Value'
fifa<- as.data.frame(apply(FIFATrain[,-c(1,4)],2,min_max_normal))
fifa$Value = (log1p(FIFATrain$Value))


library(tidyverse)
library(keras)
library(tensorflow)
library("mlbench")
library("dplyr")
library("magrittr")

#Shuffle Data
set.seed(41)
rows <- sample(nrow(fifa))
fifa <- fifa[rows, ]

#Split Data
Finaldata = as.matrix(fifa)
dimnames(Finaldata) = NULL

ind = sample(2,nrow(Finaldata),replace = T,prob = c(0.77,0.33))
training = Finaldata[ind == 1, 1:31]
testing  = Finaldata[ind == 2, 1:31]

trainingtarget = Finaldata[ind == 1,32]
testingtarget  = Finaldata[ind == 2,32]


#This model gives 95.5% accuracy

#Define Keras Model
model = keras_model_sequential()
model %>% layer_dense(units = 128 ,activation = 'relu',input_shape = dim(training)[2])   %>% layer_dense(units=96,activation = 'relu') %>% layer_dense(units = 1)

#Compile 
model %>% compile(loss = 'mse',
                  optimizer = 'adam',
                  metrics = metric_mean_absolute_percentage_error)

#Fit Model
#mymodel = readRDS('~/PracProj/FIFA Projects/MYModel.rds')
early_stop <- callback_early_stopping(monitor = "val_loss", patience = 20)
mymodel = model %>% fit(training,
                        trainingtarget,
                        epochs = 1000,
                        batch_size = 32,
                        validation_split = 0.2
                        #,callbacks = list(early_stop)
)

#Evaluate 
model %>% evaluate(testing,testingtarget)

#load/save model
#model %>% save_model_tf("~/model/")
#model <- load_model_tf("~/model/")

#saveRDS(model,'Model.rds')
#model  <- readRDS('~/Model.rds')
c(loss, mape) %<-% (model %>% evaluate(testing , testingtarget, verbose = 0))

paste0("Mean absolute percent error on test set: ", sprintf("%.2f", mape ,'%'))
paste0("Mean squared error on test set: ", sprintf("%.14f", loss ,'%'))

#Predict
pred <- model %>% predict(testing)
#for EXPM1
#pred <- expm1(pred)
#testingtargetex <- expm1(testingtarget)

#Plot
plot(testingtarget,pred)
#plot(mymodel)

#Measures of Accuracy
mse=mean((testingtarget - pred)^2)
#MSE
sprintf('MSE:%s',mse)

#MAPE
mape <- as.data.frame(mean(abs((testingtarget - pred)/(testingtarget)))*100)
mape <- mape[!is.infinite(rowSums(mape)),]
sprintf('MAPE:%s',mape)
