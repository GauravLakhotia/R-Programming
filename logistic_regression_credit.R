#read the challenger dataset
credit_risk_dataset <- read.csv("C:\\Users\\User\\Desktop\\credit_data.csv",TRUE,",")

head(credit_risk_dataset)
nrows(credit_risk_dataset)

colnames(credit_risk_dataset) <- c("id","income","age","loan","LTI","default")

#we can reference the columncs without the $ operator
attach(credit_risk_dataset)

#let's create a training and a test dataset 80%-20%
train_dataset <- id<1600
test_dataset <- !train_dataset

#logistic regression model with 3 features (income, age, loan)
model <- glm(formula=default~income+age+loan,data=credit_risk_dataset, subset=train_dataset, family="binomial")
summary(model)

#prediction with the model
probability_default <- predict(model, newdata=credit_risk_dataset[test_dataset,], type="response")

#logistic regression assigns a probability to every output class
#if this probability > 50% then it is 1 anyways it is 0 
probability_default
predictions <- ifelse(probability_default>0.5,1,0)

#confusion matrix
table(default[test_dataset],predictions)
#accuracy of the model
mean(default[test_dataset]==predictions)
