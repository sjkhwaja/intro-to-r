# Intro to R lesson
# November 7th, 2022

# Part 1

# Interacting with R

## I am adding 3+5. R is fun!
3+5

x <- 3
y <- 5
x
y

x + y
number <- x + y

#R Syntax and Data Structures

## create numeric vector and store vector as variable 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

## create character vector and store vector as variable 'species'
species <- c("ecoli", "humans", "corn")
species

## Exercise 
combined <- c(glengths, species)
## End Exercise 

## create charcter vector and store vector as variable 'expression'
expression <- c("low","high","medium","high","low","medium","high")

## Turn expression vector into factor
expression <- factor(expression)

## Exercise
samplegroup <- c("CTL", "CTL","CTL","KO","KO","KO","OE","OE","OE")
samplegroup <- factor(samplegroup)
## End excersie 

## create a dataframe and store as var df
df <- data.frame(species, glengths)
df

## Exercise 
titles <- c("Catch-22","Pride and Prejudice","Nineteen Eighty Four")
pages <- c(453, 432, 328)
df2 <- data.frame(titles, pages)
df2
## End exercise

## lists
list1 <- list(species, df, number)
list1

## Exercise
list2 <- list(species, glengths, number)
list2
## End of exercise

# Functions and Arguments 

## basic functions
glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

sqrt(81)
sqrt(glengths)

round(3.14159)

?round
args(round)

example("round")

round(3.14159, digits = 2)

## Exercise
mean(glengths)
test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm = TRUE)
sort(glengths, decreasing = TRUE)
## End exercise

## name function, assign value to it
##name_of_function <- function(argument1, argument2) {
#  statements or code that does something
#  return(something)
#}
square_it <- function(x) {
  square <- x * x
  return(square)
}
square_it(5)

multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}
multiply_it(x=3,y=2)

### Reading in and Inspecting Data

# check arguments for function
?read.csv
metadata <- read.csv(file='data/meta_data')

## Exercise
proj_summary <- read.table(file = 'data/project-summary.txt')
# End exercise

## inspecting data structures
head(metadata)

## Exercise
class(metadata)
class(glengths)
rownames(metadata)
colnames(metadata)

### Practice Exercises: Day 2 Activities
temp_conv <- function(temp_f) {
  temp_k <- ((temp_f -32) * 5 / 9) + 273.15
  return(temp_k)
}
temp_conv(70)

round(temp_conv(70), 1)

# Part 2

# Data Subsetting

## create vector called age
age <- c(15, 22, 45, 52, 73, 81)

## only pull 5th age in vector
age[5]

## pull ages except the fifth one in vector
age[-5]

## selecting more than one element use square bracket syntax
age[c(3,5,6)]

## select sequence of continuous values in nector
age[1:4]

## Exercise
alphabet <- c('C','D','L','X','F')
age[c(1, 2, 5)]
age[-3]
age[5:1]
## End Exercise

## logical expressions
age > 50
age > 50 | age < 18
age
age[age > 50 | age < 18]

which(age > 50 | age < 18)
age[which(age > 50 | age < 18)]

## factors
expression[expression == "high"]

## Exercise
samplegroup[which(samplegroup != "KO")]
## End exercise

## Releveling factors
expression
str(expression)

expression <- factor(expression, levels=c("low", "medium", "high")) # you can re-factor a factor 
str(expression)

## Exercise
samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))
str(samplegroup)
## End exercise

# Packages and Libraries

## check what libraries are loaded
sessionInfo()
# or
search()

## install packages
install.packages("ggplot2")

## loading libraries
library(ggplot2)

### Exercise -install tidyverse for later use
install.packages("tidyverse")
## end of exercise

# Data Wrangling

## Extract value 'Wt'
metadata[1, 1]

## Extract value '1'
metadata[1, 3] 

## Extract third row
metadata[3, ] 

## Extract third column as a data frame
metadata[ , 3, drop = FALSE] 

## Dataframe containing first two columns
metadata[ , 1:2] 

## Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 

## Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 

## Check column names of metadata data frame
colnames(metadata)

## Check row names of metadata data frame
rownames(metadata)

## Extract the genotype column
metadata$genotype 

## Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

## Exercise
metadata[c("sample2", "sample8"), c("genotype", "replicate")]
metadata$genotype[c(4,9)]
## End exercise

## logical expressions
metadata$celltype == "typeA"
logical_idx <- metadata$celltype == "typeA"
metadata[logical_idx, ]

## using which functions
which(metadata$celltype == "typeA")
idx <- which(metadata$celltype == "typeA")
metadata[idx, ]
which(metadata$replicate > 1)

idx <- which(metadata$replicate > 1)
metadata[idx, ]

metadata[which(metadata$replicate > 1), ]
sub_meta <- metadata[which(metadata$replicate > 1), ]

## Exercise
metadata[which(metadata$genotype == "KO"), ]
## End exercise

## lists
list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]

list1[[1]][1]

## Exercise
random <- list(c(metadata, age, list1, samplegroup, number))
random[[1]]
## End exercise

## names fucntion
names(list1)

## name components of the list
names(list1) <- c("species", "df", "number")
names(list1)

# Extract 'df' component
list1$df

## Exercise
names(random)

names(random) <- c("metadata")
names(random)
## End of exercise

### Practice Exercises: Day 3 Activities
animals <- read.csv("data/animals.csv")

#Check to make sure that `animals` is a dataframe.
class(animals)
nrow(animals)
ncol(animals)

#Data wrangling
animals[1,1]
animals[which(animals$speed == 40), 1]
animals[which(animals$speed == 40), "speed"]
animals$speed[which(animals$speed == 40)]

animals[c(2,5),]
animals[which(animals$color == "Tan"),]

animals[which(animals$speed > 50), "color", drop =F]

names(animals_list) <- colnames(animals)
