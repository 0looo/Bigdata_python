install.packages('plyr')
library(plyr)

df$satisfaction_level_group1 = ifelse(df$satisfaction_level>0.5,'High','Low')
df$satisfaction_level_group1 = as.factor(df$satisfaction_level_group1)
summary(df$satisfaction_level_group1)

## 2개일때는 2개를 작성
df$satisfaction_level_group2 = ifelse(df$satisfaction_level>0.8, 'High',
                                      ifelse(df$satisfaction_level>0.5, 'Mid','Low'))
df$satisfaction_level_group2 = as.factor(df$satisfaction_level_group2)
summary(df$satisfaction_level_group2)

?subset

df_high <- subset(df, salary=='high')
df_high
summary(df_high)
summary(df_high$salary)

str(df)

str(subset(df, select = -satisfaction_level))
ss <- ddply(df,
            c('sales','salary'), summarise,
            M_SF = mean(satisfaction_level),
            count = length(sales),
            m_wh = round(mean(average_montly_hours),2)            )
ss

head(df, 4)
