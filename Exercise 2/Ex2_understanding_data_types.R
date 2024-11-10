#Task 1
#1.1 Working with vectors

num_vec <- c(3.5,2.4,7.8,4.1)
char_vec <- c("apple","banana","cherry","date")
log_vec <- c(TRUE,FALSE,TRUE,FALSE)

#Printing
cat(num_vec,char_vec,log_vec)

#checking datatype of each vector
class(num_vec)
class(char_vec)
class(log_vec)

#finding the length of each vector
length(num_vec)
length(char_vec)
length(log_vec)

#1.2 Type conversion
num_char <- as.character((num_vec))
log_num <- as.numeric((log_vec))

#printing
cat(num_char,log_num)

#when logical is vector is converted to numeric TRUE and FALSE are converted to 1 and 0 respectively

#Task 2

#2.1 Working with list
a <- c(1,2,3,4)
char_str <- c("Hello World")
log_val <- c(TRUE)
my_list <- list(a,char_str,log_val)

#Printing the list
cat(a,char_str,log_val)

#Extract
help(list)
second_element <- my_list[c(2)]
print(second_element)

new_element <- c(5,6,7,8)
my_list$new_element <- c(5,6,7,8)
print(my_list)

#2.2 Working with Matrices

my_matrix <- matrix(c(1,2,3,4,5,6,7,8,9), nrow =3, ncol =3)
print(my_matrix)

#Assigning row and column names

colnames(my_matrix) = c("Col1","Col2","Col3")
 rownames(my_matrix) = c("Row1","Row2","Row3")
print(my_matrix)

#Extract
print(my_matrix[2,3])

#Sum
print(sum(my_matrix))

#Task 3

#3.1 Creating a Data Frame

Name <- c("John","sarah","Mike","Anna")
Age <- c(25,30,22,28)
Gender <- c("Male","Female","Male","Female")
Score <- c(85,90,88,92)

df <- data.frame(Name,Age,Gender,Score)
#Printing the data frame
print(df)
#Extracting the names of all female participants
library(tidyverse)
df %>% 
  select(Name,Gender) %>% 
  filter(Gender == "Female")

#Average
mean(df$Score)

# 3.2 Manipulating Data Frames
df$Passed <- df$Score>=85
df

#printing data frame
print(df)

#display only the participants who have passed

df %>% 
  select(Name,Score,Passed) %>% 
  filter(Passed == "TRUE")

# Task 4

# 4.1 Creating and manipulating Factors

levels <- c("A","B","C","D")
Grade <- factor(c("B","A","C","B","A","D"),levels = levels)

#Printing
print(Grade)

#Display the levels of factors
levels(Grade)

lev2 <- c("D","C","B","A")

Grade2 <- factor(c("B","A","C","B","A","D"),levels = lev2)

print(Grade2)

# 4.2 Factor Analysis

Student <- c("Tom","Jerry","Spike","Tyke")
grade <- factor(c("A","B","A","C"),levels = levels)

grades_df <- data.frame(Student,grade)
table(grade)
