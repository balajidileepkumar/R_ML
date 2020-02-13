#########################################################
Mean
#########################################################
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
# Find Mean.
result.mean <- mean(x)
print(result.mean)
#########################################################
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
x
# Find the median.
median.result <- median(x)
print(median.result)
#########################################################
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,3,1,2,3,4,1,5,5,3,2,3)
unique(v)
#duplicated(v)
uniqv <- unique(v)
uniqv
matchvalue = match(v, uniqv)
matchvalue
tabulate(matchvalue)
result_max = which.max(tabulate(match(v, uniqv)))
# Calculate the mode using the user function.
result <- getmode(v)
print(result)

# Create the vector with characters.
charv <- c("o","it","the","it","it")

# Calculate the mode using the user function.
result <- getmode(charv)
print(result)
#########################################################
#Linear
#########################################################
#lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance 
#y = mx + c
#c -> intercept
#m -> slope/gradient

x1 <- c(151, 
        174, 138, 186, 128, 136, 179, 163, 152, 131)
y1 <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
# Apply the lm() function.
relation <- lm(y1~x1)
print(class(relation))
methods(class=class(relation))
methods(class = "lm")

summary(relation)
show(relation)
#anova(relation)
print(relation)
plot(relation)

#########################################################
#Multiple Linear Regression
#########################################################
mtcars

mtcars
input <- mtcars[,c("mpg","disp","hp","wt")]
input
print(head(input,20))
print(tail(input))


input <- mtcars[,c("mpg","disp","hp","wt")]

# Create the relationship model.
model <- lm(wt~disp+hp+mpg, data = input)
methods(class=class(model))
anova(model)
model1 <- lm(mpg~disp+hp+wt, data = input)
methods(class=class(model1))
#Check the models plot
plot(model1, type="b", main="multiple linear regression", sub="second", xlab="hp+wt+disp",ylab="mpg")
result = plot(model1)
# Show the model.
print(model)

# Get the Intercept and coefficients as vector elements.
cat("# # # # The Coefficient Values # # # ","\n")

a <- coef(model)[1]
print(a)

Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]

print(Xdisp)
print(Xhp)
print(Xwt)
#########################################################
#Logistic Regression
#########################################################
mtcars

input <- mtcars[,c("am","cyl","hp","wt")]

am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)

am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = gaussian)


#binomial(link = "logit")
#gaussian(link = "identity")
#Gamma(link = "inverse")
#inverse.gaussian(link = "1/mu^2")
#poisson(link = "log")
#quasi(link = "identity", variance = "constant")
#quasibinomial(link = "logit")
#quasipoisson(link = "log"

print(summary(am.data))
#In statistics, deviance is a goodness-of-fit statistic for a statistical model; it is often used for statistical hypothesis testing.

#The null deviance shows how well the response is predicted by the model with 
#nothing but an intercept.

#The residual deviance shows how well the response is predicted by the model when 
#the predictors are included.


#input
#xtest = input[0,5]
#xtest
#summary(logistic)
#Predict Output
show(am.data)


#########################################################
#Normal Distribution
#########################################################
# Create a sequence of numbers between -10 and 10 incrementing by 0.2.
x <- seq(-10,10,by = .2)
x
# Choose the mean as 2.5 and standard deviation as 2.
y <- pnorm(x, mean = 2.5, sd = 2)
y
# Give the chart file a name.
png(file = "pnorm.png")

# Plot the graph.
plot(x,y)

# Save the file.
dev.off()
#########################################################
#Normal Distribution
#########################################################
#dbinom(x, size, prob) probability density distribution at each point.
#pbinom(x, size, prob)  cumulative probability of an event. It is a single value representing the probability.
#qbinom(p, size, prob) function takes the probability value and gives a number whose cumulative value matches the probability value
#rbinom(n, size, prob) This function generates required number of random values of given probability from a given sample.

# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)

# Create the binomial distribution.
y <- dbinom(x,50,0.5)
y
# Give the chart file a name.
png(file = "dbinom.png")

# Plot the graph for this sample.
plot(x,y)

# Save the file.
dev.off()
#########################################################
x <- pbinom(26,51,0.5)
print(x)
plot(x)
plot(x,y)

#########################################################
x <- qbinom(0.125,100,1/2)
x
print(x)
plot(x)

