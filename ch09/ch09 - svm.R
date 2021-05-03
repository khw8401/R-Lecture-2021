# 서포트 벡터 머신
library(caret)
library(e1071)

iris
set.seed(2021)
train_index <- createDataPartition(iris$Species,p=0.8,list = F)
iris_train <-  iris[train_index,]
iris_test <-iris[-train_index,]

# 모델링
svc <- svm(Species~., iris_train)

# 예측
pred <-  predict(svc, iris_test, type='class')

# 평가
confusionMatrix(pred, iris_test$Species)

# 하이퍼 파라미터 C(cost)
svc100 <- svm(Species~., iris_train, cost=100)
pred100 <-  predict(svc100, iris_test, type='class')
confusionMatrix(pred100, iris_test$Species)

#모델 훈련했을 때의 데이터로 예측
svc001 <- svm(Species~., iris_train, cost=0.01)

self001 <- predict(svc001, iris_train, type='class')
confusionMatrix(self001, iris_train$Species)

# k-NN(Nearest-neighbor) - k 최근접 이웃
library(class)
k <- knn(iris_train[,1:4],iris_test[,1:4], iris_train$Species,k=5)
k
iris_test$Species
confusionMatrix(k,iris_test$Species)

# train 함수
r <-  train(Species ~., iris_train, method='rpart')
rf <-  train(Species ~., iris_train, method='rf')
sv <-  train(Species ~., iris_train, method='svmradial')
knn <-  train(Species ~., iris_train, method='knn')
names(getModelInfo())
