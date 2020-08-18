library(tidyverse)

data %>% group_by(val1) %>% count() %>% pivot_wider(va1_1, n)..


mtcars$name <- row.names(mtcars)



mtcars %>% 

  select(name, mpg, cyl, hp) %>% 

  mutate(

    type = case_when(

      cyl >= 8 | hp >= 180 ~ "big",          # or

      cyl >= 4 & hp >= 120 ~ "medium", # and

      TRUE ~ "small"

    )

  )



## 출처: https://rfriend.tistory.com/522 [R, Python 분석과 프로그래밍의 친구 (by R Friend)]


ggplot(data, aes(x,y,colour=z)) + geom_point()

힘들다.


library(tidyverse)
library(readr)
library(lubridate)
library(scales)
library(plotly)



appr <- read_csv('1')
canc <- read_csv('1')
rqch <- read_csv('1')
rgch <- read_csv('1')


appr$YMD <- format(as.Date(appr$REQDT), "%Y-%m-%d")
canc$YMD <- format(as.Date(canc$REQDT), "%Y-%m-%d")
rqch$YMD <- format(as.Date(rqch$REQDT), "%Y-%m-%d")
rgch$YMD <- format(as.Date(rgch$REQDT), "%Y-%m-%d")

rqch$YMD_G <- format(as.Date(rqch$REGDT), "%Y-%m-%d")
rgch$YMD_G <- format(as.Date(rgch$REGDT), "%Y-%m-%d")

appr$YM <- format(as.Date(appr$REQDT), "%Y-%m")
canc$YM <- format(as.Date(canc$REQDT), "%Y-%m")
rqch$YM <- format(as.Date(rqch$REQDT), "%Y-%m")
rgch$YM <- format(as.Date(rgch$REQDT), "%Y-%m")

rqch$YM_G <- format(as.Date(rqch$REGDT), "%Y-%m")
rgch$YM_G <- format(as.Date(rgch$REGDT), "%Y-%m")



# 환율 정보 - 2020년 7월 28일 기준

cur <- read_csv('C:/work/2_RM/2_work/20200728_차지백/currency.csv')
cbcur <- cur
cbcur <- rename(cbcur, "CBCURRENCY"="CURRENCY")
apcur <- rename(cur, "APPRVCURRENCY"="CURRENCY")

### 환율
## 환율 정보 조인
appr <- appr %>% inner_join(apcur, by = "APPRVCURRENCY")
canc <- canc %>% inner_join(apcur, by = "APPRVCURRENCY")
rqch <- rqch %>% inner_join(cbcur, by = "CBCURRENCY")
rgch <- rgch %>% inner_join(cbcur, by = "CBCURRENCY")

## 환율 곱하기 tot로 산출
appr$krwcur <- appr$APPRVAMOUNT * appr$CUR_VALUE
canc$krwcur <- canc$APPRVAMOUNT * canc$CUR_VALUE
rqch$krwcur <- rqch$CBAMOUNT * rqch$CUR_VALUE
rgch$krwcur <- rgch$CBAMOUNT * rgch$CUR_VALUE

## 일부 변수 선택
appr_1 <- appr %>%  select(1, 2, YMD, 2, krwcur)
canc_1 <- canc %>%  select(TRANSNO, 3, TRANSTYPE, YMD, *, krwcur)
rgch_1 <- rgch %>% select(*, *, YMD, YMD_G, YM, YM_G, STATUS, *, krwcur)
rqch_1 <- rqch %>% select(*, TRANSNO, *, *, YM, *, *, CBTYPE, *)

## left join
canc_j <- left_join(appr_1, canc_1 ,by = c('TRANSNO' = 'ORGTRANSNO'))

## rename
canc_j <- rename(canc_j, 
                 TRYPE_A = "TRANSTYPE.x",
                 YMD_A = "YMD.x",
                 YM_A = "YM.x",
                 krwcur_A = "krwcur.x",
                 TRANSNO_C = "TRANSNO.y",
                 TRYPE_C = "TRANSTYPE.y",
                 YMD_C = "YMD.y",
                 YM_C = "YM.y",
                 krwcur_C = "krwcur.y",
)

##### 취소 승인건 조인
req_j <- left_join(canc_j, rqch_1, by = c('TRANSNO' = 'TRANSNO'))
req_j$krwcur
req_j$krwcur[is.na(req_j$krwcur)] <- 0
req_j$krwcur_C[is.na(req_j$krwcur_C)] <- 0

# cb 따로 빼주는 방식
# req_j_1 <- req_j %>% 
#     mutate(
#         residual = case_when(
#             CBTYPE == "V201" ~ req_j$krwcur_A - req_j$krwcur ,
#             
#             is.na(CBTYPE) ~ req_j$krwcur_A - req_j$krwcur_C,
#             
#             TRUE ~ 0
#             
#         )
#     )
# residual 값을 cb 값도 같이 빼줘야함 취소가 2개 겹쳐 있는 경우가 있나.. 암튼 그럼..
req_j_1$residual <- req_j_1$krwcur_A - req_j_1$krwcur_C - req_j_1$krwcur

# CB type 확인
req_j_1 %>% filter(CBTYPE == "V201")
# req_j$resi <- req_j$krwcur_A - req_j$krwcur_C - req_j$krwcur