#########################################################
x <- rbinom(8,150,.4)
print(x)
#########################################################
#Decision Tree
#########################################################
if (!"randomForest" %in% rownames(installed.packages())) {install.packages("randomForest")}
if (!"party" %in% rownames(installed.packages())) {install.packages("party")}

#install.packages("party")
#ctree(formula, data)
# Load the party package. It will automatically load other
# dependent packages.

library(party)
readingSkills
# Print some records from data set readingSkills.
print(head(readingSkills))
print(head(readingSkills,10))
print(tail(readingSkills,20))

# Load the party package. It will automatically load other
# dependent packages.
#library(party)

# Create the input data frame.
input.dat <- readingSkills[c(1:105),]
input.dat
# Give the chart file a name.
image_result = png(file = "decision_tree.png", height= 480, width=360)

# Create the tree.

output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score,
  data = input.dat)
# Plot the tree.
plot(output.tree)
show(output.tree)

airq <- subset(airquality, !is.na(Ozone))
airct <- ctree(Ozone ~ ., data = airq)
plot(airct)
# Create the tree.
output.tree1 <- ctree(
  nativeSpeaker ~ shoeSize + score,
  data = input.dat)

# Plot the tree.
plot(output.tree1)

# Create the tree.
output.tree2 <- ctree(
  nativeSpeaker ~  score,
  data = input.dat)
plot(output.tree2)

# Save the file.
dev.off()
#########################################################
#Random Forest
#########################################################
if (!"randomForest" %in% rownames(installed.packages())) {install.packages("randomForest")}
if (!"party" %in% rownames(installed.packages())) {install.packages("party")}
library(party)
library(randomForest)
# Create the forest.
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score, data = readingSkills)
# View the forest results.
print(output.forest)

# Importance of each predictor.
print(importance(fit,type = 2))
plot(output.forest)
#########################################################
#########################################################
if (!"e1071" %in% rownames(installed.packages())) {install.packages("e1071")}
installed.packages("e1071")
library("e1071")
head(iris,5)
tail(iris,5)

attach(iris)
x <- subset(iris, select=-Species)
x[0]
y <- iris$Species
a <- x[1,0:4]
a

a[1] <- 5.1
a[2] <- 5.1
a[3] <- 6.1
a[4] <- 6.1
#a[5]

y
if (!"e1071" %in% rownames(installed.packages())) {install.packages("e1071")}
installed.packages("e1071")

svm_model <- svm(Species ~ ., data=iris)
summary(svm_model)
plot(x,y)
#########################################################
svm_model1 <- svm(x,y)
summary(svm_model1)
pred <- predict(svm_model1,a)
pred
system.time(pred <- predict(svm_model1,x))
#########################################################
#if (!"rpart" %in% rownames(installed.packages())) {install.packages("rpart")}
#library(rpart)
#x <- cbind(x,y_train)
## Fitting model
#fit <-svm(iris$Species ~ ., data = iris)
#summary(fit)
#Predict Output

#########################################################
if (!"rpart" %in% rownames(installed.packages())) {install.packages("rpart")}
library(rpart)
x <- cbind(x_train,y_train)
# grow tree
fit <- rpart(y_train ~ ., data = x,method="class")
summary(fit)
#Predict Output
#predicted= predict(fit,x_test)

#########################################################
if (!"e1071" %in% rownames(installed.packages())) {install.packages("e1071")}
library(e1071)
library(datasets)
library(e1071)
library(rpart)
#UCI_data_URL <- getURL('https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data')
breast_cancer_data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"), header = FALSE)
#breast_cancer_data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"), header = TRUE)
breast_cancer <- as.matrix(breast_cancer_data )
breast_cancer
model <- naiveBayes(class ~ ., data = breast_cancer)
model <- naiveBayes()
class(model)
summary(model)
print(model)
##################################################################################################################
#boston house pricing
#https://archive.ics.uci.edu/ml/machine-learning-databases/housing/
if (!"e1071" %in% rownames(installed.packages())) {install.packages("e1071")}
library(e1071)
library(datasets)
library(e1071)
library(rpart)
library(MASS) 
Boston
typeof(Boston)
Boston_matrix = as.matrix(Boston)
naive_model <- naiveBayes(medv ~ ptratio + age , data = Boston_matrix)
class(naive_model)
summary(naive_model)
print(naive_model)
#plot(naive_model)
methods(class=class(naive_model))
print(naive_model)

