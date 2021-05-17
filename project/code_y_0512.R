getwd()
library(dplyr)
library(ggplot2)
library(dplyr)
library(ggplot2)
library(gapminder)

trade <- read.csv('project/최종통합.csv')
trade
View(y_trade)

trade %>% 
  filter(계약연도==2016)  %>% 
  group_by(trade$구,trade$계약연도) %>% 
  ggplot(aes(구,거래금액,group(계약연도)))

trade %>% 
  grup
  ggplot(aes(계약연도,거래금액,group(구구))) +
  geom_point(stat='identity',alpha=0.2,position = 'jitter')

trade %>% 
 filter()

trade %>% 
  filter(거래금액)  %>% 
  group_by(구,계약연도) %>% 
  summarise(avg_m=mean(거래금액))

trade %>% 
  ggplot(aes(계약연도,거래금액))+
  geom_point()
  
trade %>% 
  group_by(구,계약연도) %>% 
  select(구,거래금액) %>%
  ggplot(aes(구,거래금액))+
  geom_point()

avg_p <- trade$거래금액
avg_y <- trade$계약연도

ggplot(trade,aes(x=계약연도))+
  geom_bar()

trade %>% 