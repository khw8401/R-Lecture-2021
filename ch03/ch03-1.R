getwd()
setwd('/workspace/R')

# 변수(variable)
x <- 1
y <- 2
z <- x + y 
z

# swapping
temp <- x
x <- y
y <- temp

#변수의 타입입
typeof(x)
a <- 'string'
typeof(a)
b <- "double quote"
c<- '한글'

x <- 5
y <- 2
x / y
#복소수(complex)
xi <- 1 +2i
yi <- 1 -2i
xi + yi
xi * yi


#범주형(category)
blood_type = factor(c('a','b','o','ab'))
blood_type

#논리형(boolean)
TRUE
FALSE
T
F
XINF = Inf
YINF = -Inf
XINF / YINF


#데이터형 확인 함수
class(x)   # 객체지향 관점
typeof(x)   # R 언어 자체 관점
is.integer(x)
is.numeric(x)
is.complex(xi)
is.character(c)
is.na(XINF/YINF)

#데이터형 변환 함수수
is.integer(as.integer(x))
is.factor(as.factor(c))

#산술 연산자(operator) (+,-,^,%%,%/%, **)
5 ^ 2
4 ^ (1/2)
x %% y  #나머지(modulo)
x %/% y

#비교 연산자 (<,>,<=,>=,!=)
x < y
x <=y
x >=y
x == y 
x != y

#논리 연산자
!T
!F
x | y #OR
x & y  #AND
x || y
a <- c(F, F, T, T)
b <- c(F, T, F, T)
a | b  # element wise OR
a || b # 첫 번쨰 엘리먼트의 논리 합
a & b
a && b
2^(-3) -5**(1/2) >2    # 2^(-3) -5**(1/2) >2 으로 쓸 것

