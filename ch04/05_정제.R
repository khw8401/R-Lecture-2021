#데이터 정제
score <- read.csv('data/students2.csv')
scoer

for(i in 2:4){
  score[,i]<- ifelse(score[,i]>100|score[,i]<0,
                     NA, score[,1])
}
score

score[,2:4] <- ifelse(score[,2:4]<0| score[,2:4]>100,
                      NA, score[,2:4])
score

#결측값 처리
head(airquality)

sum(is.na(airquality))

table(is.na(airquality))

sum(is.na(airquality$Temp))
mean(airquality$Temp)

sum(is.na(airquality$Ozone))
mean(airquality$Ozone)
mean(airquality$Ozone, na.rm=T)   #na를 제외한 평균

#결측값 제거
air_narm <- na.omit(airquality)
sum(is.na(air_narm))

# 결측값 대체
options(digits = 4)
airquality$Ozone <-replace(airquality$Ozone,
                           is.na(airquality$Ozone),
                           mean(airquality$Ozone, na.rm=T))
head(airquality)

# 결측값 대체 중앙값(median)
airquality$Solar.R <- replace(airquality$Solar.R,
                              is.na(airquality$Solar.R),
                              median(airquality$Solar.R, na.rm = T))
head(airquality)

#이상 값 out lier
patients <- data.frame(name=c('환자1','환자2','환자3','환자4','환자5'),
                      age=c(22,20,25,30,27),
                      gender=c('M','F','M','K','F'),
                      blood.type=factor(c('A','O','B','AB','C')))
patients
#성별 이산치 제거
patients_outrm <- patients[patients$gender='M'|patients$gender='F',]

#성별과 혈액형의 이상치 제서

patients_outrm <- patients[patients$blood.type %in% c('A','O','B','AB','C'),]
patients_outrm <- patients[patients$gender %in% c('M','F')&
                             patients$blood.type %in% c('A','B','O','AB'),]
patients_outrm

# 이상치를 NA로 대체
patients$gender <- ifelse(patients$gender %in% c('M','F'),
                          patients$gender, NA)
patients_outrm

patients2 <- data.frame(name=c('환자1','환자2','환자3','환자4','환자5'),
                       age=c(22,20,25,30,27),
                       gender=c('M','F','M','K','F'),
                       blood.type=factor(c('A','O','B','AB','C')))
patients2$gender <- ifelse(patients2$gender %in% c('M','F'),
                           patients2$gender, NA)
patients2$blood.type <- ifelse(patients2$blood.type %in% c('A','B','O','AB'),
                               patients2$blood.type, NA)
patients2
sum(is.na(patients2))

# 숫자의 이상치
boxplot(airquality[,c(1:4)])
boxplot(airquality$Ozone)$stats

air <- airquality
air$Ozone <- ifelse(air$Ozone<boxplot(airquality$Ozone)$stats[1] | 
                      air$Ozone>boxplot(airquality$Ozone)$stats[5],
                    NA, air$Ozone)
sum(is.na(air$Ozone))
sum(is.na(airquality$Ozone))

mean(airquality$Ozone, na.rm = T)
mean(air$Ozone, na.rm = T)
