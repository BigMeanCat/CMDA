#Shiny visualization of kmeans clusters with iris data
#use 2 features at a time to determine a variable number of clusters

setwd('Documents/School_Work/CMDA3654/CMDA3654')
iris <- read.csv('iris.csv', header=T)

#Always examine data first
names(iris)
head(iris)
summary(iris)


#############################################
library(shiny)


#have data loaded;
#will use the features for clustering
#and a separate variable with country names
#for labeling points in clusters
#ui and server R files should be in the folder "App_3" created
#at this location (working directory)

iris1 <- scale(iris[,-1])
iris1 <- as.data.frame(iris1)
names(iris1)
label_points <- iris[,1]
label_points

runApp("App_3")
