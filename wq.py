https://stackoverflow.com/questions/53605744/how-to-split-based-on-multiple-delimiter-pandas

file = open(r"D:\wq\bdp\com\kjeng\silvercloud\concatenate_texts.txt", "r")
strings = file.readlines()
file.close()

tot = pd.DataFrame(strings, columns=['a'])

tot_sp = tot.a.str.split(',|!|\$|\n', expand=True).add_prefix('Number_')


문자열 다루기

https://yganalyst.github.io/data_handling/memo_9/

날짜 처리

https://m.blog.naver.com/PostView.nhn?blogId=wideeyed&logNo=221603462366&proxyReferer=https:%2F%2Fwww.google.com%2F

결측치 드롭
https://rfriend.tistory.com/263?category=675917
https://m.blog.naver.com/youji4ever/221712578078

loc, iloc 선택
http://blog.naver.com/PostView.nhn?blogId=rising_n_falling&logNo=221622971970&parentCategoryNo=12&categoryNo=15&viewDate=&isShowPopularPosts=false&from=postView

문자열 치환
https://ponyozzang.tistory.com/334

list comprehension 치환
https://www.geeksforgeeks.org/python-replace-substring-in-list-of-strings/

reset_index
https://datascienceschool.net/view-notebook/a49bde24674a46699639c1fa9bb7e213/

  
  날짜 처리
  
 https://predictors.tistory.com/26

  
  
  - 특정 셀 카운트하기
  df2 <- df %>% pivot_longer(
    cols = starts_with("special"),
    names_to = "special_rights",
    names_prefix = "special",
    values_to = "count",
    values_drop_na = TRUE
  ) %>% select(passed_count, count)
df2




# 금액 추출
df_res_null$최근입찰결과_1_content <- str_replace_all(df_res_null$최근입찰결과_1_content, ',', '')
#df_res_null$최근입찰가 <- grep('[1-9]',df_res_null$최근입찰결과_1_content) 
df_res_null$매각가 <- gsub("[[:punct:]|[:alpha:]]", "", df_res_null$최근입찰결과_1_content)


# 물건비고 " " 붙이기
#df_res_null$물건비고_수정 <- paste(df_res_null$물건비고, sep = " ")
#df_res_null$symbol <- '"'
df_res_null$물건비고_수정 <- paste(c('"'), df_res_null$물건비고, c('"'), sep = "")


# mysql 정규 표현식
https://intro0517.tistory.com/171

  
  # sql
  substring_index(substring_index(CONTENT, ',', 2),',',-1) COL2,

SELECT category, 
	   SUBSTRING_INDEX(category , ',', 1) category1,
	   SUBSTRING_INDEX(SUBSTRING_INDEX(category, ',', 2), ',', -1) category2,
	   substring_index(substring_index(category, ',', 3),',',1) category3
FROM products p 
;


WITH w1 AS (SELECT'A,BB,CCC,DDDD,EEEEE' AS c1 FROM DUAL)
SELECT c1,
		REGEXP_SUBSTR(C1, '[^,]+', 1, 1) AS C1,
		REGEXP_SUBSTR(C1, '[^,]+', 1, 2) AS C2
		FROM w1
;

### , 분리하기 전 , 개수 세기
# REGXEP_COUNT 를 사용하면 되나 현재 버전 혹은 시스템에서 deny가 되어 길이를 세는 것으로 사용
SELECT 
	MAX(LENGTH(category) - LENGTH(REPLACE(category, ',', ''))+1)
FROM 
	products p2
;

#### , 분리. 가변은 되지 않고 일일이분리해줘야 함
SELECT category ,
	REGEXP_SUBSTR(category, '[^,]+', 1, 1) AS C1,
	REGEXP_SUBSTR(category, '[^,]+', 1, 2) AS C2,
	REGEXP_SUBSTR(category, '[^,]+', 1, 3) AS C3
FROM 
	products p2 
;

SELECT category ,
		LENGTH(category) - LENGTH(REPLACE (category, ',')) AS C2,
		LENGTH (TRANSLATE (category, ',' || category, ',')) AS C3,
		REGEXP_COUNT (category, ',') AS C4
	FROM 
	products p
	;
	

SELECT CATEGORY  ,
		REGEXP_COUNT(category, ',') cnt
FROM products p2 
;


SELECT 
	MAX(LENGTH(category) - LENGTH(REPLACE(category, ',', ''))+1)
FROM 
	products p2
;

SELECT v
     , REPLACE(SUBSTR(v, INSTR(v, '(') +1), ')', '') x1
     , REPLACE(SUBSTRING_INDEX(v, '(', -1), ')', '') x2
  FROM (SELECT 'EXAMPLE- HH ALARM (0.00)' v) a

  
  SELECT
  	replace(substr(latest_bid_result, INSTR(latest_bid_result))
  from products p 
  
  
  SELECT
  	REGEXP_REPLACE(json_unquote(latest_bid_result -> '$."1".content','[a-z]', "") as table1
  FROM 
  products p 
  WHERE table1 regexp '^[0-9]+$'
  ;
 
 SELECT 
(json_unquote(latest_bid_result -> '$."1".content'))
 FROM 
 products p 
   WHERE (json_unquote(latest_bid_result -> '$."1".content')) regexp '^[0-9]+$'
 ;
 
SELECT 
REGEXP_REPLACE(json_unquote(latest_bid_result -> '$."1".content'),'[a-z]','[0-9]', "")
FROM products p
;

SELECT 
	replace(SUBSTR(json_unquote(latest_bid_result -> '$."1".content'), INSTR(json_unquote(latest_bid_result -> '$."1".content'), '(') +1), ')', '')
from products p2 
;


SELECT 
	REGEXP_REPLACE(json_unquote(latest_bid_result -> '$."1".content'), '[가-힣(),]',"")
FROM 
products p2 
;

  
 
