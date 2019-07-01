#!/usr/bin/env python
# coding: utf-8

# In[9]:


get_ipython().run_line_magic('run', '-i CouplingsModel_1.py')
import matplotlib.pyplot as plt
direc = '/home/as974/ada'


# In[3]:


correctedModel = CouplingsModel_1(direc+'/repeatsProject/PF00023/cOutput/PF00023.model')


# In[11]:


plt.imshow(correctedModel.cn_scores)


# In[13]:


uncorrectedModel = CouplingsModel_1(direc+'/repeatsProject/PF00023/cOutput/PF00023_no_correction.model')


# In[14]:


plt.imshow(uncorrectedModel.cn_scores);


# In[24]:


def plot_top_n(z,n):
    z[z<np.sort(z.flatten())[::-1][n-1]] = 0
    plt.imshow(z)


# In[25]:


plot_top_n(uncorrectedModel.cn_scores,100)


# In[26]:


plot_top_n(correctedModel.cn_scores,100)