a <- Boston_matrix[1,c(7,11)]
typeof(a)
pred <- predict(naive_model,a)
#testdata = list(list(55,14),list(77,20))
#a[1]=55
#a[2]=14

##################################################################################################################
# Starting with Simple Learners

## Growing Greedy Classification Trees

weather <- expand.grid(Outlook = c("Sunny","Overcast","Rain"),
                       Temperature = c("Hot","Mild","Cool"), 
                       Humidity=c("High","Normal"),Wind=c("Weak","Strong"))
typeof(weather)
response <- c(1, 19, 4, 31, 16, 2, 11, 23, 35, 6, 24, 15, 18, 36)
play <- as.factor(c("No", "No", "No", "Yes", "Yes", "Yes", "Yes",
                    "Yes", "Yes", "Yes", "No", "Yes", "Yes", "No"))
tennis <- data.frame(weather[response,],play)
tennis
#################
if (!"rpart" %in% rownames(installed.packages())) {install.packages("rpart")}
library(rpart)
tennis_tree <- rpart(play ~ ., data=tennis, method="class", parms=list(split="information"), control=rpart.control(minsplit=1))

# Printing the rules behind the decision tree
print(tennis_tree)
plot(tennis_tree)
# Plotting the structure of the tree
if (!"rpart.plot" %in% rownames(installed.packages())) {install.packages("rpart.plot")}
library(rpart.plot)
prp(tennis_tree, type=0, extra=1, under=TRUE, compress=TRUE)
prp(tennis_tree, type=0, extra=2, under=TRUE, compress=TRUE)
prp(tennis_tree, type=0, extra=3, under=TRUE, compress=TRUE)

prp(tennis_tree, type=1, extra=1, under=TRUE, compress=TRUE)
prp(tennis_tree, type=2, extra=2, under=TRUE, compress=TRUE)
prp(tennis_tree, type=3, extra=1, under=TRUE, compress=TRUE)
prp(tennis_tree, type=4, extra=1, under=TRUE, compress=TRUE)

#########################################################################################
### Pruning Overgrown Trees
if (!"klaR" %in% rownames(installed.packages())) {install.packages("klaR")}
if (!"klaR" %in% rownames(installed.packages())) {install.packages("klaR")}

data(Titanic, package = "datasets")
dataset <- as.data.frame(Titanic)
dataset
library(rpart)
titanic_tree <- rpart(Survived ~ Class + Sex + Age, data=dataset, weights=Freq,
                      method="class", parms=list(split="information"), control=rpart.control(minsplit=5))

prp(titanic_tree, type=0, extra=1, under=TRUE, compress=TRUE)
prp(titanic_tree, type=0, extra=2, under=TRUE, compress=TRUE)
prp(titanic_tree, type=0, extra=3, under=TRUE, compress=TRUE)

# Prints a table on frequency of survival
print(aggregate(Freq ~ Survived, data = dataset, sum))
# Prints a table on frequency of survival
print(aggregate(Freq ~ Age , data = dataset, sum))
print(aggregate(Freq ~ Sex + Age , data = dataset, sum))

# First we print the unpruned solution
library(rpart.plot)
prp(titanic_tree, type=0, extra=1, under=TRUE, compress=TRUE)

# Pruning the tree and representing it
pruned_titanic_tree <- prune(titanic_tree, cp=0.02)
pruned_titanic_tree <- prune(titanic_tree, cp=0.03)
pruned_titanic_tree <- prune(titanic_tree, cp=0.04)
pruned_titanic_tree <- prune(titanic_tree, cp=1)
pruned_titanic_tree <- prune(titanic_tree, cp=0.3)
prp(pruned_titanic_tree, type=0, extra=1, under=TRUE, compress=TRUE)

## Taking a Probabilistic Turn
#########################################################################################
### Estimating response with Naïve Bayes

if (!"klaR" %in% rownames(installed.packages())) {install.packages("klaR")}
if (!"kernlab" %in% rownames(installed.packages())) {install.packages("kernlab")}
if (!"e1071" %in% rownames(installed.packages())) {install.packages("e1071")}
library(klaR)
library(kernlab)
data(spam)
tail(spam,10)
head(spam)
head(spam,50)

