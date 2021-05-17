# R로 인터랙티브 지도 그리기
library(leaflet)
library(httr)
library(jsonlite)
library(leaflet)
library(stringr)

data <- read.csv('project/대덕구.csv')
# 기본 지도, 대전광역시
leaflet() %>% 
  setView(lng = 127.3, lat = 36.35, zoom = 12) %>% 
  addTiles()
# 기본 Marker 달기
leaflet() %>% 
  setView(lng = 127.3, lat = 36.35, zoom = 12) %>% 
  addTiles() %>% 
  addMarkers(lng =  127.3928,lat = 36.3525, label = '크로바 아파트',
             labelOptions= labelOptions(textsize = '20px'))

leaflet() %>% 
  setView(lng = 127.3, lat = 36.35, zoom = 12) %>% 
  addTiles() %>% 
  addCircles(lng = 127.3753,lat = 36.3852, label = '도룡 sk뷰',
             radius=100)


leaflet() %>% 
  setView(lng = 127.3, lat = 36.35, zoom = 12) %>% 
  addTiles() %>% 
  addCircles(lng = 127.3944,lat = 36.3772, label = '도룡 스마트시티',
             radius=300)

# 대덕구
popup = c("송촌동-선비마을", "석봉동-금강엑슬루타워", "법동-보람아파트","비래동-비래 휴플러스",
          "평촌동-행복한 마을")
leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = c(127.4410,127.4196,127.4312,127.4463,127.4241), # longitude
             lat = c(36.3679,36.4515,36.3691,36.3548,36.4382), # latitude
             popup = popup,
             radius = 15,weight = 15,color = 'red')
# 동구
popup = c("가양동-아침마을","대동-대동펜타뷰","삼성동-한밭자이",
          "성남동-스마트뷰","대성동-은어송마을")

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = c(127.4393,127.4458,127.4244,127.4328,127.4582), # longitude
             lat = c(36.34063,36.3276,36.3409,36.34294,36.3021), # latitude
             popup = popup,
             radius = 15,weight = 15,color = 'red')
# 중구
popup = c("문화동-센트럴파크","오류동-삼성아파트","대흥동-센트럴자이",
          "목동-목동더샵","선화동-센트럴뷰")

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = c(127.4095,127.4073,127.4278,127.4103,127.4167), # longitude
             lat = c(36.31741,36.3241,36.3225,36.3337,36.3238), # latitude
             popup = popup,
             radius = 15,weight = 15,color = 'red')
# 서구
popup = c("둔산동-크로바","둔산동-목련","둔산동-영진햇님",
          "탄방동-e편한세상","월평동-누리")

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = c(127.3928,127.3918,127.3925,127.3943,127.3715),# longitude
             lat = c(36.3525,36.3504,36.35629,36.34255,36.3588), # latitude
             popup = popup,
             radius = 15,weight = 15,color = 'red')

# 유성구
popup = c("도룡동-스마트시티","도룡동-SK뷰","상대동-트리플시티",
          "상대동-한라비발디","원신흥동-인스빌리베라")

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = c(127.3944,127.3753,127.3348,127.3339,127.3454),# longitude
             lat = c(36.3772,36.3852,36.3411,36.3446,36.343), # latitude
             popup = popup,
             radius = 15,weight = 15,color = 'red')




