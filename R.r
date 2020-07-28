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
