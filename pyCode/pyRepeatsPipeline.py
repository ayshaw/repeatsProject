# importing packages
import re
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys

def scale_01(a):
    return (a - np.min(a))/np.ptp(a)

# PARAMETERS: command line
pfam_dir = sys.argv[1]
pfam = sys.argv[2]
try:
    os.mkdir(pfam_dir+'/pyOutput/')
except: 
    print('pyOutput directory already exists')
try: 
    os.mkdir(pfam_dir+'/cOutput/')
except:    
    print('cOuptut directory already exists')
    
# INPUT: PF0023_weights_py_input.txt
df_repweights = pd.read_csv(pfam_dir+'/rOutput/'+pfam+'_weights_py_input.txt',header=None,delimiter='\s',names=['names','weights'])
df_repweights['names'] = df_repweights['names'].str.replace('"','')
df_repweights['sequence_id'] = df_repweights['names'].str.split(r"/[\d']",n=1,expand=True)[0]
tmp = 'whatever'
tmp2 = np.zeros_like(df_repweights.weights.values,dtype=int)
print('number of sequences: {}'.format(len(tmp2)))
num = 0
for (index,row) in df_repweights.iterrows():
        if row.sequence_id != tmp:
            num = 0
            tmp = row.sequence_id
        num += 1
        tmp2[index] = num
df_repweights['repeat_num'] = tmp2

############ _uncomment for PF00023_ ###########
# df_repweights['new_names'] = df_repweights['sequence_id'].map(str) +'_'+ df_repweights['repeat_num'].map(str)+'/1-64'
# name_dict=dict(zip(df_repweights.names.values,df_repweights.new_names.values))
############ ^uncomment for PF00023^ ###########

## OUTPUT: PF00023_newname_weights.txt
df_repweights[['names','weights']].to_csv(pfam_dir+'/pyOutput/'+pfam+'_newname_weights.txt',header=None,index=False)

## OUTPUT: PF00023_weights_plm_input.txt
df_repweights['weights'] = scale_01(df_repweights.weights.values)
df_repweights[['weights']].to_csv(pfam_dir+'/pyOutput/'+pfam+'_weights_plm_input.txt',header=None,index=False)

## INPUT: PF0023_2reps_py_input.txt
msa_file = pfam_dir + '/rOutput/' + pfam + '_2reps_py_input.txt'
with open(msa_file,'r') as file:
    all_lines = file.readlines()
    
############ _uncomment for PF00023_ ###########
# for (index,lines) in enumerate(all_lines):
#     if lines.startswith('>'):
#         all_lines[index] = all_lines[index].replace(all_lines[index][1:-1],name_dict[all_lines[index][1:-1]])
############ ^uncomment for PF00023^ ###########

## OUTPUT: PF00023_2reps_plm_input.txt
with open(directory + pfam_dir + '/pyOutput/' + pfam + '_2reps_plm_input.txt','w') as file:
    file.writelines(all_lines)
    
# INPUT: PF0023_weights_py_input.txt
df_henirepweights = pd.read_csv(directory+pfam_dir+'/rOutput/'+pfam+'_heniweights_py_input.txt',header=None,delimiter='\s',names=['names','weights'])
df_henirepweights['names'] = df_henirepweights['names'].str.replace('"','')
df_henirepweights['sequence_id'] = df_henirepweights['names'].str.split(r"/[\d']",n=1,expand=True)[0]
tmp = 'whatever'
tmp2 = np.zeros_like(df_henirepweights.weights.values,dtype=int)
print('number of sequences: {}'.format(len(tmp2)))
num = 0

df_henirepweights['weights'] = scale_01(df_henirepweights.weights.values)

for (index,row) in df_henirepweights.iterrows():
        if row.sequence_id != tmp:
            num = 0
            tmp = row.sequence_id
        num += 1
        tmp2[index] = num
df_henirepweights['repeat_num'] = tmp2

############ _uncomment for PF00023_ ###########
#df_henirepweights['new_names'] = df_henirepweights['sequence_id'].map(str) +'_'+ df_henirepweights['repeat_num'].map(str)+'/1-64'
#name_dict=dict(zip(df_henirepweights.names.values,df_henirepweights.new_names.values))
############ ^uncomment for PF00023^ ###########

## OUTPUT: PF00023_heniweights_plm_input.txt
df_henirepweights[['weights']].to_csv(directory+pfam_dir+'/pyOutput/'+pfam+'_heniweights_plm_input.txt',header=None,index=False)