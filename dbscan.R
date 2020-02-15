install.packages("dbscan")
library(dbscan)

#read the dataset
moons_data <- read.csv("C:\\Users\\User\\Desktop\\moons.csv",TRUE,",")

#plot the dataset
plot(moons_data)

#DBSCAN (density-based spatial clustering)
#minPts - number of minimum points in the eps region
#eps - size of the epsilon neighborhood
dbscan_model <- dbscan(moons_data, eps=0.1, minPts = 10)

#check the model
dbscan_model

#visualize the results
plot(moons_data,col=dbscan_model$cluster,pch=16)

