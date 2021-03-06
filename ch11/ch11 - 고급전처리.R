#wikipedia "data science"
install.packages("SnowballC")
library(RCurl)
library(XML)
library(stringr)
library(tm)        # text mining 라이브러리
library(SnowballC) # 어간 추출 라이브러리


html <- readLines('https://en.wikipedia.org/wiki/Data_science')
html <- htmlParse(html, asText = T)
doc <- xpathSApply(html, '//p', xmlValue)

doc <- Corpus(VectorSource(doc))
inspect(doc)

doc <- tm_map(doc, content_transformer(tolower)) # 소문자 변환
doc <- tm_map(doc, removeNumbers)                # 숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english')) # 불용어 제거
doc <- tm_map(doc, removePunctuation) # 구둣점 제거 
doc <- tm_map(doc, stripWhitespace)   # 앞뒤 공백 제거

####################
# DTM 구축
####################
dtm <- DocumentTermMatrix(doc)
dim(dtm)
inspect(dtm)

####################
# World Cloud
####################
install.packages("wordcloud")
library(wordcloud2)

m <- as.matrix(dtm) # DTM list를 matrix로 변환
v <- sort(colSums(m), decreasing = T)
v[1:5]
df <- data.frame(word=names(v), freq=v)
head(df)
wordcloud(words = df$word, freq = df$freq, min.freq = 1, max.words = 100,
          random.order = F, rot.per = 0.35)

d200 <-  df[1:200,]
wordcloud2(d200, shape='star')
wordcloud2(d200, minRotation=pi/6 , maxRotation=pi/3, rotateRatio=1.0)

wordcloud2(d200,minRotation=pi/6 , maxRotation=pi/3, rotateRatio=1.0,
          figpath="alice.png",size=0.5)








