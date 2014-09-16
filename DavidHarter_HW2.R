# ==================================================================================
# David Harter
# CMDA 3654
# HW2
# September 15, 2014
# ==================================================================================


# 1) Load the phsample.RDATA from the Git link provided in the “PDSR” (Practical Data 
# Science with R) textbook on page 31.

load("phsample.RData")

# 2) Describe in a sentence or two (R comment) what the dataset is about.
#
# The rows each represent a person or household for which personal data is included
# such as occupation, level of education, personal income, and other variables.


# 3) Replicate the textbook Listing 2.12, 2.13, and 2.14 code.
# 4) Comment for each of the above what the code is doing.

# Listing 2.12
psub = subset(dpus,with(dpus,(PINCP>1000)&(ESR==1)&
      (PINCP<=250000)&(PERNP>1000)&(PERNP<=250000)&
      (WKHP>=40)&(AGEP>=20)&(AGEP<=50)&
      (PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24))))
# This command is creating a smaller subset of data from dpus, picking certain
# variables out of the dataset and choosing only certain ranges of values for
# each chosen variable.


# Listing 2.13
psub$SEX = as.factor(ifelse(psub$SEX==1,'M','F'))
psub$SEX = relevel(psub$SEX,'M')
cowmap <- c("Employee of a private for-profit",
            "Private not-for-profit employee",
            "Local government employee",
            "State government employee",
            "Federal government employee",
            "Self-employed not incorporated",
            "Self-employed incorporated")
