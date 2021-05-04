# 단원문제

library(caret)
library(class)
library(e1071)
library(randomForest)
library(rpart)
library(survival)

1번
colon <-  na.omit(colon)
data <- colon[sample(nrow(colon)),]
colon$status <- factor(colon$status)
set.seed(2021)
colon

# k = 5
k <- 5 
q <- nrow(data)/k
l <- 1:nrow(data)

accuracy <- 0
precision <- 0
recall <- 0

# random forest
for (i in 1:k) {
  test_list <- ((i-1)*q+1) : (i*q)
  data_test <- data[test_list,]
  data_train <- data[-test_list,]
  rf <- randomForest(status ~., data_train)
  pred <- predict(rf, data_test, type='class')
  t <- table(pred, data_test$status)
  
  accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
  precision <- precision + t[2,2]/(t[2,1]+t[2,2])
  recall <- recall + t[2,2]/(t[1,2]+t[2,2])
}
rf_avg_acc <- accuracy / k
rf_avg_prec <- precision / k
rf_avg_rec <- recall / k

sprintf('랜덤 포레스트: 정확도=%f',
        rf_avg_acc)

# k = 10
k <- 10
q <- nrow(data)/k
l <- 1:nrow(data)

accuracy <- 0
precision <- 0
recall <- 0

# random forest
for (i in 1:k) {
  test_list <- ((i-1)*q+1) : (i*q)
  data_test <- data[test_list,]
  data_train <- data[-test_list,]
  rf <- randomForest(status ~., data_train)
  pred <- predict(rf, data_test, type='class')
  t <- table(pred, data_test$status)
  
  accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
  precision <- precision + t[2,2]/(t[2,1]+t[2,2])
  recall <- recall + t[2,2]/(t[1,2]+t[2,2])
}
rf_avg_acc <- accuracy / k
rf_avg_prec <- precision / k
rf_avg_rec <- recall / k

sprintf('랜덤 포레스트: 정확도=%f',
        rf_avg_acc)


# k = 15
k <- 15
q <- nrow(data)/k
l <- 1:nrow(data)

accuracy <- 0
precision <- 0
recall <- 0

# random forest
for (i in 1:k) {
  test_list <- ((i-1)*q+1) : (i*q)
  data_test <- data[test_list,]
  data_train <- data[-test_list,]
  rf <- randomForest(status ~., data_train)
  pred <- predict(rf, data_test, type='class')
  t <- table(pred, data_test$status)
  
  accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
  precision <- precision + t[2,2]/(t[2,1]+t[2,2])
  recall <- recall + t[2,2]/(t[1,2]+t[2,2])
}
rf_avg_acc <- accuracy / k
rf_avg_prec <- precision / k
rf_avg_rec <- recall / k

sprintf('랜덤 포레스트: 정확도=%f',
        rf_avg_acc)

# k = 20
k <- 20
q <- nrow(data)/k
l <- 1:nrow(data)

accuracy <- 0
precision <- 0
recall <- 0

# random forest
for (i in 1:k) {
  test_list <- ((i-1)*q+1) : (i*q)
  data_test <- data[test_list,]
  data_train <- data[-test_list,]
  rf <- randomForest(status ~., data_train)
  pred <- predict(rf, data_test, type='class')
  t <- table(pred, data_test$status)
  
  accuracy <- accuracy + (t[1,1]+t[2,2])/nrow(data_test)
  precision <- precision + t[2,2]/(t[2,1]+t[2,2])
  recall <- recall + t[2,2]/(t[1,2]+t[2,2])
}
rf_avg_acc <- accuracy / k
rf_avg_prec <- precision / k
rf_avg_rec <- recall / k

sprintf('랜덤 포레스트: 정확도=%f',
        rf_avg_acc)





library(caret)
library(class)
library(e1071)
library(randomForest)
library(rpart)
library(survival)

2. ucla admission
ucla <- read.csv('https://stats.idre.ucla.edu/stat/data/binary.csv')
ucla
library(caret)
clean_ucla=na.omit(ucla)
clean_ucla=clean_ucla[c(TRUE,FALSE),]
clean_ucla$admit=factor(clean_ucla$admit)
control=trainControl(method = 'cv',number = 10)
formular = admit~ gre+gpa+rank
L=train(formular, data=clean_ucla, method='svmLinear',metric='Accuracy',trControl=control)
LW=train(formular, data = clean_ucla, method='svmLinearWeights',metric='Accuracy',trControl=control)
P = train(formular,data= clean_ucla, method='svmPoly',metric='Accuarcy',trControl=control)
R = train(formular,data= clean_ucla, method='svmRadial',metric='Accuarcy',trControl=control)
RW= train(formular,data= clean_ucla, method='svmRadialWeights',metric='Accuarcy',trControl=control)
f100=train(formular,data= clean_ucla, method='rf',ntree=100, metric='Accuarcy',trControl=control)
f300=train(formular,data= clean_ucla, method='rf',ntree=300, metric='Accuarcy',trControl=control)
f500=train(formular,data= clean_ucla, method='rf',ntree=500, metric='Accuarcy',trControl=control)
r=train(formular, data=clean_ucla, method='rpart',metric='Accuracy',trControl=control)
k=train(formular, data=clean_ucla, method='knn',metric='Accuracy',trControl=control)
g=train(formular, data=clean_ucla, method='glm',metric='Accuracy',trControl=control)
resamp=resamples(list(선형=L, 선형가중치=LW, 다항식=P, RBF=R, 가중치= RW, rf100=f100, rf300=f300,
                     rf500=f500, tree=r, knn=k glm=g))







