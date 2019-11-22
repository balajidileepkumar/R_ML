#Step 1: PreProcessing
#1.1 Load iris dataset
#
#The iris data was used for this an

iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)

# Attach iris data set to environment
data(iris)

#Rename data set
dataset<-iris

#dataset
#1.2 Load Caret Package

#The caret package in R was utlizied to build the models. This package provides a consistent interface into hundreds of machine learning algorithms and provides useful convenience methods for data visualization, data resampling, model tuning and model comparison, among other features. It’s a must have tool for machine learning projects in R.

# Load package
#install.packages("caret")
library(caret)
#library(survival)
#Step 2: Create Validation Set
#I split the loaded iris dataset into two parts:
# - 80% used to train the models
# - 20% held back as a validation dataset


# Create a list of 80% of the rows in the original dataset we can use for training
validation_index<-createDataPartition(dataset$Species, p =0.80, list = FALSE)
validation_index
# Select 20% of the data for validation
validation<-dataset[-validation_index, ]
validation
# Use the remaining 80% of data to train and test the models
dataset<-dataset[validation_index, ]

#Step 3: Summarize Dataset
# Dataset dimensions
dim(dataset)

# List types for each attribute
sapply(dataset,class)


head(dataset)
print(head(dataset))
tail(dataset)

levels(dataset$Species)


percentage<-prop.table(table(dataset$Species)) * 100
cbind(freq = table(dataset$Species), percentage = percentage)


summary(dataset)

#Step 4: Visualize Dataset


# Split input and output
x<-dataset[,1:4]
y<-dataset[ ,5]

x
y
# Boxplot for each attribute on one image
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}

# Barplot of class breakdown
library(dplyr)
library(ggplot2)

dataset %>% ggplot(aes(x= y)) + geom_bar() +labs(x = "Iris Flower Species")

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

# Box and whisker plots for each attribute
featurePlot(x = x, y = y, plot = "box")


############################################################################
# Step 1: Build Logit Model on Training Dataset
#logitMod <- glm(Y ~ X1 + X2, family="binomial", data = trainingData)
# Step 2: Predict Y on Test Dataset
#predictedY <- predict(logitMod, testData, type="response")

# Linear Discriminant Analysis (LDA)

set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
############################################################################
#Classification and Regression Trees (CART)
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
model <- glm(data ~.,family=binomial(link='logit'),data=train)
############################################################################
# k-Nearest Neighbors (kNN)
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
############################################################################
# Support Vector Machines (SVM)
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
############################################################################
# Random Forest (RF)
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)
###########################################################################

#5.3 Select Best Model
results <- resamples(list(lda=fit.lda,cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)
###########################################################################

dotplot(results)
###########################################################################
print(fit.lda)
###########################################################################
#Making Predictions
###########################################################################
predictions<-predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)
