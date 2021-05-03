# Random Forest
library(caret)
library(RandomForest)

set.seed(2021)
train_index <- createDataPartition(iris$Species,p=0.8,list = F)
iris_train <-  iris[train_index,]
iris_test <-iris[-train_index,]

# 학습        
rf <- randomForest(species ~., iris_train)
rf

# 예측
pred <-  predict(rf, iris_test,type='class')

# 평가
confusionMatrix(pred, iris_test$species)

# 시각화
plot(rf)

#하이퍼 파라메터
small_forest <- randomForest(species ~., iris_test,
                             ntree=100,nodesize=4)
s_pred <-  predict(samm_forest, iris_test, type='class')
confusionMatrix(s_pred, iris_test$species)
plot(small_forest)