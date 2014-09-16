# ============================================================================
# David Harter
# https://github.com/BigMeanCat
# CMDA 3564
# HW 1
# September 8, 2014
# ============================================================================

setwd("Documents/School_Work/CMDA3654/Rfolder/HW1")


# ---------
# Problem 1
# ---------

# 6) Find out using R help how to import the prices dataset with no header and
# create variable names for the created R data frame within the read.table
# function, with the help of the col.names argument. Print your data frame and
# ascertain that the header was assigned correctly.

pdata = read.table("prices.csv", header = F, sep = ',', skip = 1, col.names = c("PRICE", "SQFT", "AGE", "NE"))
pdata


# 7) The row.names argument specifies a vector of row names for the data frame.


# 8) Using a text editor, create a small file with the following lines:
# a b c
# 1 2 3
# 4 5 6
# Read this file into R so that the variable names are a, b, c.

abcdata = read.table("abc_file.txt", header = TRUE)
abcdata


# ---------
# Problem 2
# ---------

# 1) Create a 4 X 4 matrix MAT1 using the cbind(function).

vec1 <- c(2,1,0,0)
vec2 <- c(3,0,2,2)
vec3 <- c(1,3,-3,3)
vec4 <- c(5,1,2,1)

MAT1 = cbind(vec1, vec2, vec3, vec4, deparse.level = 0)
MAT1


# 2) If you know the dimensions of your matrix, you can access the last element
# by calling the index.  For example, MAT1[4,4] will return 1.
MAT1[4,4]

# 3) Find the transpose of your matrix.

t(MAT1)


# 4) Find the inverse of your matrix.

solve(MAT1)


# ---------
# Problem 3
# ---------

# 1) Locate in Lecture code the fpe dataset imported from the internet.

fpe <- read.table("http://data.princeton.edu/wws509/datasets/effort.dat")
fpe


# 2) For the fpe dataset, print out only the observations with 0 effort.

zeroeffort = fpe[fpe$effort == 0, ]
zeroeffort


# 3) For the fpe dataset print the names of the variables using one function.

colnames(fpe)


# 4) For the fpe dataset print the names of the rows using one function.

rownames(fpe)


# 5) The head(dataframe, n) function will print out the rows at the top of a
# dataset.  If n is not specified, it prints out the first six rows; otherwise,
# it prints out the first n rows.

head(fpe)


#6) Export your fpe data frame as both a text and a csv file.

write.table(fpe, "fpe.txt", sep = "\t")
write.table(fpe, "fpe.csv", sep = "\t")