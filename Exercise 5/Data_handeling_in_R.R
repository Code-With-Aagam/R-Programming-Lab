# Task 1: Load the data set

student_data <- read_csv("Exercise5/student.csv")
View(student_data)

# Task 2: Data Inspection

#Printing first few rows using head()
head(student_data)

#Display the structure of the data set using str()
str(student_data)

#Summary of each column
summary(student_data)

# Task 3: Data Manipulation

student_data$Passed <- student_data$GPA>=3.0
student_data

library(tidyverse)
student_data %>%
  select(Name,Major,Passed) %>% 
  filter(Passed == TRUE)

#Sort the dataset by GPA in descending Order


  