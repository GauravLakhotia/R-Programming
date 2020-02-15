install.packages("caret")
install.packages("e1071")
install.packages("ggplot2")
library(caret)
library(e1071)
library(class)

#read the iris dataset
iris_dataset <- read.csv("C:\\Users\\User\\Desktop\\iris_data.csv",TRUE,",")

#let's shuffle the dataset
iris_dataset <- iris_dataset[sample.int(nrow(iris_dataset)),]
iris_dataset
#use classes A,B,C instead of the actual names
iris_dataset$Class <- factor(iris_dataset$Class, labels=c("A","B","C"))

#min-max normalization
normalize <- function(x) {return( (x-min(x)) / (max(x)-min(x)) )}
normalized_iris_dataset <- as.data.frame(lapply(iris_dataset[1:4], normalize))
normalized_iris_dataset
normalized_iris_dataset$Class <- iris_dataset$Class

training_dataset <- normalized_iris_dataset[1:100,]
test_dataset <- normalized_iris_dataset[101:150,]

model <- naiveBayes(Class ~ . , data=training_dataset)

predictions <- predict(model, test_dataset)
actual_labels <- test_dataset[,5]
#confusion matrix
table(predictions,actual_labels)
#accuracy of the model
mean(actual_labels==predictions)
