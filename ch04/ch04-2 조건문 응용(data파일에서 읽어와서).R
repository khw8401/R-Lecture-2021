# students.csv 파일 읽어서 학점 부여하기
students <- read.csv('data/students.csv', fileEncoding = 'euc-kr')
students

options(digits = 2) #유효숫자 자리수
apply(students[,2:4],1,mean)
students['평균'] = c(apply(students[,2:4],1,mean))
students

students$평균

students['학점'] = ifelse(students$평균 >= 90, 'A', 
                        ifelse(students$평균 >= 80, 'B',
                               ifelse(students$평균 >= 70, 'C', 'D')))

students
