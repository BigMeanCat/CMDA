# ===========================================================
# David Harter
# CMDA 3654
# In-Class Assignment 5
# October 3, 2014
# ===========================================================

# -----------------------------------------------------------
# PART 1
# -----------------------------------------------------------

# 1. Run iPython
# We open with the terminal command 'iPython --pylab'

# 2. Import modules pandas, numpy and matplotlib
import pandas, numpy, matplotlib


# 3. Select 5 commands from these modules. Find a way to look
# for these function using ? and wildcards.

pandas.scatter_matrix?
# This draws a matrix of scatter plots.

pandas.TimeSeries?
# This creates a one-dimensional ndarray with axis labels,
# including time series.

numpy.*cos*?
""" Returns:
numpy.arccos
numpy.arccosh
numpy.cos
numpy.cosh"""

numpy.cosh?
# This calculates the hyperbolic cosine, element-wise.

numpy.invert?
# This computes the element-wise conversion of ones to zeroes
# and vice-versa of integers in an input array.  In other words,
# the bit-wise NOT.

matplotlib.ascii?
# This returns a string representation of an object.  If the
# object is already a string, it returns the same object.


# 4. Use all the short-cut commands.

# Displays "Welcome to Python!"
%run PythonBasics.py

# I cleared the screen using Ctrl-l, used the up and down
# arrows to scroll the command history.

# Displays u'numpy.invert?'
_i33

# Displays the description of numpy.invert.
_33


# 5. Run all the magic commands.

# Deletes all objects created in this session.
%reset
# Runs the PythonBasics.py script.
%run PythonBasics.py
# Pastes the most recently copied text into the code.
%paste
# Goes to the iPython Quick Reference Card.
%quickref
# Computes average execution time for code.
%timeit
# Displays all input history, even those which produce an error.
%hist
# Returns current working directory.
%pwd
# Changes directory to my class homework folder
%cd Documents/School_Work/CMDA3654
# Shows all files in the current working directory.
%ls


# 6. Use your Inclass4_3, Part I and run snippets of code in
# iPython by copy-paste.

# Create numeric array [1, 2, 3, 4, 5].
the_count = [1, 2, 3, 4, 5]
# Create variable xnum = 4
xnum = 4
# Create string variable "chicken."
chicken = "I will now count my chickens"

# 7. Introspect magic command %xdel, function str.split,
# module re and matplotlib.pylab.

%xdel?
# %xdel is a magic command that removes a single variable from
# anywhere in iPython where it is referenced, including
# references in other names and in the output history.
# The following command will delete xnum and all references
# to it:
xdel xnum

str.split?
# str.split returns a list of words in a given string that
# are separated by a specified delimiter.  If no delimiter
# is specified, str.split uses whitespace (' ') as the
# default.
# The following commands both return:
# ['I', 'will', 'now', 'count', 'my', 'chickens']
chicken.split(' ')
chicken.split()

import re
re?
# The re module is a Python built-in which applies regular
# expressions to strings.  It looks for patterns in text to
# identify matches, perform substitutions, and generate
# splits.  It is imported in the normal way, and its
# commands take the prefix "re."

# The following command returns:
# ['I', 'will', 'now', 'count', 'my', 'chickens']
# The \s+ denotes whitespace separators.
re.split('\s+', chicken)

import pylab
matplotlib.pylab?
# matplotlib.pylab is a library of commands that can be used
# to create and format object-oriented plots.


# 8. Start pylab; build the plot on slide 10; do tab completion
# on numpy.; do introspection on numpy.random; find the line
# about randn. What type of numbers does it generate?

a = numpy.random.randn(100)
plot(a.cumsum())

numpy.random?
numpy.random.randn?
# numpy.random is a random number generator.  The randn command
# is there to specify that the sample be from a Gaussian
# distribution with 100 elements.


# 9. Find out what cumsum does.

numpy.cumsum?
# cumsum returns an array of the cumulative sum of elements
# along a given axis for the specified array.


# 10. How long does it take to generate 100 normally
# distributed random numbers? How about 1000? How about 
# 10,000?  How did you find that out?(hint: run magic command
# timeit)

# Using the three commands:
%timeit numpy.random.randn(100)
%timeit numpy.random.randn(1000)
%timeit numpy.random.randn(10000)
# We find that it takes a minimum of 12.6 microseconds for
# 100 normally distributed random numbers, 99.1 microseconds
# for 1000, and 958 microseconds for 10000.


# -----------------------------------------------------------
# PART 2
# -----------------------------------------------------------

import numpy as np


# 2) Create two one-dimensional array with 5 elements of your
# choice. Display array’s shape and type.
arr1 = np.array([1,2,3,4,5])
arr2 = np.array([9,8,7,6,5])
#
# The following two commands both output: (5,)
np.shape(arr1)
np.shape(arr2)
#
# The following two commands both output: dtype('int64')
arr1.dtype
arr2.dtype


# 3) Do element-wise summation for the two arrays.
#
# The following line outputs: array([10, 10, 10, 10, 10])
arr1 + arr2


# 4) Do element-wise product for the two arrays.
#
# The following line outputs: array([ 9, 16, 21, 24, 25])
arr1 * arr2


# 5) Create a 6X6 identity matrix.
#
# The following line creates a 6x6 identity matrix.
im = np.matrix(np.identity(6))


# 6) Replace all elements on third row with value 5.
#
# The following line replaces all the elements on the third row with
# with the number 5.
im[2,] = 5


