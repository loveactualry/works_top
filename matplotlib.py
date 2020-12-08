
#https://big-blog.tistory.com/773

#matplot lib x 축 custom 수정

#수정하려는 축이 object형이 아닌지 확인
#object면 int 혹은 floast로 변경

import matplotlib.pyplot as plt
import matplotlib.ticker as plticker

x = [0,5,9,10,15]
y = [0,1,2,3,4]
fig, ax = plt.subplots()
ax.plot(x,y)
loc = plticker.MultipleLocator(base=1.0) # this locator puts ticks at regular intervals
ax.xaxis.set_major_locator(loc)
plt.show()



# 그래픽 관련
from matplotlib import font_manager, rc
import matplotlib as mpl
import matplotlib.pyplot as plt
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)
# 마이너스 발생 시
mpl.rcParams['axes.unicode_minus'] = False
