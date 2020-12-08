데이터 프레임 열별로 조인하는 경우

https://www.delftstack.com/ko/howto/python-pandas/how-to-combine-two-columns-of-text-in-dataframe-in-pandas/


import pandas as pd
data = [
    ['Ali',
     'Azmat',
     '30'],
    ['Sharukh',
     'Khan',
     '40'],
    ['Linus',
     'Torvalds',
     '70']
]
df = pd.DataFrame(data,columns=['First','Last','Age'])
df["Full Name"] = df["First"].map(str) + " " + df["Last"]
print(df)