psub$COW = as.factor(cowmap[psub$COW])
psub$COW = relevel(psub$COW,cowmap[1])
schlmap = c(
  rep("no high school diploma",15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL,schlmap[1])
dtrain = subset(psub,ORIGRANDGROUP >= 500)
dtest = subset(psub,ORIGRANDGROUP < 500)
# These commands reencode several variables, substituting their numeric values
# for string values that will be more meaningful to someone analyzing the data.
# The last two rows create a subset of psub for training and testing.


# Listing 2.14
# > summary(dtrain$COW)
# Employee of a private for-profit
# 423
# Local government employee
# 39
# Self-employed incorporated
# 17
# State government employee
# 24
# Federal government employee
# 21
# Private not-for-profit employee
# 55
# Self-employed not incorporated
# 16
# This is a summary of the employment classifications, by number of individuals.


# 5) Discuss with your team and find a data set for your project. It should have at
# least 7 variables, some numeric, some character, and at least 60 observations.

# We have chosen the "Tennis Major Tournament Statistics Data Set" from the UCI
# Machine Learning Repository at https://archive.ics.uci.edu/ml/datasets/Tennis
# +Major+Tournament+Match+Statistics.
# Since this site includes a variety of tournaments, we are choosing the datasets for
# the 2013 Wimbledon men's tournament.  We may add the women's statistics later.


# 6) Import your data set, create the R data frame and perform any reshaping
# operations you see fit right now.

#Read in the csv dataframe of the Men's Wimbleton results
wim_men <- read.table(
  'Wimbledon-men-2013.csv',
  sep=',',
  header=T
)

#The current names are too vague
names(wim_men)

#Attribute Information:

#Player 1 Name of Player 1 
#Player 2 Name of Player 2 
#Result Result of the match (0/1) - Referenced on Player 1 is Result = 1 if Player 1 wins (FNL.1>FNL.2) 
#FSP.1 First Serve Percentage for player 1 (Real Number) 
#FSW.1 First Serve Won by player 1 (Real Number) 
#SSP.1 Second Serve Percentage for player 1 (Real Number) 
# SSW.1 Second Serve Won by player 1 (Real Number) 
# ACE.1 Aces won by player 1 (Numeric-Integer) 
# DBF.1 Double Faults committed by player 1 (Numeric-Integer) 
# WNR.1 Winners earned by player 1 (Numeric) 
# UFE.1 Unforced Errors committed by player 1 (Numeric) 
# BPC.1 Break Points Created by player 1 (Numeric) 
# BPW.1 Break Points Won by player 1 (Numeric) 
# NPA.1 Net Points Attempted by player 1 (Numeric) 
# NPW.1 Net Points Won by player 1 (Numeric) 
# TPW.1 Total Points Won by player 1 (Numeric) 
# ST1.1 Set 1 result for Player 1 (Numeric-Integer) 
# ST2.1 Set 2 Result for Player 1 (Numeric-Integer) 
# ST3.1 Set 3 Result for Player 1 (Numeric-Integer) 
# ST4.1 Set 4 Result for Player 1 (Numeric-Integer) 
# ST5.1 Set 5 Result for Player 1 (Numeric-Integer) 
# FNL.1 Final Number of Games Won by Player 1 (Numeric-Integer) 
# FSP.2 First Serve Percentage for player 2 (Real Number) 
# FSW.2 First Serve Won by player 2 (Real Number) 
# SSP.2 Second Serve Percentage for player 2 (Real Number) 
# SSW.2 Second Serve Won by player 2 (Real Number) 
# ACE.2 Aces won by player 2 (Numeric-Integer) 
# DBF.2 Double Faults committed by player 2 (Numeric-Integer) 
# WNR.2 Winners earned by player 2 (Numeric) 
# UFE.2 Unforced Errors committed by player 2 (Numeric) 
# BPC.2 Break Points Created by player 2 (Numeric) 
# BPW.2 Break Points Won by player 2 (Numeric) 
# NPA.2 Net Points Attempted by player 2 (Numeric) 
# NPW.2 Net Points Won by player 2 (Numeric) 
# TPW.2 Total Points Won by player 2 (Numeric) 
# ST1.2 Set 1 result for Player 2 (Numeric-Integer) 
# ST2.2 Set 2 Result for Player 2 (Numeric-Integer) 
# ST3.2 Set 3 Result for Player 2 (Numeric-Integer) 
# ST4.2 Set 4 Result for Player 2 (Numeric-Integer) 
# ST5.2 Set 5 Result for Player 2 (Numeric-Integer) 
# FNL.2 Final Number of Games Won by Player 2 (Numeric-Integer) 
# Round Round of the tournament at which game is played (Numeric-Integer) 


#rename variables so that they are less ambiguous
names(wim_men) = c('Player 1 Name',
                   'Player 2 Name',
                   'Round Number',
                   'Winner of Match',
                   'Final No. of Games Won By Player 1',
                   'Final No. of Games Won By Player 2',
                   'First serve Percentage for Player 1',
                   'First Serve Won for Player 1',
                   'Second Serve Percentage for Player 1',
                   'Second Serve Won for Player 1',
                   'Aces Won for Player 1',
                   'Double Faults Committed By Player 1',
                   'Winners Earned for Player 1',
                   'Unforced Errors Committed by Player 1',
                   'Break Points Created by Player 1',
                   'Break Points Won by Player 1',
                   'Net Points Attempted by Player 1',
                   'Net Points Won by Player 1',
                   'Total Points Won by Player 1',
                   'Set 1 Result for Player 1',
                   'Set 2 Result for Player 1',
                   'Set 3 Result for Player 1',
                   'Set 4 Result for Player 1',
                   'Set 5 Result for Player 1',
                   'First serve Percentage for Player 2',
                   'First Serve Won for Player 2',
                   'Second Serve Percentage for Player 2',
                   'Second Serve Won for Player 2',
                   'Aces Won for Player 2',
                   'Double Faults Committed By Player 2',
                   'Winners Earned for Player 2',
                   'Unforced Errors Committed by Player 2',
                   'Break Points Created by Player 2',
                   'Break Points Won by Player 2',
                   'Net Points Attempted by Player 2',
                   'Net Points Won by Player 2',
                   'Total Points Won by Player 2',
                   'Set 1 Result for Player 2',
                   'Set 2 Result for Player 2',
                   'Set 3 Result for Player 2',
                   'Set 4 Result for Player 2',
                   'Set 5 Result for Player 2')

#Updated values of the column names
names(wim_men)

#Save the dataframe as a data file
save(wim_men, file ="tennis.RData")


# For problems 7-9, the data manual and R script, as well as the original and 
# modified datasets, are available at the repository:
# https://github.com/BigMeanCat/cmda
