women
plot

str(cars)

#??? 줄을 ????????? ??? ????????? ?????? 'Run' 버튼??? ???르면 ???꺼번??? ?????????
a <- 2
b <- a*a

#?????? ???????????? 지???
getwd()
setwd('/workspace/R')
getwd()

library(dplyr)
library(ggplot2)
search()

str(iris)        
head(iris) #defualt??? 6
head(iris, 10
tail(iris)  # ????????? 6개??? 보여???
plot(iris)
#??? ????????? ???관 관계계
plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species, pch=18)

tips=read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
tips%>% ggplot(aes(size))+geom_histogram
tips %>% ggplot(aes(size))+geom_histogram
library(dplyr)
library(ggplot2)
tips%>%ggplot(aes(size))+geom_histogram
tips%>%ggplot(aes(size))+geom_histogram()
tips%>%ggplot(aes(total_bill, tip))+geom_point()
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day))
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day, pch=sex), size=3)
