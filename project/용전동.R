getwd()
library(dplyr)
library(ggplot2)

y_trade <- read.csv('project/y_trade.csv')
y_trade
View(y_trade)

y_trade %>% 
  filter(계약연도==2016)  %>% select(시군구,전용면적) %>% 
  group_by(시군구) %>% summarise(avg_m16=mean(전용면적))
y_trade %>% 
  filter(계약연도==2017)  %>% select(시군구,전용면적) %>% 
  group_by(시군구) %>% summarise(avg_m17=mean(전용면적))
y_trade %>% 
  filter(계약연도==2018)  %>% select(시군구,전용면적) %>% 
  group_by(시군구) %>% summarise(avg_m18=mean(전용면적))
y_trade %>% 
  filter(계약연도==2019)  %>% select(시군구,전용면적) %>% 
  group_by(시군구) %>% summarise(avg_m19=mean(전용면적))
y_trade %>% 
  filter(계약연도==2020)  %>% select(시군구,전용면적) %>% 
  group_by(시군구) %>% summarise(avg_m20=mean(전용면적))

y_trade %>% 
  filter(계약연도==2016)  %>% select(시군구,전용면적,거래금액) %>% 
  summarise(avg_m16=mean(전용면적),avg_p16=mean(거래금액))
y_trade %>% 
  filter(계약연도==2017)  %>% select(시군구,전용면적,거래금액) %>% 
  summarise(avg_m16=mean(전용면적),avg_p16=mean(거래금액))
y_trade %>% 
  filter(계약연도==2018)  %>% select(시군구,전용면적,거래금액) %>% 
  summarise(avg_m16=mean(전용면적),avg_p16=mean(거래금액))
y_trade %>% 
  filter(계약연도==2019)  %>% select(시군구,전용면적,거래금액) %>% 
  summarise(avg_m16=mean(전용면적),avg_p16=mean(거래금액))
y_trade %>% 
  filter(계약연도==2020)  %>% select(시군구,전용면적,거래금액) %>% 
  summarise(avg_m16=mean(전용면적),avg_p16=mean(거래금액))