# 7) Replace all elements that are not zero with value 6 using 
# boolean indexing and slicing.
#
# The following command finds all values equal to zero in im
# and sets them to six.
im[im == 0] = 6


# 8) Create an empty 3 dimensional array, arr3 with shape (2,3,4),
# and elements of integer type.
#
# Here, the first argument sets the dimensions and the second
# argument sets specifies the type to be signed 32-bit integers.
arr3 = np.empty((2,3,4), dtype = int32)


# 9) Display its number of dimensions, shape and type of each
# element.
#
# Here, the first line gives the output '3', the second line
# gives the output (2, 3, 4), and the third line gives the
# output dtype('int32').
arr3.ndim
arr3.shape
arr3.dtype


# 10) Give the second element on the third dimension, from the
# second group on the second dimension, from the first group on
# the first dimension the value 5.
#
# The following command changes the specified value to 5.
arr3[0,1,1] = 5


# 11) Generate an array of 20 uniformly distributed random
# numbers with values between 0 and 1.
#
# random gives a random distribution, while random_sample(20)
# provides that there are 20 elements in the range [0,1).
arr4 = numpy.random.random_sample(20)


# 12) Get the min, max, sum, mean, and standard deviation of
# the array in part 11.
#
# The following returns the min of arr4: 7.8959451157767369e-05
np.min(arr4)
# The following returns the max: 0.84464208905679994
np.max(arr4)
# The following returns the sum: 9.0533916636550913
np.sum(arr4)
# The following returns the mean: 0.45266924395930458
np.mean(arr4)
# The following returns the std dev: 0.2562118246324252
np.std(arr4)


# 13) Replace all elements less than 0.5 with 0 and all 
# elements larger than 0.5 with 1 in the array from part 11
# using the “where” function.
#
# The following function outputs the array:
# array([0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0,
#        1, 1])
np.where(arr4 < 0.5, 0, 1)


# 14) Sort the array in part 11.
#
# The following puts the values in arr4 in numerical order.
arr4.sort()


# 15) Find the unique values in the same array.
#
# The following displays the entire array, as all the values
# in arr4 are unique.
# array([  7.89594512e-05,  1.00831115e-02,  1.11036409e-01,
#          1.73465286e-01,  2.57229384e-01,  2.96409993e-01,
#          3.09146710e-01,  3.27572402e-01,  4.01648999e-01,
#		   4.86153740e-01,  4.92369555e-01,  5.17024111e-01,
#		   5.35190947e-01,  5.94656049e-01,  6.84221734e-01,
#		   6.86508123e-01,  7.02610620e-01,  8.06577744e-01,
#		   8.16765696e-01,  8.44642089e-01])
unique(arr4)


# -----------------------------------------------------------
# PART 3
# -----------------------------------------------------------

# 1) and 2) finished online


# 3) Create a new ipython notebook, In5_3. Import pandas 
# module. Import Quandl module by “import Quandl”. Since we 
# already have the required NumPy and Pandas modules, it 
# should work for you.
#
import Quandl


# 3) You will import data for Bitcoin exchange rates to USD on
# different venues: Bitstamp, Bitfinex and LakeBTC.
#
seriesBS = Quandl.get("BCHARTS/BITSTAMPUSD", 
	trim_start="2011-09-13", 
	trim_end="2014-10-02", 
	authtoken="izgPWeFG7v_PXzz2wtr9")
#
seriesBF = Quandl.get("BCHARTS/BITFINEXUSD",
    trim_start="2013-03-31", 
    trim_end="2014-10-02", 
    authtoken="izgPWeFG7v_PXzz2wtr9")
#
seriesLB = Quandl.get("BCHARTS/LAKEUSD", 
	trim_start="2014-03-01", 
	trim_end="2014-10-02", 
	authtoken="izgPWeFG7v_PXzz2wtr9")


# 6) View your three created pandas data frames using 
# df_name.head(). What are the column names? What is the 
# frequency of data (daily/weekly/yearly Bitcoin prices)?
#
seriesBS.head()
seriesBF.head()
seriesLB.head()
#
# The column names are Open, High, Low, Close, Volume (BTC),
# Volume (Currency), and Weighted Price.  In each data series,
# the data is collected daily. 


# 7) Create three objects ind1, ind2, and ind3 containing the 
# index of each of the created dataframes.
ind1 = seriesBS.index
ind2 = seriesBF.index
ind3 = seriesLB.index


# 8) Display ind1, ind2, ind3. How many elements are in each?
#
ind1
ind2
ind3
#
# In seriesBS, seriesBF, and seriesLB, there are 1116, 551,
# and 216 elements, respectively.


# 9) Display the .values attribute of each of ind1, ind2, 
# ind3. What type of object is being displayed for each? What
# dtype is each element of the displayed object? 
#
ind1.values
ind2.values
ind3.values
#
# All three are displaying arrays of strings.


# 10) Display the .columns attribute of each DataFrame. How 
# many columns do we have in each?
# 
seriesBS.columns
seriesBF.columns
seriesLB.columns
#
# There are seven columns in each.


# 11) Drop the variable showing BTC volume from each dataframe
# using the .drop method.
#
seriesBS.drop(['Volume (BTC)'], axis=1)
seriesBF.drop(['Volume (BTC)'], axis=1)
seriesLB.drop(['Volume (BTC)'], axis=1)
