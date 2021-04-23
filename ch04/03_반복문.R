# 반복문
# 1. repeat
 i = 1
 sum <- 0
repeat{
  if(i>10){
    break
  } 
  sum<- sum+i
  i<- i+1
}
print(sum)

#while
i <- 1
sum <- 0
while (i<=10) {
  sum <- sum+i
  i <-i+1
}
print(sum)

#for

for (i in 1:10) {
  sum <- sum+i
}
print(sum)
# 10!
i <- 1
factorial <- 1
while (i<=10) {
  factorial <- factorial * 1
  i <- i +1
}
print(factorial)
#1~100 사이의 홀수의 합
s <- 0
for (i in 1:100){
  if(i %% 2 != 0)
    {
    s <- s + i
  }
}
print(s)

# 구구단 만들기
for(k in 1:9) {
  print(paste('2','x',k,'=',2*k))
}

for (i in 2:9) {
  print(paste(i,'단 ========================='))
  for(k in 1:9) {
    print(paste(i,'x',k,'=',i*k))
  }
}

#matrix 만들기
matrix(1:12,nrow = 3)
nrow <- 3
col <- 4

sum1 <- 0
sum2 <- 0
sum3 <- 0
for (i in 1:nrow) {
  for (k in 1:col) {
    sum1 <- sum1 + mat[1,k]
    sum2 <- sum2 + mat[1,k]**2
    sum3 <- sum3 + mat[i,k]**i
  }
}
print(sum1, sum2, sum3)

#별 그리기 
for (i in 1:5) {
  star<-''
  for (k in 1:i) {
    star <- paste0(star, '+')
  }
  print(star)
}

#list 만들기
lst = list()
lst <- append(lst,3)
lst <- append(lst,5)
print(lst)
lst<- append(lst,7)
length(lst)
lst[2]

lst<- list()
for (i in 1:5) {
  lst <- append(lst,i)

}
lst

for (element in lst) {
 print(element) 
}
vec <- c(1,7,8)
for (element in vec) {
  print(element)
}

for (element in mat){
  print(element)
}

#약수
N <- 24
for(num in 1:n){
  if(N%%num==0){
    print(num)
  }
}

#약수의 합
sum <- 0
for (num in 1:N) {
  if(N %% num==0){
    sum <- sum + num
  }
}
print(sum)

#perfect number
#2에서 10000사이의 완전수를 찾으시오.
for(N in 2:10000){
  sum <- 0
  for (num in 1:N-1) {
    if(N %% num==0){
      sum <- sum + num
    }
  }
  if(sum=N){
    print(N)
  }
}
  