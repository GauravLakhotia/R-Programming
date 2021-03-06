install.packages("randomForest")
library(randomForest)

#read the bank dataset
bank_data <- read.csv("C:\\Users\\User\\Desktop\\bank.csv",TRUE,";")

#attach the dataset
attach(bank_data)

#first few lines + number of samples
head(bank_data)
nrow(bank_data)

#first 3000 smaples are for training
training_set <- sample(1:nrow(bank_data),3000)
training_set

#let's construct the decision tree classifier
model <- randomForest(y~., bank_data, subset = training_set, ntree=700)

#check the model
summary(model)

#let's make predictions
predictions <- predict(model,bank_data[-training_set,], type="class")
predictions

#accuracy of the model
mean(bank_data[-training_set,17]==predictions)
