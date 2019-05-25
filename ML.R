#1. Linear Regression
#It is used to estimate real values (cost of houses, number of calls, total sales etc
#.) based on continuous variable(s). Here, we establish relationship between
#independent and dependent variables by fitting a best line. This best fit line is
#known as regression line and represented by a linear equation Y= a *X + b.

#Load Train and Test datasets
#Identify feature and response variable(s) and values must be numeric and numpy arrays
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
x1 <- c(126, 119, 103, 127, 151)

x_train <- x
y_train <- y
x_test <- x1
x <- cbind(x_train,y_train)
# Train the model using the training sets and check score

linear <- lm(y_train ~  x)
summary(linear)
#Predict Output
predicted= predict(linear,x_test)
##################################################
#### Logistic Regression
x_train <- iris[0:100]
y_train <- iris[0:100]
x <- cbind(x_train,y_train)
# Train the model using the training sets and check score
logistic <- glm(y_train ~ ., data = x,family='binomial')
summary(logistic)
#Predict Output
predicted= predict(logistic,x_test)
glm(y_train~x_train)

#######################################################

library(rpart)
x <- cbind(x_train,y_train)
# grow tree
fit <- rpart(y_train ~ ., data = x,method="class")
summary(fit)
#Predict Output
predicted= predict(fit,x_test)


#######################################################
library(e1071)
x <- cbind(x_train,y_train)
# Fitting model
fit <-svm(y_train ~ ., data = x)
summary(fit)
#Predict Output
predicted= predict(fit,x_test)
##################################################





library(e1071)
x <- cbind(x_train,y_train)
# Fitting model
fit <-naiveBayes(y_train ~ ., data = x)
summary(fit)
#Predict Output
predicted= predict(fit,x_test)
##################################################

library(knn)
x <- cbind(x_train,y_train)
# Fitting model
fit <-knn(y_train ~ ., data = x,k=5)
summary(fit)
#Predict Output
predicted= predict(fit,x_test)
##################################################

library(randomForest)
x <- cbind(x_train,y_train)
# Fitting model
fit <- randomForest(Species ~ ., x,ntree=500)
summary(fit)
#Predict Output
predicted= predict(fit,x_test)
##################################################
library(stats)
pca <- princomp(train, cor = TRUE)
train_reduced  <- predict(pca,train)
test_reduced  <- predict(pca,test)
##################################################
library(cluster)
fit <- kmeans(X, 3) # 5 cluster solution
##################################################
library(caret)
x <- cbind(x_train,y_train)
# Fitting model
fitControl <- trainControl( method = "repeatedcv", number = 4, repeats = 4)
fit <- train(y ~ ., data = x, method = "gbm", trControl = fitControl,verbose = FALSE)
predicted= predict(fit,x_test,type= "prob")[,2]

############################################################
#Decision Tree#
###################
set.seed(678)
path <- 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <-read.csv(path)
head(titanic)
library(dplyr)
# Drop variables
clean_titanic <- titanic % > %
  select(-c(home.dest, cabin, name, X, ticket)) % > %
  #Convert to factor level
  mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')),
         survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) % > %
  na.omit()
glimpse(clean_titanic)
create_train_test(df, size = 0.8, train = TRUE)


create_train_test & lt;-
  function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample & lt; - 1: total_row
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
  }


data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)
