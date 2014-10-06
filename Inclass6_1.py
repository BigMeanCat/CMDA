# ===============================================
# David Harter
# CMDA 3654
# In-Class Assignment 6
# October 8, 2014
# ===============================================

# Import the necessary libraries for this assignment.
import pandas as pd
import json
import requests
import numpy as np

# 3) Import data.  For t3, omit first 19 rows and do not use
#    top row for header.  Use spaces as separators.
t1 = pd.read_csv('work_comma.csv')
t2 = pd.read_table('work_tab.txt')
t3 = pd.read_table('stress2_1.txt', 
	skiprows = 19, 
	header = None, 
	sep = '\s+')


# 4) Access gihub API. Extract data and pick 4 random columns
#    to place in data frame.
r = requests.get('https://www.api.github.com/events')
t = r.json()
data_fr = pd.DataFrame(t, np.random.randn(, 4))


# 5) Save data_fr as a pickle and load.
data_fr.to_pickle('data_fr_pickle')
pd.read_pickle('data_fr_pickle')


# 6) Create storage place.  Save data to in HDF5 format. Access
#	 data via storage place.
store = pdf.HDFStore('api_data.h5')
store = ['data_fr'] = data_fr
store['data_fr']