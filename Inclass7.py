# ===========================================================
# David Harter
# CMDA3654
# In-Class Assignment 7
# October 20, 2014
# ===========================================================

# Switch to working directory.
cd Documents/School_Work/CMDA3654/CMDA3654

# Import necessary libraries.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# -----------------------------------------------------------
# PART 1
# -----------------------------------------------------------

# 2) Use the data for your project as a panda dataframe.
tennis = pd.read_csv('Wimbledon-men-2013.csv', header = False)

# 3) For suitable variables, plot :  a. a histogram; b. a density plot; c. a bar chart; 
#    d. a horizontal stacked bar chart with categories summing to 1; e. a scatterplot.
# 4) Save all figures as png in your working directory.

aces = tennis['ACE.1']

# For the next 5 entries, we complete the requirements for 3 and 4 in one block.

# a. Histogram
# Make histogram with labels and title, then save.
wimHist = aces.hist(bins = 28)
plt.xlabel('Number of Aces')
plt.ylabel('Frequency')
plt.title('Aces for Player 1')
wimHist.get_figure().savefig("WimHistogram.png")


# b. Density Plot
# Make density plot with labels and title, then save.
wimDensity = aces.plot(kind = 'kde')
plt.xlabel('Number of Aces')
plt.ylabel('Relative Frequency')
plt.title('Aces for Player 1')
wimDensity.get_figure().savefig("WimDensity.png")


# c. Bar Chart
# Create smaller set of data.
round3 = tennis[tennis['Round'] == 3]
acesR3p1 = round3['ACE.1']

# Plot bar chart with labels and title, then save.
wimBar = acesR3p1.plot(kind = 'bar')
plt.xlabel('Game Number')
plt.ylabel('No. Aces, P1')
plt.title('Aces for Player 1, Round 3')
wimBar.get_figure().savefig("WimBar.png")


# d. Stacked Horizontal Bar Chart with Normalized Frequencies
# Create additional set of data.
acesR3p2 = round3['ACE.2']
allAces = {'R3.Aces.P1' : acesR3p1, 'R3.Aces.P2' : acesR3p2}

# Merge sets into single dataframe.
round3aces = pd.DataFrame(allAces)

# Normalize frequencies
r3a_rel = round3aces.div(round3aces.sum(1).astype(float), axis = 0)

# Make stacked horizontal bar chart with labels and title, then save.
wimStack = r3a_rel.plot(kind = 'barh', stacked = True)
plt.xlabel('Number of Aces')
plt.ylabel('Game Number')
plt.title('Aces for Round 3')
wimStack.get_figure().savefig("WimStackedBar.png")


# e. Scatterplot
# Make scatterplot with labels and title, then save.
wimScat = plt.scatter(acesR3p1, acesR3p2)
plt.title('Round 3 Aces')
wimScat.get_figure().savefig("WimScatter.png")


# -----------------------------------------------------------
# PART 2
# -----------------------------------------------------------

import scipy as sp
import sklearn as sk

# 2. Download Medical.csv from scholar/Data and import it as
#    a pandas dataframe. 
med = pd.read_csv('Medical.csv')


# 3. Wrangle your data with pandas. Keep features “age” and 
#    “HgA1c”. Create target variable literacy with levels 
#    0 =“low literacy” and 1 = “high literacy” based on the 
#    dataframe’s variable “literacy” with levels “low” and 
#    “high”.
# 4. Set up the numpy arrays X and y.
#
# Set up X.
X = np.array(med[['Age', 'HgA1C']])
#
# Create map for y.
lit_map = {'LOW':0, 'HIGH':1}
#
# Create array y by mapping "A Literacy Category" to the map.
y = np.array(med['A Literacy Category'].map(lit_map)).astype(float)


# 5. Take a 75% training set and a 25% testing set using the
# scikit-learn capabilities.
#
# Import the necessary function to create the sets.
from sklearn.cross_validation import train_test_split
#
# Create the training and testing sets with the specified split and with a
# random number range of 0-49 to match the data.
X_train, X_test, Y_train, Y_test = train_test_split(X, y, 
	test_size = 0.25, random_state = 50)


# 6. Scale your features.
#
# Import the necessary function for scaling.
from sklearn.preprocessing import StandardScaler
#
# Find the appropriate scaler for the X_train data.
scalerX = StandardScaler().fit(X_train)
#
# Fit X_train and X_test to this scale.
X_train = scalerX.transform(X_train)
X_test = scalerX.transform(X_test)


# 7. Train the classifier. Write out the classifier’s equation.
#
# Import the classifier function.
from sklearn.linear_model import SGDClassifier
#
# Abbreviate the classifier function and perform a fit.
clf = SGDClassifier()
clf.fit(X_train, Y_train)
# This set of commands returns:
# SGDClassifier(alpha=0.0001, class_weight=None, epsilon=0.1, eta0=0.0,
#       fit_intercept=True, l1_ratio=0.15, learning_rate='optimal',
#       loss='hinge', n_iter=5, n_jobs=1, penalty='l2', power_t=0.5,
#       random_state=None, shuffle=False, verbose=0, warm_start=False)
#
# Request the coefficients.
clf.coef_
# We have the set of coefficients: -6.33869299,  8.4505789
#
# Request the intercept.
clf.intercept_
# We have an intercept at: 28.98614227
#
# The classifier's equation is y = 28.98614227 - 6.33869299 * x1 
#									+ 8.4505789 * x2


# 8. What is the classifier’s accuracy on the training data?
#
# Import the metrics module.
from sklearn import metrics
#
# Create the prediction for the training set and get the score.
Y_train_predict = clf.predict(X_train)
metrics.accuracy_score(Y_train, Y_train_predict)
# The accuracy for the training data is 0.91891891891891897 or about 91.9%.


# 9. What is the classifier’s accuracy on the test set?
#
# Create the prediction for the testing set and get the score.
Y_test_predict = clf.predict(X_test)
metrics.accuracy_score(Y_test, Y_test_predict)
# The accuracy for the testing data is 0.92307692307692313, or about 92.3%.


# 10. What is the confusion matrix and what is the interpretation of each 
# number in the matrix?
#
metrics.confusion_matrix(Y_test, Y_test_predict)
# This gives a confusion matrix of [[ 0,  1],
#							        [ 0, 12]]
# which means that we have one low-literacy individual who was mistaken for a
# high-literacy person and twelve high-literacy individuals who were
# identified correctly.
# Since there was only one low-literacy person being tested, I also decided
# to create a confusion matrix for the training data, which returned a
# confusion matrix of: [[ 0,  3],
#				        [ 0, 34]]
# Again all of the low-literacy individuals were misidentified.


# 11. Comment on the quality of this classifier for this problem.
#
# Though the accuracy statistics for both the training and testing data were
# both quite high at around 92%, the confusion matrices suggest that this
# classifier is not particularly good.  It would be helpful to have a 
# dataset with a greater number of low-literacy individuals to perform a
# more balanced representation of the population and more reliable accuracy
# results.
# A plot of the X_train data separated by high- and low-literacy criteria
# shows that the correlation between age, average blood glucose, and 
# health literacy is not clear, if it exists at all.  A person's health
# literacy shows low dependence on our X factors.
# The combination of these two elements suggests that this is a rather poor
# classifier.

