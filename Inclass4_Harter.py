#Inclass4 Part 2

"""What does the code below do? Run the code in iPython.
For each line of code, add an explanation
through a comment."""

#PART I
# Prints out the string "I will now count my chickens:".
print "I will now count my chickens:"

# The following two lines print out the strings "Hens" and
# "Roosters," followed by the result of each equation (using
# normal order of operations) on the same line.
print "Hens", 25 + 30 / 6
print "Roosters", 100 - 25 * 3 % 4

# Prints out the string "Now I will count the eggs:".
print "Now I will count the eggs:"

# Prints out the result of the equation (7).
print 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

# Prints out the string "Is it true that 3 + 2 < 5 - 7?"
print "Is it true that 3 + 2 < 5 - 7?"

# Prints out a boolean value (here, false) specifying whether
# the inequality is true or not.
print 3 + 2 < 5 - 7

# The following two lines print out the specified string,
# followed by the results of the equations.
# (What is 3 + 2? 5
# What is 5 - 7? -2)
print "What is 3 + 2?", 3 + 2
print "What is 5 - 7?", 5 - 7

# Prints out the string "Oh, that's why it's False."
print "Oh, that's why it's False."

# Prints out the string "How about some more."
print "How about some more."

# The following three lines print out the specified string, 
# followed by a boolean value specifying whether the inequality
# is true or not.
# ("Is it greater? True
# Is it greater or equal? True
# Is it less or equal? False)
print "Is it greater?", 5 > -2
print "Is it greater or equal?", 5 >= -2
print "Is it less or equal?", 5 <= -2

#PART II

# The following two lines set lists of days and months,
# putting a space between the days and a carriage return
# between the months.
days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

# The following two lines print out the specified lists,
# using the spacing specified in lines 53 & 54 and
# preceded by the specified strings.
# (Here are the days: Mon Tue Wed Thu Fri Sat Sun
# Here are the months: Jan
# Feb
# Mar
# Apr
# May
# Jun
# Jul
# Aug)
print "Here are the days: ", days
print "Here are the months: ", months

#PART III

# The following three lines create lists of objects, the first
# one being a list of integers, the second a list of strings,
# and the third a mix of integers and strings.
the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# The following two lines are a for-loop which traverses through
# the list "the_count" and outputs the integers one by one,
# each preceded by the specified string "This is count ".
# (This is count 1
# This is count 2
# This is count 3
# This is count 4
# This is count 5)
for number in the_count:
    print "This is count %d" % number

# The following two lines are a for-loop which traverses through
# the list "fruits" and outputs the strings one by one,
# each preceded by the specified string "A fruit of type: ".
# (A fruit of type: apples
# A fruit of type: oranges
# A fruit of type: pears
# A fruit of type: apricots)
for fruit in fruits:
    print "A fruit of type: %s" % fruit

# The following two lines are a for-loop which traverses through
# the list "change" and outputs the objects one by one,
# regardless of their type and each preceded by the specified
# string "I got ".
# (I got 1
# I got 'pennies'
# I got 2
# I got 'dimes'
# I got 3
# I got 'quarters')
# Use %r format when you don't know
#if the elements are strings or integers
for i in change:
    print "I got %r" % i

# Creates an empty list with no objects in it.
# we can also build lists, first start with an empty one
elements = []

# The following three lines are a for-loop that adds integer
# values in the range 0 through 6 to the list "elements".
# On the second line, the program outputs a
# string announcing that it is adding the particular integer
# to the list, and on the third line, it adds it.
# (Adding 0 to the list.
# Adding 1 to the list.
# Adding 2 to the list.
# Adding 3 to the list.
# Adding 4 to the list.
# Adding 5 to the list.)
# then use the range function to do 0 to 5 counts
for i in range(0, 6):
    print "Adding %d to the list." % i
    # append is a function that lists understand
    elements.append(i)

# The following two lines are another for-loop that traverses
# back through "elements" and lists its objects in order,
# each preceded by a string reading "Element was: ".
# (Element was: 0
# Element was: 1
# Element was: 2
# Element was: 3
# Element was: 4
# Element was: 5)
for i in elements:
    print "Element was: %d" % i


    #Inclass4 Part 3

