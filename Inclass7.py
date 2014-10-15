# ==================================================================
# David Harter
# CMDA3654
# In-Class Assignment 7
# October 20, 2014
# ==================================================================

# Switch to working directory.
cd Documents/School_Work/CMDA3654/CMDA3654

# Import necessary libraries.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


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


