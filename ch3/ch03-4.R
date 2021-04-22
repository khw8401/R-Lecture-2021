#date frame
name <- c('철수','춘향','길동')
age <- c(20,22,25)
gender <- factor(c('M','F','M'))
blood_type <- factor(c('A','O','B'))

patients <- data.frame(name,age,gender,blood_type)
patients

patients$name
typeof(patients$name)
patients[1,]   #첫 번쩨 행 모두
patients[,2]   #patients$age 와 동일
patients[2,3]  #F
patients$gender[3]
patients[patients$name=='철수',]  #patients[1,] 이것과 동일, filtering
patients[patients$name=='철수',c("age",'gender')]   #selction

#date frame의 속성명을 변수명으로 사용
attach(patients)
name
blood_type
detach(patients)

head(cars)
attach(cars)
speed
dist
detach(cars)
speed   #에러: 객체 'speed'를 찾을 수 없다.

mean(cars$speed)
max(cars$dist)
with(cars,mean(speed))

#subset
subset(cars,speed>20)
cars[cars$speed>20,]
subset(cars,speed>20, select = c(dist))
subset(cars,speed>20,c('dist'))
subset(cars,speed>20,-c(dist))

# 결측값 NA 처리
head(airquality)
str(airquality)
sum(airquality$Ozone)

head(na.omit(airquality)) #NA가 포함된 행 전체를 제거 

#병합(merge)
patients
patients1  <- data.frame(name,age,gender)
patients2  <- data.frame(name,blood_type)
merge(patients1,patients2, by='name')

# date frame 행 추가
length(patients1$name)
patients1[length(patients1$name)+1] <- c('몽룡','19','M')
patients1
patients2[length(patients2$name)+2] <-c('영희','A')
patients2

#date frame 열 추가
patients1['birth_year'] <- c(1500,1550,1600,1800)
patients1

#merge
#inner join
merge(patients1,patients2)
#left outer join
merge(patients1,patients2,all.x = T)
#right outer join
merge(patients1,patients2,all.y = T)
#full outer join
merge(patients1,patients2,all.x = T,all.y = T)
