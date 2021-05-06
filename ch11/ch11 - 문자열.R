# 문자열 처리

library(stringr)

# 1.Charactor로 형 변형
example <- 1
typeof(example) # doubleu 숫자
example <- as.character(example)
typeof(example) # charactor

# 입력을 받는 경우
input <- readline('Prompt>')
input
i <-  as.numeric(input)

# 2. string 이어 붙이기
paste('A','quick','brown','fow') # "A quick brown fow"
paste0('A','quick','brown','fow') # "Aquickbrownfow"
paste('A','quick','brown','fow', sep = '-') # "A-quick-brown-fow"
s <- paste('A','quick','brown','fow', sep = '-')
str_split(s,'-')
l <- str_split(s,'-')
l[1]
paste(l)
paste(l,collapse = ' ')
sample <-  c('A','quick','brown','fow')
paste(sample)
paste(sample, collapse = ' ')
str_c(sample, '1', sep = '_')
str_c(sample,'1',sep = '_', collapse = '@@')

# 3. charactor 개수카운트
x <- 'hello'
nchar(x)
h <-  '안녕하세요'
nchar(h)
str_length(h)

# 4. 소문자 변환
tolower(x)

# 5. 대문자 변환
toupper(x)

# 6. 2개의 charactor vector를 중복되는 항목 없이 합하기
str_1 <-  c("hello", "world", "r", "program")
str_2 <-  c("hi", "world", "r", "coding")
union(str_1, str_2) # 합집합

# 7. 2개의 charactor에서 공통된 항목 추출
intersect(str_1, str_2) # 교집합

# 8. 차집합
setdiff(str_1, str_2)

# 9.  2개의 character vector에서 동일 여부
str_3 <-  c("r", "hello", "program", "world")
setequal(str_1, str_2)
setequal(str_1, str_3)

# 10. 공백 없애기
vector_1 <-  c("   Hello World!  ", "    Hi R!    ")
str_trim(vector_1, side = 'left')
str_trim(vector_1, side = 'right')
str_trim(vector_1, side = 'both')

# 11. string 반복
str_dup(x,3)
rep(x,3)

# 12. Substring(String의 일정 부분) 추출
string_1 <- "Hello World"
substr(string_1,7,9)
substr(string_1,7) # error
substring(string_1,7)
str_sub(string_1,7)
str_sub(string_1,7,-1)
string_1[7:9]

# 13. String의 특정 위치에 있는 값 바꾸기 
string_1 <- "Today is Monday"
substr(string_1,10,12) <- "sun"
string_1
substr(string_1,10,12) <- "thuse" # thuday

# 14. 특정 패턴(문자열)을 기준으로 String 자르기
strsplit(string_1, split = ' ')
str_split(string_1, pattern= ' ')
str_split(string_1, pattern= ' ', n=2)
str_split(string_1, pattern= ' ', simplify = T)
s <- str_split(string_1, pattern= ' ')
typeof(s)
s[[1]]
s[[1]][1]
# 리스트를 vector로 변환
unlist(s)
paste(unlist(s), collapse = ' ')

# 15. 특정 패턴(문자열) 찾기 (기본 function)
vector_1 <- c("Xman", "Superman","JOker")
grep("man", vector_1)
grepl("man", vector_1)
regexpr("man", vector_1)
gregexpr("man", vector_1)

# 16. 특정 패턴(문자열) 찾기 (stringr package function) 
fruit <- c("apple", "banana", "cherry")
str_count(fruit,'a')
str_detect(fruit,'a')
str_locate(fruit,'a')
str_locate_all(fruit,'a')

people <- c("rorori", "emilia", "youna")
str_match(people,"o(\\D)")  # \\D는 non-digit charactor를 의미

# 17. 특정 패턴(문자열) 찾아서 다른 패턴(문자열)으로 바꾸기
fruits <- c("one apple", "two pears", "three bananas")
sub('a','A',fruits)
gsub('a','A',fruits)
str_replace(fruits,'a','A')
str_replace_all(fruits,'a','A')




