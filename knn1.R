install.packages("caret")
install.packages("e1071")
install.packages("ggplot2")
library(caret)
library(ggplot2)
library(e1071)
library(class)

#read the iris dataset
iris_dataset <- read.csv("C:\\Users\\User\\Desktop\\iris_data.csv",TRUE,",")

#distribution of the output classes
table(iris_dataset$Class)

#statistics 
summary(iris_dataset[c("PetalLength","PetalWidth")])

#first few lines
head(iris_dataset)

#we can plot the dataset
ggplot(iris_dataset, aes(x = SepalWidth, y = PetalLength)) + geom_point(aes(color = Class))

#use classes A,B,C instead of the actual names
iris_dataset$Class <- factor(iris_dataset$Class, labels=c("A","B","C"))

#min-max normalization
normalize <- function(x) {return( (x-min(x)) / (max(x)-min(x)) )}

normalized_iris_dataset <- as.data.frame(lapply(iris_dataset[1:4], normalize))
normalized_iris_dataset

#split the datase: training + test set
training_dataset <- normalized_iris_dataset[1:120,]
test_dataset <- normalized_iris_dataset[121:150,]
#5th column is the output class A,B or C
training_labels <- iris_dataset[1:120,5]
test_labels <- iris_dataset[121:150,5]

#returns the predictions for the test dataset
predictions <- knn(train=training_dataset, test=test_dataset, cl=training_labels, k=10)
predictions
test_labels
#confusion matrix
table(predictions,test_labels)
#accuracy of the model
mean(test_labels==predictions)
