# =============================
# David Harter
# CMDA 3654
# In-Class Assignment 10.12
# Monday, November 10, 2014
# =============================

"""Run the data(iris) code. You will have now the iris dataframe. Examine the 
“names” of the variables, the first 6 observations and the summaries of the 
variables. "
data(iris)

names(iris)
head(iris)
summary(iris)

"""Use the sepal length and width and petal length and width features to build 
hierarchical clusters."
features <- iris[,1:4]
scaled_features <- scale(features)

distance <- dist(scaled_features, method = "euclidean")

hier_cl <- hclust(distance, method = "ward")

# Plot the dendogram.
plot(hier_cl, labels=iris$Species)

"""Separate 3 clusters and use the “Species” column from the original data to 
identify branches. They will overlap somewhat but you will still be able to see."
rect.hclust(hier_cl, k = 3)
groups <- cutree(hier_cl, k = 3)
groups

"""Comment: what are the iris plants that seem to be mostly in first cluster? How 
about the second cluster? How about the third cluster? "

""" In the first cluster we see exclusively setosas, which seem to be well-defined
by this model.  In the second cluster, we see exclusively virginicas.  In the third
cluster, we see mostly versicolors, but a fair number of virginicas, indicating that
the versicolors are well-defined but that a virginican may be mistaken for a 
versicolor." 


#Use kmeans clustering algorithm on iris data with 5 clusters
kmeans_clusters <- kmeans(distance, 3 , nstart=100, iter.max=100)


#Compare the two clustering algo results for iris data(hier and kmeans)
compare <- cbind(groups, kmeans_clusters$cluster)
compare <- as.data.frame(compare)
names(compare) <- c("Hierarchical", "kmeans")
compare <- cbind(iris$Species,compare)
compare

#Sort data to be able to more clearly see differences between clusters
#resulting from the two algorithms.
compare1 <- compare[order(compare$Hierarchical),]
compare1
compare2 <- compare[order(compare$kmeans),]
compare2

"""As before, the hierarchical model is quite good at distinguishing all three species,
with only some trouble mistaking virginicas for versicolors.  The kmeans model does a 
reasonable job of separating the three species, though not quite as good.  All of the
setosas are correctly identified, but a few versicolors are mistaken for virginicas,
and a great deal of virginicas are mistaken for versicolors."
