# =========================================================================
# David Harter
# CMDA 3654
# In-Class Assignment 1
# =========================================================================

setwd("Documents/School_Work/CMDA3654/Rfolder")

cars1 = read.table("cars1.csv", header = TRUE, sep = ",")

dim(cars1)

var1 = cars1[2,2]

cars1[ ,1]

cars1[ ,2]

SPEED <- cars1[ ,1]
SPEED

cars1[15, ]
