# 조건문
# 1.[]에 행/열 조건 명시
test <- c(15, 20, 30, NA, 45)
test[test<40]                # NA 도 포함
test[test<40 & !is.na(test)] # NA 제거
test[test%%3==0] # 3의 배수인 수만 출력
test[test%%3==0 & !is.na(test)] # NA 제거거

df <- data.frame(name = c('존슨', '릴리', '마크'),
                 age = c(30, 16, 21),
                 gender = factor(c('M', 'F', 'M')
                 ))

df
# 여성인 행 추출
df[df$gender=='F',]

# 25세 이상, 남성 추출
df[df$gender=='M' &df$age>=25,]
   

# 2. if 문
x <- 5
if (x%%2 == 0) {
  print('짝수임돠')             # 줄 맞추기 indentation 
} else {
  print('홀수지롱')
}

# 2.2 if 세 가지 조건
x <- 0
if (x>0) {
    print('양수임다')
} else if (x<0) {
    print('음수임다')
} else {
    print('영이지롱')
}

x <- 0
if (x > 1e-10) {                #0.0000000001
    print('양수임다')
} else if (x < -1e-10 ) {       #-0.0000000001
    print('음수임다')
} else {
    print('영이지롱')
}

# 3. ifelse 
score <- 75
pass <- ifelse(score >= 60, 'u saved ur Ass', 'get back to ur home RIGHT NOW')
pass