data(spam, package = "kernlab")
data(spam, package = "kernlab")
print(spam[1,]) # prints an example
print(spam)
# set up a training sample
set.seed(1234)
train_idx <- sample(1:nrow(spam), ceiling(nrow(spam)*3/4), replace=FALSE)
#train_idx <- sample(1:nrow(spam), size = ceiling(nrow(spam)*2/3), replace=FALSE)
train_idx <- sample(1:100, 10, replace=FALSE)

# We apply NB classifier
naive <- NaiveBayes(type ~ ., data=spam[train_idx,], prior = c(0.5,0.5), fL = 0.10)

# predict on holdout units
if (!"caret" %in% rownames(installed.packages())) {install.packages("caret")}
library(caret)
predictions <- predict(naive, spam[-train_idx,])
print(predictions)
head(predictions)
result = as.data.frame(predictions)
head(result,120)

#confusionMatrix(predictions$class, spam[-train_idx,"type"])
#heart_tidy
##################################################################################################################
#Linear Models
##################################################################################################################
if (!"glmnet" %in% rownames(installed.packages())) {install.packages("glmnet")}
if (!"MASS" %in% rownames(installed.packages())) {install.packages("glmnet")}
data(Boston, package="MASS")
library(glmnet)
ncol(Boston)
Boston[,1:ncol(Boston)-1]
Boston[,ncol(Boston)]
X <- as.matrix(scale(Boston[,1:ncol(Boston)-1]))
y <- as.numeric(Boston[,ncol(Boston)])
fit = glmnet(X, y, family="gaussian", alpha=1, standardize=FALSE)
plot(fit, xvar="lambda", label=TRUE, lwd=2)

cv <- cv.glmnet(X, y, family="gaussian", alpha=1, standardize=FALSE)
coef(cv, s="lambda.min")

##################################################################################################################
# Generate scaled 4*5 matrix with random std normal samples
set.seed(101)
mat <- scale(matrix(rnorm(20), 4, 5))
mat
dimnames(mat) <- list(paste("Sample", 1:4), paste("Var", 1:5))

# Perform PCA
#Principal Component Analysis 
#It is a decomposition technique, which is used to reduce the no of components
myPCA <- prcomp(mat, scale. = T, center = F)
myPCA$rotation # loadings
myPCA$x # scores
##################################################################################################################
#Singular Value Decomposition
#SVD is a decomposition technique, based on linear algebra
#It converts the data into three components U,s, Vh
#U -> Row information and contain the actual no of rows
#s or $d -> diagonal matrix 
#Vh is square matrix which contain the actual no of columns 
# Perform SVD
#https://stats.idre.ucla.edu/r/codefragments/svd_demos/
set.seed(101)
mat_1 <- matrix(rnorm(30), 6, 5)
mySVD <- svd(mat_1)
diag(sigma) <- mySVD$d 

D <- diag(mySVD$d)
dot.product(D,mySVD$u) 
mySVD$v 

mySVD # the diagonal of Sigma mySVD$d is given as a vector
sigma <- matrix(0,4,4) # we have 4 PCs, no need for a 5th column
diag(sigma) <- mySVD$d # sigma is now our true sigma matrix
D <- diag(mySVD$d)
###############################

mat <- scale(matrix(rnorm(20), 4, 5))

mat
dimnames(mat) <- list(paste("Sample", 1:4), paste("Var", 1:5))
mySVD <- svd(mat)

mySVD # the diagonal of Sigma mySVD$d is given as a vector
sigma <- matrix(0,4,4) # we have 4 PCs, no need for a 5th column
diag(sigma) <- mySVD$d # sigma is now our true sigma matrix
##################################################################################################################
wine <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep=",")
# Name the variables
colnames(wine) <- c("Cvs","Alcohol","Malic acid","Ash","Alcalinity of ash", "Magnesium", "Total phenols", "Flavanoids", "Nonflavanoid phenols", "Proanthocyanins", "Color intensity", "Hue", "OD280/OD315 of diluted wines", "Proline")
head(wine)
tail(wine)
# The first column corresponds to the classes
wineClasses <- factor(wine$Cvs)

# Use pairs
pairs(wine[,-1], col = wineClasses, upper.panel = NULL, pch = 16, cex = 0.5)
legend("topright", bty = "n", legend = c("Cv1","Cv2","Cv3"), pch = 16, col = c("black","red","green"),xpd = T, cex = 2, y.intersp = 0.5)

