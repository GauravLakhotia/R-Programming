
data = read.csv('C://Users/pimr laptop12/Desktop/USA_Housing.csv')
head(data)

#plot the dataset: linear model is apprimately fine
plot(data$Bedrooms, data$Price, main="Linear Regression", xlab="Bedrooms", ylab="Price")
plot(data$Rooms, data$Price, main="Linear Regression", xlab="Rooms", ylab="Price")
plot(data$Area_Population, data$Price, main="Linear Regression", xlab="Area_Population", ylab="Price")
plot(data$House_Age, data$Price, main="Linear Regression", xlab="House_Age", ylab="Price")

#we can analyse the data
Y <- data$Price

summary(data)
#mean
mean(Y)
#variance
var(Y)
#standard deviation is the sqrt(variance)
sd(Y)
#value range: min and max values
range(Y)

hist(Y, main="Histogram",xlab="ROOMS [min]",ylab="Frequency")

Rooms = data$Rooms
library(e1071)
kurtosis(data$Price)
skewness(data$Price)
library(DescTools)
JarqueBeraTest(data$Price)

#we use a linear model


model <- lm(Y ~ Rooms + data$Bedrooms + data$House_Age + data$Area_Population)


#plot the linear line
abline(model, col="red")
#let's see the statistics
summary(model)

#VIF for Multicollinearity Test

VIF <- VIF(lm(Y ~ Rooms + data$Bedrooms + data$House_Age + data$Area_Population))
VIF
#we can make predictions with the model
newdata = data.frame(Rooms = 72, + data$Bedrooms = 20, + data$House_Age = 85, + data$Area_Population = 100)
prediction = predict(model)
head(prediction)
# Model Diagnostics

coefficients(model) # model coefficients
confint(model, level=0.95) # CIs for model parameters 
fitted = fitted(model) # predicted values
head(fitted)
residuals = residuals(model) # residuals
head(residuals)
anova(model) # anova table 
vcov(model) # covariance matrix for model parameters 
influence(model) # regression diagnostics

# diagnostic plots 
layout(matrix(c(1,2,3, 4),2,2, byrow = TRUE)) # optional 4 graphs/page 
plot(model)
