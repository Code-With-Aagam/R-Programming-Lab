student_data <- data.frame(
Student_ID <- c(1,2,3,4,5,6,7,8,9,10),
Name <- c("Aagam","John","Emily","Yash","Vinay","Vic","Sam","Joe","Atul","Priyank"),
Age <- c(22,23,20,19,22,26,17,20,22,23),
Gender <- c("Male","Male","Female","Male","Male","Female","Female","Male","Male","Male"),
Major <- c("Computer Science","Biology","Maths","Physics","Chemistry","Social Sciences","Economics",
           "Data Science","Geology","Biotech"),
GPA <- c(4.8,3.0,3.7,4.0,2.9,3.7,4.1,2.7,4.1,3.4)
)


write.csv(student_data, file = "Student_Data.csv",row.names = TRUE)

df <- read.csv("C:/Users/user/NIT/Sem 1/R/Exercise5/Student_Data.csv")
View(df)

library(dplyr)
df
df <-df %>% 
  select(-1)

View(df)

#Task 2: Data Inspection
head(df)
str(df)
summary(df)

#Task 3 Data manipulation

df$Passed <- df$GPA>=3.0
df
# Filter the data to show only students who passed
df %>% 
  select(Name,Major,Passed) %>% 
  filter(Passed == TRUE)

# sort the dataset by GPA
df1 <- df %>% 
  arrange(desc(GPA))
print(df1)

#Task 4: Summarizing Data
mean(df$GPA)

print(df$Major)
student_freq <- count(df,Gender)
print(student_freq) 
student_mean <- aggregate(x = df$GPA,by = list(df$Major),FUN =mean) 
print(student_mean)  

Gender_freq <- table(df$Gender)
print(Gender_freq)

#task 5: Visualizing data

barplot(Gender_freq,
        xlab = "Gender",
        ylab = "Number Of Students",
        col = "red",
        main = "Gender Vs Number of Students")

boxplot(GPA ~ Gender,
        data = df,
        xlab = "Gender",
        ylab = "GPA",
        main = "Box Plot Showing GPA Distribution by Gender",
        col = "blue")

#Task 6: Exporting data

write.csv(df,file = "student_pass.csv",row.names = FALSE)
df