dev.off() # clear the format from the previous plot
winePCA <- prcomp(scale(wine[,-1]))
plot(winePCA$x[,1:2], col = wineClasses)
wineOutlier <- wine
wineOutlier[10,] <- wineOutlier[10,]*10 # change the 10th obs. into an extreme one by multiplying its profile by 10
outlierPCA <- prcomp(scale(wineOutlier[,-1]))
plot(outlierPCA$x[,1:2], col = wineClasses)
######################################################### 
#ChiSquare Test - Test of Independence
#A chi-squared test, also written as χ² test, is any statistical hypothesis test where
#the sampling distribution of the test statistic is a chi-squared distribution when the
#null hypothesis is true
  #Chi-square test examines whether rows and columns of a contingency table are statistically significantly associated.
    #Null hypothesis (H0): the row and the column variables of the contingency
    #                       table are independent.
    #Alternative hypothesis (H1):row and column variables are dependent
#########################################################
#Drug Response
#Drug Response data
df <- read.csv("https://goo.gl/j6lRXD")
head(df,5)
#table(df)
table(df$treatment, df$improvement)
result <- chisq.test(df$treatment, df$improvement, correct=FALSE)
result
#########################################################
if (!"MASS" %in% rownames(installed.packages())) {install.packages("MASS")}
#Load the library.
library("MASS")
#print(str(Cars93))
#Cars93#########
Cars93# Create a data frame from the main data set.
head(Cars93)
car.data <- data.frame(Cars93$AirBags, Cars93$Type)
unique(Cars93$Type)
unique(Cars93$AirBags)
# Create a table with the needed variables.
car.data = table(Cars93$AirBags, Cars93$Type)
print(car.data)
iris
# Perform the Chi-Square test.
resultchi = chisq.test(car.data)
print(resultchi)
###############################################################
mtcars
table(mtcars$carb, mtcars$cyl, mtcars$hp)
result <- chisq.test(mtcars$hp, mtcars$gear, correct=FALSE)
result
summary(result)

result <- chisq.test(mtcars$carb, mtcars$cyl, correct=FALSE)
#We have a high chi-squared value and a p-value of less that 0.05 significance level.
#So we reject the null hypothesis and conclude that carb and cyl have a significant relationship.
#########################################################
#T-Test
#########################################################
#t-test: Comparing Group Means
###Performs one and two sample t-tests on vectors of data.#
#########################################################
data(iris)
if (!"gridExtra" %in% rownames(installed.packages())) {install.packages("gridExtra")}
library(ggplot2)        # plotting & data
library(dplyr)          # data manipulation
library(tidyr)          # data re-shaping
library(magrittr)       # pipe operator
library(gridExtra)      # provides side-by-side plotting
#t.test(x, y = NULL, alternative = c("two.sided", "less", "greater"), mu = 0,
#       paired = FALSE, var.equal = FALSE, conf.level = 0.95)
##########################################################
  #The one-sample t-test compares a sample’s mean with a known value, when the variance of the population is unknown.
  #Mean of College educated adults is less
##########################################################
if (!"gridExtra" %in% rownames(installed.packages())) {install.packages("gridExtra")}
head(midwest)
#x <- subset(iris, select=percollege)
head(midwest$percollege, 10)

summary(midwest$percollege)
p1 <- ggplot(midwest, aes(percollege)) + geom_histogram(fill = "white", color = "grey30")
p2 <- ggplot(midwest, aes(percollege)) +   geom_histogram(fill = "white", color = "grey30") +  scale_x_log10()
grid.arrange(p1, p2, nrow = 2)
plot(p1)
plot(p2)
t.test(midwest$percollege, mu = 32, alternative = "less")
t.test(log(midwest$percollege), mu = log(32), alternative = "less")
##########################################################
#Two Sample t test/ student test
##########################################################
library(magrittr)
library(dplyr)
#"%>%" <- function(x,f) do.call(f,list(x))
#http://www-eio.upc.edu/~pau/cms/rdata/doc/ggplot2/midwest.html
df = select(filter(midwest,state == "OH" | state == "MI"),state, percollege)
df1 = select(filter(midwest,state == "OH"),state, percollege)
df2 = select(filter(midwest, state == "MI"),state, percollege)
nrow(df1)

