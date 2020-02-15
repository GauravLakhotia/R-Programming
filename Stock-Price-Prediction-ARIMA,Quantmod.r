#Importing necessary packages
library(quantmod)
library(forecast)

maxDate <- "2015-03-15"
#Choosing closing price column
tata <- na.omit(getSymbols("TATAMOTORS.NS",src = "yahoo",from = maxDate,auto.assign=F)[,4])

#transforming into log values
tataMnthlyReturn <- periodReturn(tata, period="monthly", type='log',subset="2016")
#OR   amazonMnthlyReturn <- monthlyReturn(amazon)

#Plotting close price of stock
chartSeries(tata)

#Fitting ARIMA model
fit <- auto.arima(tata,ic="bic")
fit
#ARIMA(0,1,0)   AIC=7864.83    BIC=789.84

#Plotting data
lines(fitted(fit),col="red")
#Forecasting Future values
fit.forecast <- forecast(fit)
fit.forecast
plot(fit.forecast)

#Forecasting Retun
tataReturns <- diff(tata)/lag(tata,k=-1)*100
head(tataReturns)

