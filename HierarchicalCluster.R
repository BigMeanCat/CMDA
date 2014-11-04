# =============================
# David Harter
# CMDA 3654
# In-Class Assignment 10.1
# Monday, November 10, 2014
# =============================

"""Run the data(iris) code. You will have now the iris dataframe. Examine the 
“names” of the variables, the first 6 observations and the summaries of the 
variables. "
data(iris)

iris <- read.csv("iris.csv")

names(iris)
head(iris)
summary(iris)

"""Use the sepal length and width and petal length and width features to build 
hierarchical clusters."
features <- iris[,1:4]
scaled_features <- scale(features)

distance <- dist(scaled_features, method = "euclidean")

hier_cl <- hclust(distance)

# Plot the dendogram.
plot(hier_cl, labels=iris$Species)

"""Separate 3 clusters and use the “Species” column from the original data to 
identify branches. They will overlap somewhat but you will still be able to see."
rect.hclust(hier_cl, k=3)

"""Comment: what are the iris plants that seem to be mostly in first cluster? How 
about the second cluster? How about the third cluster? "

""" In the first cluster we see exclusively zeroes, indicating that the setosas are
well-defined.  In the second cluster, we see almost exclusively ones with a few twos
and zeroes thrown in, indicating that the virginicans are well-defined, but may be
mistaken for the other two.  In the third cluster, we see mostly twos, but a fair 
amount of ones indicating that the versicolors are fairly well-defined but that a
virginican may easily be mistaken for a versicolor." 