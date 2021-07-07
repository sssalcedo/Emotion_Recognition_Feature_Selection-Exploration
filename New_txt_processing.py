#Processing of the txt files without _ and with wav format
#fileformat example: p17amaewav.txt
import os
import re
import numpy as np
import pandas as pd
txt_path='Output2/'
txt_list=os.listdir(txt_path)
Name_list=[]
name_list=[]

for txt in txt_list:
    temp = re.compile("([0-9]+)([a-zA-Z]+)")  #filename splitter
    Name_list.append(txt[1:-7])

for i,j in zip(Name_list, txt_list):
    res = temp.match(i).groups() 
    os.rename(r'Output2\p' + j[1:],r'Output3\p' + res[0] +'_'+res[1]+'.txt')
