install.packages("tidyverse")
library(tidyverse)

getwd()
setwd('C:/Users/DNI_210702/Downloads/0723 업무지시')
list.files()


## read.csv
## read.table
install.packages("readxl")
library('readxl')

df4 <- read_xlsx("(TOTAL)아마존 데이터_'21 04_06.xlsx", sheet =4, skip =1)
df5 <- read_xlsx("(TOTAL)아마존 데이터_'21 04_06.xlsx", sheet =3, skip =1)
df6 <- read_xlsx("(TOTAL)아마존 데이터_'21 04_06.xlsx", sheet =2, skip =1)

review_data <-read_xlsx("OSM_1_6월 SKU별 리뷰 수_Amazon_US.xlsx")


## View  ==> 클릭하는 것과 동일
View(df4)
str(df4)


review_data$no <- as.character(review_data$no)
str(review_data)

str(df4)
df4$Date <- as.Date(as.character(df4$Date), format="%Y%m%d")
str(df4)

df4$Category <- as.factor(df4$Category)

# tibble 정리 필요

# col명 변경
names(df4)
names(df4)[1] <-  "yyyymmdd"
names(df4)

# complete.case 정리 필요

# df456 (merge) 생성
str(df456)
str(df5)
names(df5)[1] <-  'Date'
df456 <-rbind(df4,df5,df6)

# df456 & review_data merge
str(review_data)

str(df456)
df456$Date <- as.POSIXct(df456$Date, format="%Y%m%d" )
str(df456)

df <- left_join(df456, review_data, by = c('ASIN' = 'rpc'))
str(df)

## 참고 merge < join  (속도)
?merge
df <- merge(df456, review_data, by.x = c("Date"), by.y= c("report_date"))

str(df456)
str(review_data)
## rm(list=is())  ==> Data 모두제거

df456$Date
review_data$report_date
as.POSIXct(df456$Date, format="%Y%m%d", "UTC")
?as.POSIXct


#aggreagate 정리필요
?aggregate

# attach  => 데이터 frame 지정가능


# R 프로그래밍 자습

z = 5.3 + 15i
z
Re(z)
Im(z)


## mode, class 차이 정리필요