"""What does the code below do? Run the code in iPython.
For each line of code, add an explanation
through a comment."""

#PART I

#Use the code from Lecture14.py to create and change the 
#'stuff' list; Then comment on each line of the code below
#what it does, and what the result is

# Prints "Oranges", the second element of the list 'stuff.' 
print stuff[1]
# Prints "Corn", the last element of 'stuff.'
print stuff[-1]
# Pops "Corn" off the end of 'stuff' and displays it.
print stuff.pop()
# Joins the remaining elements of 'stuff' into a single 
# string.  The elements are separated by spaces, as such:
# Apples Oranges Crows Telephone Light Sugar Boy Girl Banana
print ' '.join(stuff)
# Joins selected elements of 'stuff' into a single string.
# Here, the elements begin at the fourth element and stop
# before the sixth and are separated by pound signs, as
# such: Telephone#Light
print '#'.join(stuff[3:5]) 

#PART II

#Create comments where marked with # to explain the code below

# Creates a dictionary of five states with their string-valued
# names as keys and string-valued abbreviations as values.
states = {
    'Oregon': 'OR',
    'Florida': 'FL',
    'California': 'CA',
    'New York': 'NY',
    'Michigan': 'MI'
}

# Creates a dictionary of three states with their string-valued
# abbreviations as keys and major cities as values.
cities = {
    'CA': 'San Francisco',
    'MI': 'Detroit',
    'FL': 'Jacksonville'
}

# Adds the keys "NY" and "OR" to 'cities' with "New York" and
# "Portland" as values, respectively.
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# Prints 10 dashes: ----------
print '-' * 10
# The following two lines print the specified strings 
# followed by the specified values from 'cities.'
# NY State has:  New York
# OR State has:  Portland
print "NY State has: ", cities['NY']
print "OR State has: ", cities['OR']

# Prints 10 dashes: ----------
print '-' * 10
# The following two lines print the specified strings 
# followed by the specified values from 'states.'
# Michigan's abbreviation is:  MI
# Florida's abbreviation is:  FL
print "Michigan's abbreviation is: ", states['Michigan']
print "Florida's abbreviation is: ", states['Florida']

# Prints 10 dashes: ----------
print '-' * 10
# The following two lines print the specified strings 
# followed by the specified values from 'cities' referenced by
# the specified abbreviation value from 'states.'
# Michigan has:  Detroit
# Florida has:  Jacksonville
print "Michigan has: ", cities[states['Michigan']]
print "Florida has: ", cities[states['Florida']]

# Prints 10 dashes: ----------
print '-' * 10
# For-loop traverses the list 'states' by keys and values and
# prints the specified string for each state, substituting the
# "%s" values for the state and abbreviation in the order
# specified in the parentheses.
# California is abbreviated CA
# Michigan is abbreviated MI
# New York is abbreviated NY
# Florida is abbreviated FL
# Oregon is abbreviated OR
for state, abbrev in states.items():
    print "%s is abbreviated %s" % (state, abbrev)

# Prints 10 dashes: ----------
print '-' * 10
# For-loop traverses the list 'cities' by keys and values and
# prints the specified string for each state abbreviation,
# substituting the "%s" values for the state and abbreviation
# in the order specified in the parentheses.
# CA has the city San Francisco
# FL has the city Jacksonville
# MI has the city Detroit
# NY has the city New York
# OR has the city Portland
for abbrev, city in cities.items():
    print "%s has the city %s" % (abbrev, city)

# Prints 10 dashes: ----------
print '-' * 10
# For-loop traverses the list 'states' by keys and values
# and prints the specified string for each state, substituting
# the "%s" values for the state, abbreviation, and major city
# (referenced by its place in 'cities') in the order
# specified in the parentheses.
# California state is abbreviated CA and has city San Francisco
# Florida state is abbreviated FL and has city Jacksonville
# Michigan state is abbreviated MI and has city Detroit
# New York state is abbreviated NY and has city New York
# Oregon state is abbreviated OR and has city Portland
for state, abbrev in states.items():
    print "%s state is abbreviated %s and has city %s" % (
        state, abbrev, cities[abbrev])


