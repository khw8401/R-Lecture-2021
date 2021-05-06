# 정규표현식(regular expression)
fruits <- c("1 apple", "2 pears", "3 bananas")
str_match(fruits,'[aeiou]')
str_match_all(fruits,'[aeiou]')

str_match(fruits,'\\d')
str_match(fruits,'[[:digit:]]')

