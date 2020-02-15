install.packages("rpart")
library(rpart)

#read the credit scoring dataset
bank_data <- read.csv("C:\\Users\\User\\Desktop\\bank.csv",TRUE,";")

attach(bank_data)

#first 3000 samples are for training
training_set <- sample(1:nrow(bank_data),3000)
training_set

#let's construct the boosting algorithm with classification trees
model <- boosting(y~., data=bank_data, subset=training_set, mfinal=100, coeflearn="Breiman")

#check the model
summary(model)

#we can make predictions on the test dataset
prediction <- predict.boosting(model, newdata=bank_data[-training_set,])

#confusion matrix
prediction$confusion

#confusion error
prediction$error

#accuracy = 1 - error !!!
1-prediction$error
