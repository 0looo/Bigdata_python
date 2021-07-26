# R Ch1 exmaple
# 1
setwd('C:/Users/DNI_210702/Documents/self_study')
getwd()

# 2
name_ex <- 'kim'
age_ex <- 25
address <- 'gaha seoul'

mode(name_ex)  # character
mode(age_ex)   # numeric
mode(addres
s)  # character

is.numeric(age_ex)
is.character(name_ex)

# 3  / use woman dataset
women
str(women)
## women의 mode = num

mode(women)
class(women)
## 자료형 : list / 자료구조 : data.frame

plot(women)

# 4
seq(100)
mean(seq(100))

# 5 : R의 특징 두가지 이상
## 객체지향 , 시각화 등


help("rep")

install.packages('RSADBE')
library(RSADBE)
data("Severity_Counts")
str(Severity_Counts)

show(AirPassengers)

data("AirPassengers")
par(mfrow=c(1,2))
ts.plot(AirPassengers)
diff <- diff(AirPassengers)
plot(diff)

par(mfrow=c(1,2))
plot(AirPassengers)
log <- diff(log(AirPassengers))
plot(log)


?diff()



diff(1:10, 2)
diff(1:10, 2, 2)
x <- cumsum(cumsum(1:10))
diff(x, lag = 2)
diff(x, differences = 2)

diff(.leap.seconds)
