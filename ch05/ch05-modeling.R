# 모델링을 위한 가공
library(dplyr)

# WINE data
wine <- read.table('data/wine.data.txt',sep=',')
head(wine)

columns <- readline('data/wine.name.txt')
columns

# wine data의 columns
names(wine)

#substr
a <- 'A quick brown fox jumps over the lazy dog'
nchar(a)
substr(a,3,7)
substr(a,nchar(a)-3,nchar(a))

names(wine)[2:14] <- substr(columns,4,nchar(columns))
names(wine)[1] <- 'Y'
names(wine)

# 데이터셋 분할
train_set = sample_frac(wine,0.75)
str(train_set)
table(wine$Y)
table(train_set$Y)


test_set = setdiff(wine, train_set)
table(test_set$Y)
