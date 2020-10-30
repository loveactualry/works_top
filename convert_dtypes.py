# 판다스에서 데이터를 불러오면 숫자형만 분리되고 나머지는 object형태로 나오는 경우가 다수 발생
# R에서는 readr을 사용하면 어느정도 데이터 타입을 지정해주고 필요한 형태만 변경 가능
# 판다스에서는 이 작업을 변수 마다마다 하고 있었음......

df.convert_dtypes()

# 명령어.

#  float,int64 등등 잘 잡아줌.

df = pd.read_csv('',header=True).covert_dtypes()
