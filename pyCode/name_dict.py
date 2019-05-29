import re
import pandas as pd

name_dict={}
df_repweights = pd.load_csv('~/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/rCode/weights.txt')
seq_name = df_repweights