# WIKI '빅 데이터' 검색 결과 워드클라우드 만들기
library(RCurl)
library(XML)
library(SnowballC)
library(tm)
library(wordcloud2)

enc <-URLencode((iconv('빅 데이터','CP949','UTF-8'))
enc
# enc <- '%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0' # 빅 데이터
url <- paste0('https://ko.wikipedia.org/wiki/',enc)
url
html <- readLines(url)
html <- htmlParse(html,asText = T)
doc <- xpathSApply(html,'//p',xmlValue)
length(doc)
doc[1]

#전처리 수행
# 한글과 blank만 남기고 다른 글자를 지운다
hdoc <- gsub('[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]',' ',doc)
hdoc[1]

# DTM  한글의 조사 때문에 잘 안된다!!!
corpus <- Corpus(VectorSource(hdoc))
inspect(corpus)
dtm <- DocumentTermMatrix(corpus)
inspect(dtm)

# 한글 처리 후 작업을 해야 함
library(KoNLP)
useSejongDic()

nouns <- extractNoun(hdoc)
noun_freq <- table(unlist(nouns))
noun_freq[1:10]
v  <- sort(noun_freq,decreasing = T)
v100 <- v[1:100]
wordcloud2(v100)

################################################################################
# 한글 불용어 처리
noun_vec <- unlist(nouns)
stop_words <- c('한','등','수','적','이','것','들','년','있')

l <- list()
for (word in unlist(nouns)) {
  if(!word %in% stop_words){
    l <- append(l, word)
  }
}

noun_freq <- table(unlist(l))
v  <- sort(noun_freq,decreasing = T)
v100 <- v[1:100]
v100
wordcloud2(v100)







