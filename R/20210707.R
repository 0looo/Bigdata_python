a = 3
print(a)
a ==2 
a ==3

# vector
b = c(2,3,4,5)
print(b)

# rep(), seq()  // 백터생성
# seq(from = start, to = end, by = increase)
x1 = c(1:10)
print(x1)
x1_1 = seq(to=11, by = 0.5)
print(x1_1)

x2 = c(a1 = 0.1:2.3, a2 = .2)
print(x2)

#rep(반복할 값, 반복횟수)
x2 = rep(2, 10)
print(x2)

x2 = rep(3)
print(x2)
#rep 활용
x2= c(2,2)
print(x2)

x3= rep(c(1,10), 2)
print(x3)

x3 = rep(c(1,10),c(2,3))
print(x3)


# matrix(), data.frame()  // data set 
print(x1)
MR1 = matrix(data = x1, nrow = 2)
print(MR1)

MR2 = data.frame(X1 = x1, x2, x3)
print(MR2)

# index
print(x1)
x1[2:2]

Numeric_Vector = c(1:20)
Chr_Vector = c("A","B","C")

str(Numeric_Vector)
str(Chr_Vector)

str(MR1)
DATE_O = "2018-01-02"
DATE_C = as.Date(DATE_O2, format = "%Y-%m-%d %H:%M:%S")
str(DATE_C)
str(DATE_O)

DATE_O2 = "2015-02-04 00:13:06"
DATE_P = as.POSIXct(DATE_O2, format = "%Y-%m-%d %H:%M:%S")
str(DATE_P)

format(DATE_P,"%S")


