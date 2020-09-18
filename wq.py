https://stackoverflow.com/questions/53605744/how-to-split-based-on-multiple-delimiter-pandas

file = open(r"D:\wq\bdp\com\kjeng\silvercloud\concatenate_texts.txt", "r")
strings = file.readlines()
file.close()

tot = pd.DataFrame(strings, columns=['a'])

tot_sp = tot.a.str.split(',|!|\$|\n', expand=True).add_prefix('Number_')
