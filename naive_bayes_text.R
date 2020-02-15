install.packages("RTextTools")
install.packages("e1071")
library(RTextTools)
library(e1071)

#read the sentiment dataset
sentiment_dataset <- read.csv("C:\\Users\\User\\Desktop\\sentiment.csv",FALSE,",")

sentiment_dataset

#every word is a numerical value + a feature
#document term matrix (DTM) - every row is a document (sentence) and
#the elements are the term-frequencies
term_matrix= create_matrix(sentiment_dataset[,1], language="english", 
                      removeStopwords=FALSE, removeNumbers=TRUE, 
                      stemWords=FALSE) 

term_matrix

#matrix form of the DTM
term_matrix = as.matrix(term_matrix)
term_matrix

#use Naive-Bayes classifier as the model
model = naiveBayes(term_matrix[1:14,], as.factor(sentiment_dataset[1:14,2]) )

#we can make predictions with the model
predicted = predict(model, term_matrix[15:16,]);
predicted

#confusion matrix + accuracy of the model
table(sentiment_dataset[15:16, 2], predicted)
recall_accuracy(sentiment_dataset[15:16, 2], predicted)
