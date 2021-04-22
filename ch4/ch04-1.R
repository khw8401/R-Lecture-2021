# 파일 읽기
getwd()
students <- read.table('data/students1.txt', header = T)
students
str(students)

#read.csv 는 첫 행을 헤더로 읽는 것이 디폴트
students <- read.csv('data/students.csv')
students

#파일쓰기
write.table(students,file = 'data/output.txt')
































