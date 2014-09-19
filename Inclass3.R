# ============================================================================
# David Harter
# CMDA3654
# In-Class Assignment 3
# September 19, 2014
# ============================================================================


setwd("Documents/School_Work/CMDA3654/CMDA3654")
load("exampleData1.rData")

mergeData <- merge(medianincome, custdata)

mergeData$norm.income <- mergeData$income/mergeData$Median.Income

summary(mergeData$norm.income)

# This normalization makes sense when deciding where in the range of all salaries a
# particular salary range lies.  For the example of deciding whether to take a new
# job in another state, this would help in getting a picture of what the normal
# salary (and possibly cost of living) are like.

trainingSet <- subset(mergeData, mergeData$gp < 0.3)
testSet <- subset(mergeData, mergeData$gp >= 0.3)