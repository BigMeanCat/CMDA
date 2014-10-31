# ====================================================================
# David Harter
# CMDA3654
# In-Class Assignment 9_3
# November 3, 2014
# ====================================================================

# Set working directory and load data
setwd("Documents/School_Work/CMDA3654/CMDA3654")
load("NatalRiskData.rData")

# Build training and testing sets
train <- sdata[sdata$ORIGRANDGROUP<=5,]
test <- sdata[sdata$ORIGRANDGROUP>5,]

# Build the model formula by choosing the columns we want to consider and 
# combining them into a string to be used for the logistic model.
complications <- c("ULD_MECO","ULD_PRECIP","ULD_BREECH")
riskfactors <- c("URF_DIAB", "URF_CHYPER", "URF_PHYPER",
                 "URF_ECLAM")
y <- "atRisk"
x <- c("PWGT",
       "UPREVIS",
       "CIG_REC",
       "GESTREC3",
       "DPLURAL",
       complications,
       riskfactors)
fmla <- paste(y, paste(x, collapse="+"), sep="~")

# Build the model using the string we created and the training set data.
# Use the "binomial" family argument to create a binary response 0 or 1.
model <- glm(fmla, data=train, family=binomial(link="logit"))

# Apply the logistic regression model.  Create both training and testing
# prediction types for later use.
train$pred <- predict(model, newdata=train, type="response")
test$pred <- predict(model, newdata=test, type="response")

# Plot the data using ggplot.  Split the plots into true and false.
library(ggplot2)
ggplot(train, aes(x=pred, color=atRisk, linetype=atRisk)) +
  geom_density()

# Create and display a confusion matrix for the test data.  We choose the threshold
# 0.02, as this gives us a close estimate of where high-risk groups start to
# outnumber the low-risk groups.
confusion.test <- table(pred=test$pred>0.02, target = test$atRisk)
confusion.test
# This gives us the matrix
#         target
# pred    FALSE  TRUE
#   FALSE  9487    93
#   TRUE   2405   116
# So it seems there are a large number of false posiives, but this is desirable as
# long as false negatives are avoided (which leave people unaware of risk).

# Get the performance measures for the test data.
accuracy <- (confusion.test[2,2] + confusion.test[1,1])/sum(confusion.test[,])
accuracy 
# Our accuracy is 0.8752169
precision <- confusion.test[2,2] / sum(confusion.test[2,])
precision
# Our precision is 0.06195286
recall <- confusion.test[2,2] / sum(confusion.test[,2])
recall
# Our recall is 0.4401914
# It is not possible for us to achieve both high precision and high accuracy for
# this case, but it is OK as long as accuracy is high.

# Run the shiny app which was modified to use the NatalRisk data.
runApp("App-1")