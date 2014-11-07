# ==========================================================
# David Harter
# CMDA 3654
# In-Class Assignment 6
# October 8, 2014
# ==========================================================

# Import the necessary libraries for this assignment.
import pandas as pd
import json
import requests
import numpy as np

# ----------------------------------------------------------
# PART 1
# ----------------------------------------------------------

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


# ------------------------------------------------------------
# PART 2
# ------------------------------------------------------------

# 1) Import your project data using one of the read_csv or 
#    read_table methods for pandas.
tennis = pd.read_csv('Wimbledon-men-2013.csv')


# 2) Describe your dataframe using.describe() method.
tennis.describe()
# This outputs a table of statistics about the data.


# 3) Choose one numeric variable and transform it into 
#    categorical, with 3-5 categories. 
faults1 = tennis['DBF.1']

# Remove all 'nan' entries; replace with zero.
faults1 = faults1.replace('nan', 0)

bins = [0, 3, 6, 9, 12]
fault_rate = pd.cut(faults1, bins, right = False)


# 4) Get the frequencies for the categorical variable
#    created in part 3.
pd.value_counts(fault_rate)
# This returns the table:
# [3, 6)     48
# [0, 3)     46
# [6, 9)     16
# [9, 12)     4
# dtype: int64


# 5) Create an additional variable using mapping and using the
#    categorical variable from part 3. Your map dictionary should
#    have two elements.
fault_map = {0:'low', 1:'low', 2:'high', 3:'high'}
tennis['fRate'] = pd.Series(fault_rate.labels).map(fault_map)


# 6) Rename two columns in your data using .rename.
tennis = tennis.rename(columns = {'FSP.1': '1st.Serve.%.P1', 
	'FSW.1': '1st.Serve.Won.P1'})


# 7) Extract a 50% training set using cut random permutations
#    of rows.
permute = np.random.permutation(114)
sampler = permute[:57]
trainer1 = tennis.take(sampler)


# 8) Extract a second 50% training set.
permute = np.random.permutation(114)
sampler = permute[:57]
trainer2 = tennis.take(sampler)


#9) Combine the two training sets into a third dataframe.
trainer3 = pd.concat([trainer1, trainer2])


# 10) Get rid of duplicate rows by using: 
#     dataframe_name.drop_duplicates(). What percentage of the
#     rows you have left?

trainer3.shape
# The given shape is 117 rows and 43 columns.

trainer3 = trainer3.drop_duplicates()

trainer3.shape
# The given shape is now 86 rows and 43 columns, leaving 
# 73.5% of the original rows.

