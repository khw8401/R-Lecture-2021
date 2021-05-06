# Alice
library(RCurl)
library(XML)
library(stringr)
library(dplyr)
library(tm) # Text Mining 라이브러리
library(SnowballC) # 어간 추출 라이브러리


alice <- readLines('D:/Programmierung/R/workspace/R/data/alice in worderland.txt')
alice
alice <- htmlParse(alice, asText = T) 

alicedoc <- xpathSApply(alice, '//p', xmlValue) 





alicedoc <- Corpus(VectorSource(alicedoc))
inspect(alicedoc) # 요약본

alicedoc <- tm_map(alicedoc, content_transformer(tolower)) # 소문자 변환
alicedoc <- tm_map(alicedoc, removeNumbers) # 숫자 제거
alicedoc <- tm_map(alicedoc, removeWords, stopwords('english')) # 불용어 제거
alicedoc <- tm_map(alicedoc, removePunctuation) # 구두점제거거
alicedoc <- tm_map(alicedoc, stripWhitespace) # 앞뒤 공백 제거

################################################################
# DTM 구축######################################################
################################################################
alicedtm <- DocumentTermMatrix(alicedoc)
alicedtm
inspect(alicedtm)

##################################################################
############# W O R D C L O U D ##################################
##################################################################
library(wordcloud)

typeof(alicedtm)
am <- as.matrix(alicedtm) # DTM List를 Matrix로 변환
am

aliceV <-sort(colSums(am), decreasing =  T)
head(aliceV)
alicedf <- data.frame(word = names(aliceV), freq = aliceV)
head(alicedf)
wordcloud(words = alicedf$word, freq = alicedf$freq, 
          min.freq = 1, max.words = 100, random.order = F, rot.per=0.35)

library(wordcloud2)
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(base64enc)
library(devtools)
# wordcloud2 필요 libraries

wordcloud2(alicedf) #성공
wordcloud2(alicedf, figPath = 'D:/Programmierung/R/workspace/R/data/alice mask.png') # 그림만뜸
wordcloud2(alicedf, figPath = 'C:/Users/Curio/OneDrive/Ground/alice mask.png') #마스크내에 글자 뜨는데 불완전

wordcloud2(alicedf, color = "random-light", backgroundColor = "grey") 
# 성공