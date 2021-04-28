# 데이터 시각화 과제
library(gapminder)
library(dplyr)
library(ggplot2)
# 1-1
x <- gapminder %>% 
  filter(year==1952) %>% 
  select(country, pop) %>% 
  arrange(desc(pop)) %>% 
  head()
pie(x$pop, x$country)
barplot(x$pop, names.arg=x$country)
# 1-2
for (i in seq(1952,2007,5)) {
  x <- gapminder %>% 
    filter(year==i) %>% 
    select(country, pop) %>% 
    arrange(desc(pop)) %>% 
    head()
  pie(as.numeric(x$pop), x$country)
  barplot(x$pop, names.arg=x$country)
  title(i)
}
# 2
library(tidyr)

# 2-1 airquality
head(airquality)
air_tidy <- gather(airquality, key='Measure', value='Value',
                   -Day, -Month)
head(air_tidy)
tail(air_tidy)
dim(airquality)
dim(air_tidy)

air_tidy %>% 
  ggplot(aes(Day, Value, col=Measure)) +
  geom_point() +
  facet_wrap(~Month)

# 2-2 iris
iris_tidy <- gather(iris, key='feat', value='Value',
                    iris_tidy <- gather(iris, key='feat', value='value',
                                        -Species)
                    head(iris_tidy)
                    tail(iris_tidy)
                    iris_tidy %>% 
                      ggplot(aes(feat, Value, col=Species)) +
                      ggplot(aes(feat, value, col=Species)) +
                      geom_point(position='jitter')
                    
                    # 3
                    @@ -54,6 +59,7 @@ virg <- filter(iris, Species=='virginica')
                    seto_s <- seto %>% 
                      ggplot(aes(Sepal.Length,Sepal.Width,col=Species)) +
                      geom_point()
                    seto_s
                    seto_p <- seto %>% 
                      ggplot(aes(Petal.Length,Petal.Width,col=Species)) +
                      geom_point()
                    @@ -79,6 +85,7 @@ seto_mean <- apply(iris[iris$Species=='setosa',1:4],2,mean)
                    vers_mean <- apply(iris[iris$Species=='versicolor',1:4],2,mean)
                    virg_mean <- apply(iris[iris$Species=='virginica',1:4],2,mean)
                    mean_of_iris <- rbind(seto_mean, vers_mean, virg_mean)
                    mean_of_iris
                    
                    barplot(mean_of_iris, beside=T,
                            main='품종별 평균', ylim=c(0,8), col=c('red','green','blue'))
                    @@ -91,6 +98,7 @@ df <- iris %>%
                      group_by(Species) %>% 
                      summarise(sepal_length=mean(Sepal.Length), sepal_width=mean(Sepal.Width),
                                petal_length=mean(Petal.Length), petal_width=mean(Petal.Width))
                    df
                    df_tidy <- gather(df, key='Feature', value='Value', -Species)
                    df_tidy
                    ggplot(df_tidy, aes(x=Feature, y=Value, fill=Species)) +
                      @@ -101,7 +109,7 @@ ggplot(df_tidy, aes(x=Feature, y=Value, fill=Species)) +
                      
                      # 3-3
                      # boxplot
                      par(mfrow=c(3,1))
                    par(mfrow=c(3,1))     # 3행 1열의 그래프
                    boxplot(seto$Sepal.Length, seto$Sepal.Width,
                            seto$Petal.Length, seto$Petal.Width,
                            col=c('red','yellow','green','blue'),
                            @@ -122,20 +130,17 @@ par(mfrow=c(1,1))
                            # ggplot
                            seto_tidy <- gather(seto, key='Feature', value='Value', -Species)
                            head(seto_tidy)
                            s1 <- seto_tidy %>% 
                              ggplot(aes(x=Feature,y=Value)) +
                              s1 <- ggplot(seto_tidy, aes(x=Feature,y=Value,col=Feature)) +
                              geom_boxplot() +
                              ggtitle('Setosa')
                            s1
                            
                            vers_tidy <- gather(vers, key='Feature', value='Value', -Species)
                            virg_tidy <- gather(virg, key='Feature', value='Value', -Species)
                            s2 <- vers_tidy %>% 
                              ggplot(aes(x=Feature,y=Value)) +
                              s2 <- ggplot(vers_tidy, aes(x=Feature,y=Value,col=Feature)) +
                              geom_boxplot() +
                              ggtitle('Versicolor')
                            s3 <- virg_tidy %>% 
                              ggplot(aes(x=Feature,y=Value)) +
                              s3 <- ggplot(virg_tidy, aes(x=Feature,y=Value,col=Feature)) +
                              geom_boxplot() +
                              ggtitle('Virginica')
                            grid.arrange(s1,s2,s3, ncol=1)

