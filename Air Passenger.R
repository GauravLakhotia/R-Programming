data(AirPassengers)
class(AirPassengers)
summary(AirPassengers)

plot(AirPassengers)
abline(reg=lm(AirPassengers~time(AirPassengers)))
#This will plot the time series along with fitted line

cycle(AirPassengers)
#This will print the cycle across years.

plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend

#There is seasonal growth in passenger

par(mfrow =c(1,2))
acf(AirPassengers)
pacf(AirPassengers)

acf(log(AirPassengers))
pacf(log(AirPassengers))
#p=0 #d=1

fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12))

pred <- predict(fit, n.ahead = 10*12)


ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))



#Forcasting with Holt Winter Method
hw <- HoltWinters(AirPassengers)
plot(hw)
#Holt Method has fitted signicantly well on the actual data
hw_ft<-forecast:::forecast.HoltWinters(hw, h=12)
forecast:::plot.forecast(hw_ft,)

hw_ft

cat('Forecasted:',round(as.vector(hw_ft$mean),2))

