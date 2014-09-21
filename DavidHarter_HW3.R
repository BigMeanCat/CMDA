# ============================================================================
# David Harter
# CMDA3654
# Homework 3
# September 22, 2014
# ============================================================================

setwd("Documents/School_Work/CMDA3654/CMDA3654")

# 1) Load your project DATA.
load("tennis.RData")


# 2) Decide which variables are numeric and which ones are best set as factor.

names(wim_men)

# The above command yields the following results:
[1] "P1.Name"                    "P2.Name"                    "Round.Number"              
[4] "Winner.of.Match"            "Final.No.of.Games.Won.P1"   "Final.No.of.Games.Won.P2"  
[7] "First.serve.Percentage.P1"  "First.Serve.Won.P1"         "Second.Serve.Percentage.P1"
[10] "Second.Serve.Won.P1"        "Aces.Won.P1"                "Double.Faults.P1"          
[13] "Winners.Earned.P1"          "Unforced.Errors.P1"         "Break.Points.Created.P1"   
[16] "Break.Points.Won.P1"        "Net.Points.Attempted.P1"    "Net.Points.Won.P1"         
[19] "Total.Points.P1"            "Set1.Result.P1"             "Set2.Result.P1"            
[22] "Set3.Result.P1"             "Set4.Result.P1"             "Set5.Result.P1"            
[25] "First.serve.Percentage.P2"  "First.Serve.Won.P2"         "Second.Serve.Percentage.P2"
[28] "Second.Serve.Won.P2"        "Aces.Won.P2"                "Double.Faults.P2"          
[31] "Winners.Earned.P2"          "Unforced.Errors.P2"         "Break.Points.Created.P2"   
[34] "Break.Points.Won.P2"        "Net.Points.Attempted.P2"    "Net.Points.Won.P2"         
[37] "Total.Points.P2"            "Set1.Result.P2"             "Set2.Result.P2"            
[40] "Set3.Result.P2"             "Set4.Result.P2"             "Set5.Result.P2" 
#
# Whereas most of these variables involve points, number of games, and other countable
# observables that are best left numeric, there are two types of variables here that
# would be better treated as a factor:
# P1.Name, P2.Name - string variables 1 and 2
# Winner.of.Match - boolean variable 4


# 3) Get numerical summaries for all your variables. Comment on the most common data
# issues, as listed in class.

summary(wim_men)

# Running the summary, the first thing I noticed was that the statistics for "P1.Name," 
# "P2.Name," and "Round.Number" were rather odd.  It seems as though R was
# not sure what to do with these values.  In each column, I saw a list with 114
# observations (agreeing with the 114 different matches in the tournament), but there
# was a seemingly random list of variables from the variable list with numbers
# beside them for which the meaning was uncertain.  There were also "NULL" variables for
# "P1.Name" and "P2.Name."  Upon further examination, it was discovered that the data
# had been corrupted at some point, and these columns were simply filled with nonsense.
# The problem has since been corrected and there is currently nothing strange about the
# statistics for these variables.
#
# Other than that, we have the "Total.Points.P1" and "Total.Points.P2" columns,
# which seem as if they should be numeric variables but are listed as
# logical variables.  Even more curious, all 114 entries for both are NA's.  Upon closer
# inspection, we discover that there are no values entered for either of these
# variables in the dataset, an omission which is probably due to someone's failure to
# calculate theses sums and which can be easily corrected.
#
# The only other apparent issue is a large number of NA's for the variables "Set.
# {1/2/3/4/5}.Result.P{1/2}."  However, this makes sense since players in a
# tournament are bound to be eliminated and not progress on to later sets.


# 4) Get visualizations. Use at least three types of graphs to describe both individual
# variables and relationship between variables. Describe further data issues that you
# might see or just general patterns.
#
# First we will visualize the number of break points by combining the break point fields
# for Player 1 and Player 2 and organizing them into a histogram:

library(ggplot2)

ggplot(wim_men) +
  geom_histogram(aes(c(wim_men$Break.Points.Won.P1, wim_men$Break.Points.Won.P2)), 
      fill = "red", 
      binwidth = 0.5) +
  scale_x_discrete(limits = c(0:9)) +
  xlab("Total Break Points")
# We see here that the total break points peak at 2 and mostly decrease in frequency as
# the total number of break points increases, with an odd jump at 5 break points.
#
# We can also compare the frequency of players' "First Serve Won" statistics as compared
# to their "Net Points Won" statistics:

ggplot(data.frame(x = wim_men$First.Serve.Won.P1, y = wim_men$Net.Points.Won.P1),
       aes(x = wim_men$First.Serve.Won.P1, y = wim_men$Net.Points.Won.P1)) +
       geom_point() +
       xlab("Number of First Serves Won") +
       ylab("Net Points Won")
# In general, we observe an increase in net points won with the frequency of first serves
# won, but the spread is rather wide.

# We can also make a comparison of the number of double faults to unforced errors
# committed.  Since these are discrete values, we will use a hexbin plot:

library(hexbin)
ggplot(data.frame(x = wim_men$Double.Faults.P1, y = wim_men$Unforced.Errors.P1),
      aes(x = wim_men$Double.Faults.P1, y = wim_men$Unforced.Errors.P1)) +
      geom_hex(binwidth=c(1, 4)) +
      ylim(0,40) +
      xlab("Double Faults Committed") +
      ylab("Unforced Errors Committed")
# Here, we observe a slight correlation between double faults and unforced errors, but
# nothing particularly revealing.


# 5) Comment on and perform any needed treatment for missing values.
#
# The only real values that are missing are the total points for Player 1 and 2.  The
# NA's under "Set{4/5}.Result.P{1/2}" are not really missing.  The NA's represent the
# fact that the player did not go on to further sets.  While it is tempting to try to
# "fix" these values, I believe that it will make calculations easier and more
# meaningful if we simply leave the NA's where they are and use the na.rm = TRUE
# parameter.  That way, we are only calculating with actual data for that set,
# not trying to create data where none actually exists.

# The "Total.Points.P{1/2}" values, on the other hand, can be easily fixed by 
# adding the totals in the columns which list break points and net points.

wim_men$Total.Points.P1 = wim_men$Break.Points.Won.P1 + wim_men$Net.Points.Won.P1
wim_men$Total.Points.P2 = wim_men$Break.Points.Won.P2 + wim_men$Net.Points.Won.P2

summary(wim_men$Total.Points.P1)
summary(wim_men$Total.Points.P2)

# Checking the summaries for these variables, we now see that they are meaningful
# statistics.


# 6) Comment on and perform any needed data transformations.
#
# At this point it is difficult to determine whether any transformations will be
# needed, though some may be desirable in the future.  None of the data are large
# enough to necessitate a logarithmic transformation, and all numeric members of 
# the data are discrete, meaning that there is no need to discretize them.
#
# The only transformation that may be desirable is to combine statisics for Player
# 1 and Player 2 in order to look at the broader scope of how things play out.
# However, this is more easily handled by performing operations on a combination
# of the corresponding columns between Player 1 and Player 2 for a particular
# variable, as combining the columns prematurely creates a column of 228 rows,
# whereas R is only expecting 114 rows, causing R to register an error.


# 7) Save a new version of your data set as TransformedData.RData.

save(wim_men, file ="TransformedData.RData")