# =========================================================================
# David Harter
# CMDA 3654
# In-Class Assignment 2
# September 12, 2014
# =========================================================================

# 1) For the "custdata" data frame, we can make the following observations:
#   -state.of.res:  Nothing unusual about this data set.  The counts are 
#                   based on the number of individuals per state.
#
#   -custid:        Nothing too strange about this data set, though why
#                   statistical data would be needed on customer id numbers
#                   is unknown.
#
#   -sex:           Nothing odd here.  Counts are given in number of males
#                   versus females.
#
#   -is.employed:   T and F values are given as to whether a person is
#                   employed.  There is a large amount of missing data,
#                   which may be attributable to a data collector including
#                   statuses such as "retired" or "self-employed" and the
#                   program not knowing what to do with it.
#
#   -income:        Income levels are arranged by quartiles and mean.  One
#                   strange outlier: the min is a negative number, which may
#                   indicate that debt is included in income.
#
#   -marital.stat   Marital status counts by number of people for each category.
#                   Nothing unusual stands out here.
#
#   -health.ins     Count of people who do and do not have health insurance.
#                   Nothing odd here.
#
#   -housing.type   Housing type counts by number of people occupying each.
#                   56 individuals with "NA" status.  Not sure what this
#                   indicates.
#
#   -recent.move    Count of people who have recently moved.  Again, we have
#                   56 individuals with "NA" status.  It would be of
#                   interest to see if these individuals correlate with the
#                   56 "NA"s under housing.type and if there is a connection.
#
#   -num.vehicles   Number of vehicles owned, arranged by quartiles and mean.
#                   There are two anomalies here.  The most striking is that
#                   we again see 56 "NA" statuses, as we did with the two
#                   preceding categories.  The other is that we see a max of
#                   six vehicles, which seems high but is not impossible.
#
#   -age            Ages of individuals arranged by quartiles and mean.  The
#                   max age of 146.7 is a definite anomaly and probably an
#                   error.
#
#   -is.employed.fix1  This set of data does not seem to make much sense.
#                      Its meaning should be discussed with the client.
#
#   -age.normalized    The meaning of this variable is unclear.  It seems
#                      that it may be the distribution of ages fitted to a
#                      Gaussian curve with the mean age centered as zero.
#
#   -Median.Income  The meaning of this variable is unclear, though it seems
#                   that it could be the median income for an individual
#                   as measured over a specific time range.  This would need
#                   to be confirmed by the client.  It is arranged by
#                   quartiles and mean, and there are no anomalies.
#
#   -income.norm    Again, we see what seems to be a Gaussian distribution,
#                   this time for the income levels.  Strangely, this
#                   distribution's mean is not centered at zero.
#
#   -gp             No idea what this variable could represent.  Further
#                   investigation as to its meaning will be necessary.
#
#   -income.lt.30k  A count of the number of people with an income of less
#                   than 30,000 (dollars?) based on a logical count.
#                   Nothing odd here.
#
#   -age.range      A count of the number of people in a variety of age
#                   ranges.  Nothing odd here.
#
#   -Income         Another statistic showing the income levels by quartiles
#                   and mean.  Other than the maximum, all of the statistics
#                   here differ from the "income" variable above.  In
#                   addition, there are 328 "NA" statuses here, making up
#                   nearly a third of the total population.  This anomaly
#                   (and this variable in general) will need to be addressed.


# 2) For the car data, the variables are defined in ways which are clear for
#    some but not for others.  The "buying," "maint," "lug_boot," "safety,"
#    and "rating" variables seem to indicate ranges of purchase price,
#    maintenance expense, size of lug nuts, safety rating, and overall
#    quality rating, respectively.  However, it is difficult to say from a
#    glance.
#
#    The population is evenly split four ways in terms of the "buying," "maint,"
#    and "doors" variables, while it is evenly split three ways in the "persons,"
#    "lug_boot" and "safety" variables.  Whether the correlation of the counts
#    for these variables indicates a relationship among them cannot be determined
#    from the information given.
#
#    The "rating" variable is split more unevenly, with the majority of the units
#    receiving the "unacc" (presumably "unacceptable"") rating and relatively few
#    receiving "good" or "vgood" (presumably "very good") ratings.


# 3) By gender, the majority of males (548 in all) were single, while far fewer
#    were married/widowed (92 in all) and even fewer were divorced/separated (50 
#    in all).  However, of the 310 females, none were single; all were listed
#    under the category "divorced/separated/married."
#
#    In the "Other.debtors/guarantors" category, 41 had a co-applicant, 52 had a
#    guarantor of some kind, and 907 of them had no co-applicant or guarantor.
#
#    From this information, we can glean that the majority of applicants are men,
#    and that a large portion of these individuals are applying for loans on the
#    strength of their own credit.


# 1) Install the “hexbin” package; create a hexbin plot for the age and 
#    income variables in custdata2 data frame. How does that 
#    compare to the scatterplot?

# Code:
library(ggplot2)
library(hexbin)
ggplot(custdata2, aes(x=age, y=income)) +
  geom_hex(binwidth=c(5, 15000)) +
  geom_smooth(color="white", se=T) +
  ylim(0,200000)

# The hexbin plot is more structured and gives a better idea as to the density of 
# occurrences compared to the confusion of the scatterplot.  The data is still
# difficult to read, but has a bit more order to it.


# 2) Visualize the relationship between the variables “Number of 
#    vehicles” and “Income”. What type of chart do you use? What do 
#    you see?

# Since I was looking at the relationship between two variables, at first it was
# tempting to use a scatter plot.  However, since I was looking at one variable
# which is discrete and one variable is continuous, this produced confusing
# results.  Finally, I opted for the hexbin plot so that I could examine the
# density of individuals across the categories.  The code is as follows:
ggplot(custdata2, aes(x=num.vehicles, y=income)) +
  geom_hex(binwidth=c(0.5, 10000)) +
  ylim(0,200000)

# This produces seven discrete columns (0-6 vehicles) where the density of
# individuals per income bracket is highlighted.  In this way, I see that the
# greatest number of individuals lie in the ~$10000-$100000 income bracket and
# that most of them own 1-2 vehicles.


# 3) Visualize the relationship between the variables “income less than 
#    30k” and “recent move”. What type of chart do you select? What 
#    do you see?

# Here, we have two boolean variables where the counts of intersection are the
# most significant observable.  Thus, I have chosen a stacked bar chart.
# Code:
ggplot(custdata) +
  geom_bar(aes(x=income.lt.30K, fill=recent.move))+
  theme_bw()+
  ggtitle("Recent Move Stats for Those With Incomes Under and Over $30K")

# The immediate observations I can make are that the majority of our group
# make more than $30,000 per year and that for both groups, very few of the
# individuals have recently moved.  In both groups, there is a grey section
# at the top of the column indicating "NA" answers.  There is a significantly
# greater number of "NA" answers for the group earning less than $30K.