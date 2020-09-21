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