req_j_2 <- req_j_1 %>% select(TRANSNO, YMD_A, YM_A, krwcur_A, krwcur_C, krwcur, residual)
req_j_2
req_j_2 <- rename(req_j_1, 
                  rqcb = "krwcur",
)

req_sum <- req_j_2 %>% group_by(YMD_A) %>%  summarise(sum(krwcur_A), sum(krwcur_C), sum(rqcb), sum(residual))
req_sum
req_sum <- rename(req_sum, 
                  rqcb = "sum(rqcb)",
                  residual = "sum(residual)",
                  krwcur_C = "sum(krwcur_C)",
                  krwcur_A = "sum(krwcur_A)"
)

# req_sum$val <- req_sum$krwcur_A - req_sum$krwcur_C - req_sum$rqcb 

req_sum$YM <- format(as.Date(req_sum$YMD_A), "%Y-%m")
req_sum$W <- week(req_sum$YMD_A)
req_sum <- transform(req_sum,W = sprintf("%02d", W))
req_sum$Y <- year(req_sum$YMD_A)
req_sum$M <- month(req_sum$YMD_A)

req_sum <- unite(req_sum, "YW", c(Y, W), sep="-")
req_sum <- as_tibble(req_sum)
req_sum

## 월별 주별

# 주별
week_sum <- req_sum %>% group_by(YW) %>% summarise(sum(krwcur_A), sum(krwcur_C), sum(rqcb), sum(residual)) %>% arrange((YW))
week_sum <- rename(week_sum, 
                   rqcb = "sum(rqcb)",
                   residual = "sum(residual)",
                   krwcur_C = "sum(krwcur_C)",
                   krwcur_A = "sum(krwcur_A)"
)

# 주별 비율 계산

week_sum$res_ratio <- round(week_sum$residual / week_sum$krwcur_A, digits = 3) # 잔액
week_sum$canc_ratio <- round(week_sum$krwcur_C / week_sum$krwcur_A, digits = 3) # 취소
week_sum$rqcb_ratio <- round(week_sum$rqcb / week_sum$krwcur_A, digits = 3) # 승인일CB


# 퍼센트 생성
week_sum$res_ratio_100 <- week_sum$res_ratio * 100 # 잔액 * 100
week_sum$canc_ratio_100 <- week_sum$canc_ratio * 100 # 취소 * 100
week_sum$rqcb_ratio_100 <- week_sum$rqcb_ratio * 100 # CB * 100

week_sum

# 그래프를 위해 개별 저장
week_sum_amt <- week_sum %>% select(YW, residual, krwcur_C, rqcb)
week_sum_rat <- week_sum %>% select(YW, res_ratio_100, canc_ratio_100, rqcb_ratio_100)

week_sum_rat <- week_sum %>% select(YW, (res_ratio_100), (canc_ratio_100), (rqcb_ratio_100))



# 월별
month_sum <- req_sum %>% group_by(YM) %>% summarise(sum(krwcur_A), sum(krwcur_C), sum(rqcb), sum(residual)) %>% arrange((YM))
month_sum <- rename(month_sum, 
                    rqcb = "sum(rqcb)",
                    residual = "sum(residual)",
                    krwcur_C = "sum(krwcur_C)",
                    krwcur_A = "sum(krwcur_A)"
)

# 월별 비율 계산

month_sum$res_ratio <- round(month_sum$residual / month_sum$krwcur_A, digits = 3) # 잔액
month_sum$canc_ratio <- round(month_sum$krwcur_C / month_sum$krwcur_A, digits = 3) # 취소
month_sum$rqcb_ratio <- round(month_sum$rqcb / month_sum$krwcur_A, digits = 3) # 승인일CB
month_sum

month_sum$res_ratio_100 <- month_sum$res_ratio * 100 # 잔액 * 100
month_sum$canc_ratio_100 <- month_sum$canc_ratio * 100 # 취소 * 100
month_sum$rqcb_ratio_100 <- month_sum$rqcb_ratio * 100 # CB * 100


month_sum_amt <- month_sum %>% select(YM, residual, krwcur_C, rqcb)
month_sum_rat <- month_sum %>% select(YM, res_ratio_100, canc_ratio_100, rqcb_ratio_100)

# 월별 그래프


# 그래프 용 데이터 작성
week_sum_amt_tidy <- gather(week_sum_amt, 'residual', 'krwcur_C', 'rqcb', key="type", value = "value")
month_sum_amt_tidy <- gather(month_sum_amt, 'residual', 'krwcur_C', 'rqcb', key="type", value = "value")
week_sum_rat_tidy <- gather(week_sum_rat, 'res_ratio_100', 'canc_ratio_100', 'rqcb_ratio_100', key="type", value = "value")
month_sum_rat_tidy <- gather(month_sum_rat, 'res_ratio_100', 'canc_ratio_100', 'rqcb_ratio_100', key="type", value = "value")


# 주별 누적 그래프 

ggplot(week_sum_amt_tidy, aes(YW, value, fill=type)) + geom_bar(stat='identity')
ggplot(week_sum_rat_tidy, aes(YW, value, fill=type)) + geom_bar(stat='identity')


# 월별 n번째 주

https://stackoverflow.com/questions/25199851/r-how-to-get-the-week-number-of-the-month
