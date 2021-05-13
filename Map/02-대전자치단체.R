# 대전 소재 자치 단체 건물
# - 다음 지도 검색에서 위도, 경도 정보 알아내기
# - 지도 위에 표시하기
getwd()
setwd('C:/workspace/R')

library(httr)
library(jsonlite)
library(leaflet)
library(stringr)
dj <- read.csv('data/대전.csv',fileEncoding='UTF-8')
dj
addr <- dj$addr[1]

kakao_api_key <- readLines('./openAPI/kakao_api_key.txt',encoding = 'UTF-8')

base_url <- "https://dapi.kakao.com/v2/local/search/address.json"
keyword <- URLencode(iconv(addr,to='UTF-8'))
keyword
query <- paste0('query=',keyword)
url <- paste(base_url,query,sep = '?')
url

auth_key <- paste('KakaoAK', kakao_api_key)
res <- GET(url, add_headers('Authorization'=auth_key))
res
result <- fromJSON(as.character(res))
result

result$documents$x  # 경도
as.numeric(result$documents$y)# 위도

# dj dataframe에 위도,경도 정보 추가하기
lngs <- c()
lats <- c()
for (i in 1:nrow(dj)) {
  keyword <- URLencode(iconv(dj$addr[i],to='UTF-8'))
  query <- paste0('query=',keyword)
  url <- paste(base_url,query,sep = '?')
  res <- GET(url, add_headers('Authorization'=auth_key))
  result <- fromJSON(as.character(res))
  lngs <- c(lngs,as.numeric(result$documents$x))
  lats <- c(lats,as.numeric(result$documents$y))
}
dj$lng <- lngs
dj$lat <- lats
View(dj)

# 지도위에 표시하기
leaflet(dj) %>% 
  setView(lng = 127.3, lat = 36.35, zoom = 12) %>% 
  addTiles() %>% 
  addMarkers(lng =~lng,lat = ~lat, popup=~addr,label = ~place)

leaflet(dj) %>% 
  setView(lng = mean(dj$lng), lat =mean(dj$lat), zoom = 12) %>% 
  addTiles() %>% 
  addCircles(lng =~lng,lat = ~lat, popup=~addr,label = ~place,
             weight = 1, radius = ~pop/1000)

dj$color <- ifelse(str_length(dj$place)>5, '#dd0022','#1133ee')

leaflet(dj) %>% 
  setView(lng = mean(dj$lng), lat =mean(dj$lat), zoom = 12) %>% 
  addTiles() %>% 
  addCircles(lng =~lng,lat = ~lat, popup=~addr,label = ~place,
             weight = 1, radius = ~pop/1000, color = ~color)
