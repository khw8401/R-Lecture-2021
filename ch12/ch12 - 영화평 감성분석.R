# IMDB 영화평 감성분석
library(text2vec)
library(caret)
library(tm)

str(movie_review)

# 8:2 비율로 훈련/테스트 데이터 셋 분할
train_list <- createDataPartition(y=movie_review$sentiment,
                                  p=0.8, list=F)
mtrain <- movie_review[train_list,]
mtest <- movie_review[-train_list,]

# 훈련 데이터 셋에 대해 DTM 구축
# 테스트 데이터 셋에 대해서도 동일하게 적용해야 함
doc <- Corpus(VectorSource(mtrain$review))
doc <- tm_map(doc, content_transformer(tolower))
doc <- tm_map(doc, removeNumbers)
stopwords <-c(stopwords('en'),'<br/>')
doc <- tm_map(doc, removeWords, stopwords)
doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, stripWhitespace)

dtm <- DocumentTermMatrix(doc,
                          control = list(Weighting=weightTf))
dim(dtm)
dtm[1,]
inspect(dtm)

dtm_tfidf <- DocumentTermMatrix(doc,
                                control = list(Weighting=weightTfIdf))
inspect(dtm_tfidf)

# 모델링이 가능한 형태로 DTM을 변환
dtm_sm <- removeSparseTerms(dtm,0.9)
dim(dtm_sm)

# sentiment(y)와 DTM을 묶어서 데이터프레임을 생성
x <- as.matrix(dtm_sm)
dataTrain <- as.data.frame(cbind(mtrain$sentiment,x))
head(dataTrain)
colnames(dataTrain)[1] <- 'y'
dataTrain$y <- as.factor(dataTrain$y)

# Decision tree로 학습
library(rpart)
dt <- rpart(y~.,dataTrain)

# 테스트 데이터 셋으로 모델 성능 평가
docTest <- Corpus(VectorSource(mtest$review))
docTest <- tm_map(docTest, content_transformer(tolower))
docTest <- tm_map(docTest, removeNumbers)
docTest <- tm_map(docTest, removeWords, stopwords)
docTest <- tm_map(docTest, removePunctuation)
docTest <- tm_map(docTest, stripWhitespace)

dtmTest <- DocumentTermMatrix(docTest,
                              control = list(dictionary=dtm_sm$dimnames$Terms))

dim(dtmTest)
inspect(dtmTest)

# sentiment(y)와 DTM을 묶어서 데이터프레임을 생성
x <- as.matrix(dtmTest)
dataTest <- as.data.frame(cbind(mtrain$sentiment,x))
head(dataTrain)
colnames(dataTest)[1] <- 'y'
dataTest$y <- as.factor(dataTest$y)

# 학습했던 모델로 예측
dt_preb <- predict(dt, dataTest,type = 'class')
table(dt_preb, dataTest$y)


################################################################################
#SVM으로 훈련
library(e1071)
svc <- svm(y~., dataTrain)
sv_pred <- predict(svc, dataTest, type='class')
table(sv_pred,dataTest$y)

# tfdif로 변환
dtm_tfidf <- DocumentTermMatrix(doc,
                                control = list(Weighting=weightTfIdf))
inspect(dtm_tfidf)

# 모델링이 가능한 형태로 DTM을 변환
dtm_sm_tfidf <- removeSparseTerms(dtm,0.9)
dim(dtm_sm_tfidf)

# sentiment(y)와 DTM을 묶어서 데이터프레임을 생성
x <- as.matrix(dtm_sm_tfidf)
dataTrain <- as.data.frame(cbind(mtrain$sentiment,x))
head(dataTrain)
colnames(dataTrain)[1] <- 'y'
dataTrain$y <- as.factor(dataTrain$y)

# Decision tree로 학습
dtm_tfidf <- rpart(y~.,dataTrain)

# Test dataset
dtmTest_tfidf <- DocumentTermMatrix(docTest,
                              control = list(dictionary=dtm_sm_tfidf$dimnames$Terms,
                                             weighting=weightTfIdf))

x <- as.matrix(dtmTest_tfidf)
dataTest <- as.data.frame(cbind(mtrain$sentiment,x))
head(dataTrain)
colnames(dataTest)[1] <- 'y'
dataTest$y <- as.factor(dataTest$y)

# 예측
dt_pred_tfidf <- predict(dtm_tfidf,dataTest, type='class')
table(dt_pred_tfidf,dataTest$y)

# SVM
svc_tfidf <- svm(y~., dataTrain)
sv_pred_tfidf <- predict(svc_tfidf, dataTest, type='class')
table(sv_pred_tfidf,dataTest$y)


