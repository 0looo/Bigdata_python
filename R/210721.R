x1 <- c(1:10)
x1_2 <- seq(from =1 , to = 10, by = 1)

x2 <- seq(from=1, to = 10, by =2)

print(x1)
print(x1_2)
print(x2)


matrix_r <-  matrix(
  data = x1,
  nrow = 5
)
matrix_r

matrix_c = matrix(x1, ncol = 5)
matrix_c

data_set = data.frame(x1, x1_2,x2)
data_set
print(head(data_set))

length(x1)
dim(matrix_r)
dim(data_set)

seq(1, 10)

for(k in seq(1,10)) {
  print(k)
}

a <- seq(1,10)
print(a)

for(i in a){
  print(i)
}

# chr / int / num / factor/ posixct / tseries

num_vec <- c(1:20)
chr_vec <- c('A','B','C')
str(num_vec)
str(chr_vec)

# 날짜 형태의 변수
# as.Date()

date_0 <- '2018-01-02'
date_1 <- as.Date(date_0, format('%Y-%m-%d'))
date_1
str(date_0)
str(date_1)

# as.POSIXct()
date_2 <- '2015-02-04 23:12:14'
date_p <- as.POSIXct(date_2, format = "%Y-%m-%d %H:%M:%S")

str(date_2)
str(date_p)

format(date_p,'%A')

# as
x = c(1:10)
x1 <- as.integer(x)
x1
x2 <- as.numeric(x)
x3 <- as.factor(x)
x4 <- as.character(x)
str(x1)
str(x2)
summary(x1)
summary(x3)
str(x3)
summary(x4)

set.seed(1234)
s1 <- sample(1:45,6,replace = FALSE)
s1

s2 <- sample(1:45, 6, replace = FALSE)


?sample

if(7 %in% a){
  print('a')
}else{
  print('b')
}

## 예제
# 1. 로또번호 출력
sample(1:45, 6)

# 2. 
AV = seq(from = 1, to=100, by=2)
print(AV)

BV =rep(c(1:5),rep(2,5))
print(BV)

M <- matrix(c(1:9), ncol=3, byrow = TRUE)
M

de_r = function(x,y){
  sol = x^2+y+10
  return (sol)
}

de_r(1,2)

df = read.csv('C:\\Users\\DNI_210702\\Documents\\self_study\\R_data\\HR_comma_sep.csv')
head(df,5)

str(df)

summary(df)

df$Work_accident = as.factor(df$Work_accident)
df$left = as.factor(df$left)
df$promotion_last_5years=as.factor(df$promotion_last_5years)
df$sales = as.factor(df$sales)
df$salary= as.factor((df$salary))

summary(df$left)


df_high <- subset(df,salary=='high')
head(df_high,3)
str(df_high)

df_high_it <- subset(df,salary=='high'& sales=='IT')
str(df_high_it)

df_high_it2 <- subset(df,salary=='high'|sales=='IT')
print(xtabs(~df_high_it2$sales + df_high_it2$salary))
xtabs(data=df_high_it2, ~sales + salary)
xtabs(data=df_high_it2, ~sales + salary, sparse = TRUE)


install.packages('plyr')
library(plyr)
