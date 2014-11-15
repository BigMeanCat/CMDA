# ============================================
# David Harter
# CMDA 3654
# In-class Assignment 11
# November 17, 2014
# ============================================

library(class)
library(ROCR)
library(rpart)
library(rpart.plot)
library(e1071)

"""Use mtcars R dataset provided by the data(mtcars) command"
data(mtcars)

"""Display the first 6 observations (head(mtcars)) and the 
variable names (names(mtcars))"
head(mtcars)
names(mtcars)

"""Describe each variable in the dataset with a few words 
(data manual); you can find that information by using the 
command ?mtcars"
?mtcars
# 'mpg' gives the gas mileage in miles/gallon
# 'cyl' gives the number of cylinders
# 'disp' gives the engine size in terms of the displacement (cu.in.)
# 'hp' gives the gross horsepower
# 'drat' gives the rear axle ratio
# 'wt' gives the weight in thousands of US pounds
# 'qsec' gives the 1/4 mile time
# 'vs' gives the V/S, though I was not able to find an explanation for this ratio
# 'am' is a boolean variable showing whether the transmission is manual or automatic
# 'gear' is the number of forward gears
# 'carb' is the number of carburetors




"""Train a knn, decision tree and logistic model on this 
data. Get predictions on the same training data."

# Training the kNN:
# Make the training set, omitting the 'am' variable we are testing
knnTrain <- mtcars[-9]
knnTrain = scale(knnTrain)                 # Scale the training set
response <- mtcars$am > 0       # Create the response set to test 'am'

head(response)
head(knnTrain)
dim(knnTrain)

knnDecision <- knn(knnTrain, knnTrain, response, k=4, prob=T)
knnDecision

knnPred <- ifelse(knnDecision==TRUE,
                  attributes(knnDecision)$prob,
                  1-(attributes(knnDecision)$prob))
evalknn <- prediction(knnPred, mtcars$am)
evalknn
"""The kNN model returned an almost exact replica of the response set, with only one false
negative and high probabilities for most of the predictions.  It is probably a reliable
indicator of what variable vectors can be reliably grouped together."



# Train the decision tree
mtcars$man <- mtcars$am > 0
carVars = names(mtcars)[-9]
carVars = carVars[-11]
f <- paste('man ~ ',paste(carVars,collapse=' + '),sep='')
tmodel <- rpart(f,data=mtcars, control=rpart.control(cp=0.001,minsplit=2, minbucket=2,maxdepth=5))
tmodel

prp(tmodel)

dTreePred <- predict(tmodel, newdata = mtcars)
evaltree <- prediction(dTreePred, mtcars$am)
"""As we saw earlier, the decision tree gives us a small amount of information concerning
the importance of the 'wt' and 'qsec' variables.  It's not particularly revealing, but
may be a start in terms of narrowing down our variables."




# Train the logistic model
attach(mtcars)

cyl_F = factor(cyl)
gear_F = factor(gear)
carb_F = factor(carb)
f <- paste('am ~ mpg + cyl_F + disp + hp + drat + wt + qsec + vs + gear_F + carb_F')

logam = glm(f, data = mtcars, family = "binomial")

summary(logam)

logPred <- predict(tmodel, newdata = mtcars)
evallog <- prediction(logPred, mtcars$am)
evallog

detach(mtcars)
"""The logistic model was not particularly useful in this case.  It seems that one
of our variables correlated perfectly with the 'am' variable, causing all values of
z to go to 0.  Though this reproduced the response set perfectly, it did not give
us any information on what variables were important."


# Train the Naive Bayes model
fit <- naiveBayes(as.formula(f), data = mtcars)

naivB_pred <- predict(fit, mtcars, type = 'raw')
evalnb <- prediction(naivB_pred[,2], mtcars$am)
evalnb

"""The Naive-Bayes model was an excellent predictor of the type of transmission each
car might have, matching the actual results in every case."



"""Calculate and compare the AUC and system time for each algorithm. Which one does
better? Do you run into any problems?"

auc_calc <- performance(evalknn,'auc')
auc_calc@y.values
system.time(knnDecision <- knn(knnTrain, knnTrain, response, k=4, prob=T))

auc_calc <- performance(evaltree,'auc')
auc_calc@y.values
system.time(tmodel <- rpart(f,data=mtcars,
      control=rpart.control(cp=0.001,minsplit=2, minbucket=2,maxdepth=5)))

auc_calc <- performance(evallog,'auc')
auc_calc@y.values
system.time(logam = glm(f, data = mtcars, family = "binomial"))

auc_calc <- performance(evalnb,'auc')
auc_calc@y.values
system.time(fit <- naiveBayes(as.formula(f), data = mtcars))

"""All three of the models had high performance (~ 1), but kNN was the only model with a
perfect score of one.  The decision tree and logistic model were tied at 0.9979757, and
the Naive-Bayes method came in a close a third at 0.9392713.

Timing all three models, kNN was no doubt the fastest, performing its operations in an
almost immeasurably short time.  The decision tree and Naive-Bayes model were a bit 
slower, but not by much.

For the logistic model, however, an error message came back which claimed that the
argument (logam = glm...) was unused, reflecting the warning message we ran into
earlier.  Clearly, a logistic model would not be our first choice when examining this data."