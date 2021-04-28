 # anscombe' quartet
head(anscombe)

# 평균
apply(anscombe,2,mean)
# 분산
apply(anscombe,2,var)


#상관관계
cor(anscombe$x1,anscombe$y1)
cor(anscombe$x2,anscombe$y2)
cor(anscombe$x3,anscombe$y3)
cor(anscombe$x4,anscombe$y4)
for(i in 1:4){
 ans_cor <- cor(anscombe[,i],anscombe[,i+4])
 print(ans_cor)
}
#요약
summary(anscombe)

# 그래프 그리기
library(ggplot2)
ggplot(anscombe) +
  geom_point(aes(x4,y4),color= 'darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,14) +
  geom_abline(intercept = 3, slope = 0.5,
              color='cornflowerblue', size=1)
 labs(title = 'dataset')

p1 <- ggplot(anscomebe) +
  geom_point(aes(x1,y1),color='darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,20) +
  geom_abline(intercept = 3,slope = 0.5,
              color='cornflowerblue', size=3)

par(mforw=c(1,1))

p1 <- ggplot(anscombe) +
  geom_point(aes(x1,y1),color= 'darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,14) +
  geom_abline(intercept = 3, slope = 0.5,
              color='cornflowerblue', size=1)
labs(title = 'datasetI')

p2 <- ggplot(anscomebe) +
  geom_point(aes(x2,y2),color='darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,20) +
  geom_abline(intercept = 3,slope = 0.5,
              color='cornflowerblue', size=3)+
  labs(title('Dataset II'))

p3 <- ggplot(anscomebe) +
  geom_point(aes(x3,y3),color='darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,20) +
  geom_abline(intercept = 3,slope = 0.5,
              color='cornflowerblue', size=3)+
  labs(title('Dataset III'))

p4 <- ggplot(anscomebe) +
  geom_point(aes(x4,y4),color='darkorange',size=3) +
  scale_x_continuous(breaks = seq(2,20,2)) +
  scale_y_continuous(breaks = seq(2,14,2)) +
  xlim(2,20) + 
  ylim(2,20) +
  geom_abline(intercept = 3,slope = 0.5,
              color='cornflowerblue', size=3) +
  labs(title('Dataset IV'))

library(gridExtra)
grid.arrange(p1,p2,p3,p4, ncol= , top="anscombe's Quartet")

figures = list()
ifgures <- append(figures,p1) 
ifgures <- append(figures,p2) 
ifgures <- append(figures,p3) 
ifgures <- append(figures,p4)
figures

#############################################################

# Source Refactoring
x <- ggplot(anscomebe) +
  geom_point(aes(x4,y4),color='darkorange',size=3)

m1 <- x
assign(paste('m',4,seq='.'),x)

library(dplyr)
for (i in 1:4) {
  x_data <- anscomebe %>% 
    y_data <- anscombe[,i+4]
    select()
    geom_point(aes(x_data,y_data),color='darkorange',size=3) +
    scale_x_continuous(breaks = seq(2,20,2)) +
    scale_y_continuous(breaks = seq(2,14,2)) +
    xlim(2,20) + 
    ylim(2,20) +
    geom_abline(intercept = 3,slope = 0.5,
                color='cornflowerblue', size=3) +
    labs(title= paste0('Dataset IV',i) ,
    x=paste('x',i),y=paste('y',i))
  assign(paste('m',i,seq='.'),x)
}
grid.arrange(m.1,m.2,m.3,m.4, ncol= 2, top="anscombe's Quartet")







