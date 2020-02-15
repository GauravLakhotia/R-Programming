install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)

#read the challenger dataset
credit_risk_dataset <- read.csv("C:\\Users\\User\\Desktop\\credit_data.csv",TRUE,",")
credit_risk_dataset$default = as.factor(credit_risk_dataset$default)

levels(credit_risk_dataset$default)

head(credit_risk_dataset)

colnames(credit_risk_dataset) <- c("id","income","age","loan","LTI","default")

#we can reference the columncs without the $ operator
attach(credit_risk_dataset)

#define cross validation
train_control <- trainControl(method="cv", number=10)

#logistic regression model with 3 features (income, age, loan)
model <- train(default~income+age+loan,data=credit_risk_dataset, trControl=train_control, method="glm", family="binomial")

#we can check the beta parameters + p-values
summary(model)

#accuracy of the model
print(model)
