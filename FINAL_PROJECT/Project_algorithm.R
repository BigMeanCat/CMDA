# Joe Holland
# 11/7/2014
# CMDA 3654
# Final Project

##############################################
# Algorithm

getwd()
setwd("C:\\Users\\Joe\\DOcuments\\CMDA\\Final Project")

# Read in Dataset
dataset <- read.csv("Men's_Wimbledon_2013.csv", sep = ',', header = TRUE)

dataset

# Change the names of variables to be more readable
names(dataset) = c('Player_1_Name',
                   'Player_2_Name',
                   'Round_Number',
                   'Winner_of_Match',
                   'Final_No_of_Games_Won_By_Player_1',
                   'Final_No_of_Games_Won_By_Player_2',
                   'First_Serve_Percentage_for_Player_1',
                   'First_Serve_Won_for_Player_1',
                   'Second_Serve_Percentage_for_Player_1',
                   'Second_Serve_Won_for_Player_1',
                   'Aces_Won_for_Player_1',
                   'Double_Faults_Committed_By_Player_1',
                   'Winners_Earned_for_Player_1',
                   'Unforced_Errors_Committed_by_Player_1',
                   'Break_Points_Created_by_Player_1',
                   'Break_Points_Won_by_Player_1',
                   'Net_Points_Attempted_by_Player_1',
                   'Net_Points_Won_by_Player_1',
                   'Total_Points_Won_by_Player_1',
                   'Set_1_Result_for_Player_1',
                   'Set_2_Result_for_Player_1',
                   'Set_3_Result_for_Player_1',
                   'Set_4_Result_for_Player_1',
                   'Set_5_Result_for_Player_1',
                   'First_Serve_Percentage_for_Player_2',
                   'First_Serve_Won_for_Player_2',
                   'Second_Serve_Percentage_for_Player_2',
                   'Second_Serve_Won_for_Player_2',
                   'Aces_Won_for_Player_2',
                   'Double_Faults_Committed_By_Player_2',
                   'Winners_Earned_for_Player_2',
                   'Unforced_Errors_Committed_by_Player_2',
                   'Break_Points_Created_by_Player_2',
                   'Break_Points_Won_by_Player_2',
                   'Net_Points_Attempted_by_Player_2',
                   'Net_Points_Won_by_Player_2',
                   'Total_Points_Won_by_Player_2',
                   'Set_1_Result_for_Player_2',
                   'Set_2_Result_for_Player_2',
                   'Set_3_Result_for_Player_2',
                   'Set_4_Result_for_Player_2',
                   'Set_5_Result_for_Player_2')

names(dataset)

# Filling in the Total Points Won Column for each player
dataset$Total_Points_Won_by_Player_1 = dataset$Break_Points_Won_by_Player_1 + dataset$Net_Points_Won_by_Player_1
dataset$Total_Points_Won_by_Player_2 = dataset$Break_Points_Won_by_Player_2 + dataset$Net_Points_Won_by_Player_2

# Creating a subset of only necessary, numeric variables
# Outputs the names of the variables in the subset, first few observations, 
#   and scales the subset to be workable
subset <- dataset[,4:19]
subset <- subset[,-3]
names(subset)
head(subset)
scale(subset)
subset

# Creates the testing and training sets
subset$gp <- runif(dim(subset)[1])
testSet <- subset(subset, subset$gp <= 0.1)
trainingSet <- subset(subset, subset$gp > 0.1)

# Logistic Model:

# Setting the response and explanatory variables for the algorithm
y <- "Winner_of_Match"
x <- c("First_Serve_Percentage_for_Player_1" ,
       "First_Serve_Won_for_Player_1" ,
       "Second_Serve_Percentage_for_Player_1" ,
       "Second_Serve_Won_for_Player_1" ,
       "Aces_Won_for_Player_1" ,
       "Double_Faults_Committed_By_Player_1" ,
       "Winners_Earned_for_Player_1" ,
       "Unforced_Errors_Committed_by_Player_1" ,
       "Break_Points_Created_by_Player_1" ,
       "Break_Points_Won_by_Player_1" ,
       "Net_Points_Attempted_by_Player_1" ,
       "Net_Points_Won_by_Player_1")

# Forming the algorithm and outputting
algo <- paste(y, paste(x, collapse="+"), sep="~")
print(algo)

# Forming the model, outputting the model, and running the model summary
model <- glm(algo, data=trainingSet, family=binomial(link="logit"))
model 
summary(model)

# Setting the new explanatory variables for the model
new_x <- c("Aces_Won_for_Player_1",
           "First_Serve_Percentage_for_Player_1",
           "Second_Serve_Won_for_Player_1",
           "Unforced_Errors_Committed_by_Player_1",
           "Break_Points_Won_by_Player_1")

# Forming the new algorithm and outputting
updated_algo <- paste(y, paste(new_x, collapse="+"), sep="~")
print(updated_algo)

# Forming the new model, outputting the model, and running the model summary
updated_model <- glm(updated_algo, data=trainingSet, family=binomial(link="logit"))
updated_model 
summary(updated_model)

# Setting the predictor training and testing sets
trainingSet$pred <- predict(updated_model, newdata=trainingSet, type="response")
testSet$pred <- predict(updated_model, newdata=testSet, type="response")

# Running the confusion matrix
confusion.test <- table(pred=testSet$pred>0.02, Winner_of_Match = testSet$Winner_of_Match)
confusion.test

# Compiling the accuracy
accuracy <- (confusion.test[2,2] + confusion.test[1,1])/sum(confusion.test[,])
accuracy 

# Compiling the precision
precision <- confusion.test[2,2] / sum(confusion.test[2,])
precision

# Compiling the recall
recall <- confusion.test[2,2] / sum(confusion.test[,2])
recall


library(ROCR)

trainingSet$response <- trainingSet$Winner_of_Match > 0
head(trainingSet$response)

# Compiling the AUC value
eval <- prediction(trainingSet$pred, trainingSet$response)
auc_calc <- performance(eval,'auc')
auc_calc@y.values

# Plots the actual values versus the predicted values
plot(performance(eval, "tpr", "fpr"))