nrow(df2)
nrow(df)
#options(max.print=1000)
#?options
print(df1)
summary(df1)
summary(df2)
ggplot(df, aes(state, percollege)) + geom_boxplot()
result  = t.test(df1$percollege,df2$percollege)
result  = t.test(percollege ~ state, data = df)
#Cross Verify
mean(df1$percollege)
mean(df2$percollege)
summary(result)
##########################################################
head(mtcars)
t.test(mtcars$hp,mtcars$gear)
head(mtcars)
result = t.test(iris$Petal.Length,iris$Petal.Width)
summary(result)
##########################################################
#F-Test
#Analysis of Variance (ANOVA) is a commonly used statistical technique for investigating data
#by comparing the means of subsets of the data.
##########################################################
#The F-Statistic: Variation Between Sample Means / Variation Within the Samples.
plant.df = PlantGrowth
plant.df$group = factor(plant.df$group, labels = c("Control", "Treatment 1", "Treatment 2"))

require(ggplot2)

ggplot(plant.df, aes(x = group, y = weight)) +   geom_boxplot(fill = "grey70", colour = "blue") +   scale_x_discrete() + xlab("Treatment Group") +  ylab("Dried weight of plants") +geom_point() +  geom_smooth(method="lm")
ggplot(plant.df, aes(x = weight, y = group)) +  geom_point() +  geom_smooth(method="lm")

#Linear Regression
plant.mod1 = lm(weight ~ group, data = plant.df)
plot(plant.mod1)

summary(plant.mod1)
show(plant.mod1)
#methods(plant.mod1)

result = anova(plant.mod1)
library(stats)
residuals(plant.mod1)
fitted(plant.mod1)
#confint(plant.mod1)
##########################################################
attach(InsectSprays)
#spray
#count
a = data(InsectSprays)#Loads the available data
str(InsectSprays)#str structure of the dataset
average_insects_died_eachspray = tapply(InsectSprays$count, InsectSprays$spray, mean)
variance_insects_died = tapply(InsectSprays$count, InsectSprays$spray, var)
boxplot(InsectSprays$count ~ InsectSprays$spray)
#Test for Equal means
oneway.test(InsectSprays$count~InsectSprays$spray)
#means are independent/here the sprays are independent

aov.out = aov(count ~ spray, data=InsectSprays)

anova(lm(count ~ spray, data=InsectSprays))
aov.out
##########################################################
#Anova IRIs Single and Multiple
##########################################################
fit <- aov(iris$Petal.Width ~ iris$Petal.Length, data=iris)
plot(fit)
##########################################################
fit <- aov(iris$Petal.Width ~ iris$Petal.Length + iris$Sepal.Length, data=iris)
plot(fit)

##########################################################
#CLT
##########################################################
#The Central Limit Theorem is probably the most important theorem in statistics.
#The central limit theorem (CLT) states that given a sufficiently large sample size from a
#population with a finite level of variance, the mean of all samples from the same population 
#will be approximately equal to the mean of the original population.
#Furthermore, the CLT states that as you increase the number of samples and the sample size
#the better the distribution of all of the sample means will approximate a normal
#distribution (a “bell curve“) even if the original variables themselves are
#not normally distributed.
DieOutcome <- sample(1:6,1000, replace= TRUE)
hist(DieOutcome, col ="light blue")
abline(v=3.5, col = "red",lty=1)

x10 <- c()
k =10
for ( i in 1:k) {
  x10[i] = mean(sample(1:6,i, replace = TRUE))}
hist(x10, col ="pink", main="Sample size =10",xlab ="Outcome of die roll")
abline(v = mean(x10), col = "Red")
abline(v = 3.5, col = "blue")
##########################################################
myRandomVariables<-rbeta(1000,5,2)*10
n<-100
samplesize<-30
xbar <- rep(NA,n)
for  (i in 1:n){
  samplesize = samplesize + 30
  mysamp <- sample(myRandomVariables,size = samplesize,replace =TRUE)
  xbar[i] <- mean(mysamp)
}
hist(xbar[i], col ="pink", main="Sample size =30",xlab ="Outcome of randomsamples")
abline(v = mean(x10), col = "Red")
abline(v = 3.5, col = "blue")

##########################################################

