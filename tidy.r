# 비즈니스 관련 분석은 이 이정도에서 가능

a <-  1
a
b <- 2
b
c <- 3
c
d <- 3.5
d
a+b
a+b+c
4/b
5*b
var1 <-  c(1,2,5,7,8)
var1
var2 <- c(1:5)
var2
var3 <- seq(1,5)
var3
var4 <- seq(1, 10, by=2)
var4

var5 <- seq(1,10, by=3)
var5
var1
var1+2
var1+var2
var1

str1 <- "a"
str1
str2 <- "text"
str2
str3 <- "Hello World"
str3
str4 <- c("a","b","c")
str4
str5 <- c("Hello!", "World", "is", "good!")
str5
str1+2

x <- c(1, 2, 3)
x
mean(x)

max(x)
min(x)
str5
paste(str5, collapse = ",")
paste(str5, collapse = " ")

x_mean <- mean(x)
x_mean

str5_paste <- paste(str5, collapse = " ")
str5_paste


install.packages("ggplot2")
library(ggplot2)
x <- c("a", "a", "b", "c")
x
qplot(x)

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)
?qplot

test <- c(80,60,70,50,90)
test
mean(test)
test_mean <- mean(test)
test_mean

english　<- c(90, 80, 60, 70)
english

math <- c(50,60,100,20)
math

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english=c(90,80,60,70),
                        math = c(50, 60, 100, 20),
                        class = c(1, 1, 2, 2))
df_midterm

df_fruit <- data.frame(제품 = c('사과','딸기','수박'),
                       가격 = c(1800, 1500, 3000),
                       판매량 = c(24, 38, 13))
df_fruit
mean(df_fruit$가격)
mean(df_fruit$판매량)

install.packages('readxl')
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam
df_exam <- read_excel("d:/easy_r/excel_exam.xlsx")
df_exam
mean(df_exam$english)
mean(df_exam$science)
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_csv_exam

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv")

saveRDS(df_midterm, file = "df_midterm.rds")
rm(df_midterm)
df_midterm
df_midterm <- readRDS("df_midterm.rds")
df_midterm

exam <- read.csv('csv_exam.csv')
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam)[2]
str(exam)
summary(exam)


install.packages("ggplot2")
library(ggplot2)


mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
?mpg
summary(mpg)

df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw
df_new
df_new <- rename(df_new, v2 = var2)
df_new

mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg

mpg_copy <- rename(mpg_copy, city = cty, highway = hwy)
mpg_copy
head(mpg_copy)

df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1 + df$var2)/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)

summary(mpg$total)
hist(mpg$total)


mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
table(mpg$test)

library(ggplot2)
qplot(mpg$test)


mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg,10)
table(mpg$grade)
qplot(mpg$grade)

mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))
head(mpg)



midwest <- as.data.frame(ggplot2::midwest)
str(midwest)

mw <- midwest

mw <- rename(mw, total = poptotal, asian = popasian)
head(mw)

mw$asianprop <- mw$asian / mw$total

hist(mw$asianprop)

mean(mw$asianprop)

mw$meanasian <- ifelse(mw$asianprop >= 0.0048 , "large", "small")

table(mw$meanasian)
qplot(mw$meanasian)

exam <- read.csv('csv_exam.csv')
exam
str(exam)

exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 5)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <90 | science < 50)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)
mean(class2$math)

library(tidyverse)

mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg

displ5 <- mpg_copy %>% filter(displ >= 5)
displ4 <- mpg_copy %>% filter(displ <= 4)

mean(displ5$hwy)
mean(displ4$hwy)

manaudi <- mpg_copy %>% filter(manufacturer == "audi")
mantoyota <- mpg_copy %>% filter(manufacturer == "toyota")

mean(manaudi$cty)
mean(mantoyota$cty)

manth <- mpg_copy %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(manth$hwy)

exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

exam %>% select(-math)
exam %>% select(-math, -english)
exam %>% filter(class == 1) %>% select(english)


exam %>% 
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)

mpg_cl_ct <- mpg_copy %>% select(class, cty)

mpg_suv <- mpg_copy %>% filter(class == "suv") %>% select(cty)
mpg_compact <- mpg_copy %>% filter(class == "compact") %>% select(cty)
mean(mpg_suv$cty)
mean(mpg_compact$cty)
mean

library(tidyverse)
library(ggplot2)

exam %>% arrange(math)
exam %>% arragne(desc(math))
exam %>% arragne(class, math)


mpg <- as.data.frame(ggplot2::mpg)

head(mpg %>% filter(manufacturer == "audi") %>% arrange(hwy))

head(mpg)

exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head

exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

mpg_c <- mpg
mpg_c <- mpg_c %>% mutate(total = hwy + cty)
mpg_c %>% head
mpg_c <- mpg_c %>% mutate(mean = total / 2)

mpg_c %>% arrange(mean) %>% head(3)

mpg %>% mutate(total = hwy + cty,
               mean = total / 2) %>% 
  arrange(mean) %>% 
  head(3)

exam %>%  summarise(mean_math = mean(math)) 

exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math),
           sum_math = sum(math),
           median_math = median(math),
           n = n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

mpg %>% group_by(class) %>% 
  summarise(mean = mean(cty)) %>% 
  arrange(desc(mean))

mpg %>% group_by(manufacturer) %>% 
  summarise(mean = mean(hwy)) %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg %>% filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))
  
test1 <- data.frame(id = c(1, 2, 3, 4, 5), 
                    midterm = c(60, 80, 70, 90, 85))

test2 <- data.frame(id = c(1, 2, 3, 4, 5), 
                    final = c(70, 83, 65, 95, 80))
test1
test2

total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_a
group_b

group_all <- bind_rows(group_a, group_b)
group_all

head(mpg)

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_f1 = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
str(fuel)

left_join(mpg, fuel, by = "fl") %>% 
  select(model, fl, price_f1) %>% 
  head

midwest <- as.data.frame(ggplot2::midwest)

head(midwest)

midwest_c <- midwest

midwest_c <- midwest_c %>% mutate(prop = popadults / poptotal)

midwest_c %>% arrange(desc(prop)) %>%   
  head(5)

midwest_c <- midwest_c %>% 
  mutate(grade = ifelse(prop >= 0.4 ,"large", 
                        ifelse(prop >= 0.3, "middle", "small")))
table(midwest_c$grade)

midwest %>% 
  mutate(ratio_asian = (popasian / poptotal) * 100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

is.na(df)
table(is.na(df))

table(is.na(df$sex))
table(is.na(df$score))





