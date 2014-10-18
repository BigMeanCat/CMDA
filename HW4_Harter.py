# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
%matplotlib inline

# <codecell>

tennis = pd.read_csv('2013_Wimbledon_Data.csv', header = False)

# <codecell>

tennis.describe()

# <codecell>

# 5) Comment on and perform any needed treatment for missing values.
#    In our case, the NA values under the set results for player 1 and player 2 need not
#    and should not be altered.  Since these "NA"s indicate that the player did not make
#    it to this round, it solves nothing to fill these in with manufactured values.
#    Replacing these with the average or median for that set would create phony data that
#    did not represent the true state of what happened, while replacing them with zero
#    would cause data summaries to return erroneously low figures.

# <codecell>

# 6) Comment on and perform any needed data transformations.
#    We have already transformed this data in R.  No further transformations seem
#    necessary at this time.

# <codecell>

# 7) Get three visualizations that you consider meaningful.
#
# First, we will see how the frequency of first serves won relates to the final number of games won.
# We start by combining the statistics of player 1 and player 2 and combining them in a dataframe.
gamesWon = pd.concat([tennis['Final.No.of.Games.Won.P1'], tennis['Final.No.of.Games.Won.P2']], ignore_index = True)
firstServe = pd.concat([tennis['First.Serve.Won.P1'], tennis['First.Serve.Won.P2']], ignore_index = True)

firstWon = pd.concat([gamesWon, firstServe], axis = 1)

# <codecell>

# Split firstWon into groups of players with 0, 1, 2, and 3 wins.
zeroWins = firstWon[firstWon[0] == 0]
oneWin = firstWon[firstWon[0] == 1]
twoWins = firstWon[firstWon[0] == 2]
threeWins = firstWon[firstWon[0] == 3]

# <codecell>

zeroWins[1].plot(kind = 'kde', style = 'r', xlim = [0,105], legend = True, label = '0 Wins')
oneWin[1].plot(kind = 'kde', style = 'y', legend = True, label = '1 Win')
twoWins[1].plot(kind = 'kde', style = 'g', legend = True, label = '2 Wins')
threeWins[1].plot(kind = 'kde', style = 'b', legend = True, label = '3 Wins')
plt.title('Number of Games Won Against First Serves Won')
plt.xlabel('Number of First Serves Won')
plt.ylabel('Frequency')

# <codecell>

# Now we make a histogram visualizing double-fault frequency.
dFaults = pd.concat([tennis['Double.Faults.P1'], tennis['Double.Faults.P2']], ignore_index = True)

# <codecell>

dFaults.hist(bins = 10)
plt.xlabel('Total Double Faults')
plt.ylabel('Frequency')
plt.title('Double Faults By Frequency')

# <codecell>

# Now we represent the points attempted versus points won in a scatterplot.
pAttempted = pd.concat([tennis['Net.Points.Attempted.P1'], tennis['Net.Points.Attempted.P2']], ignore_index = True)
pWon = pd.concat([tennis['Net.Points.Won.P1'], tennis['Net.Points.Won.P2']], ignore_index = True)

# <codecell>

PointSuccess = plt.scatter(pAttempted, pWon)
plt.title('Net Points Attempted Vs. Those Won')
plt.xlabel('Net Points Attempted')
plt.ylabel('Net Points Won')

# <codecell>

# 8) Save your data as a pickle.
tennis.save(

