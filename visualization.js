# Libraries
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.sankey import Sankey

# basic sankey chart
Sankey(flows=[0.25, 0.15, 0.60, -0.20, -0.15, -0.05, -0.50, -0.10], labels=['', '', '', 'First', 'Second', 'Third', 'Fourth', 'Fifth'], orientations=[-1, 1, 0, 1, 1, 1, 0,-1]).finish()
plt.title("Sankey diagram with default settings")


# 다중막대그래프
https://developer-ankiwoong.tistory.com/204
