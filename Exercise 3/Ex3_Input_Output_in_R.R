# Simple User Interaction

var1 = readline(prompt = "Enter the Full name")
var2 = readline(prompt = "Enter the Age")

cat("hello",var1,"!","You are",var2,"years old.")

# Reading and Summarizing Numbers

help("scan")

cat("enter the number seperated by spaces or commas")
number <- scan()

mean <- mean(number)
median <- median(number)
Standard_Deviation <- sd(number)
cat(mean,median,Standard_Deviation)

# Printing the calculated stats  with appropriate labels

cat("mean of the numbers:",mean,"\n","meadian of the numbers:",median,"\n",
    "sd of the numbers:",Standard_Deviation)

# Combining Input and Output

var3 <- readline(prompt = "Enter a name for a new text file:")
var4 <- readline(prompt = "Enter several numbers:")

write.table(var3,file = "Test1.txt")
write(var4,file = var3)

read <- scan(file = "Test1.txt")
#calculating mean and median
Mean <- mean(read)
Median <- median(read)
# Printing
cat(Mean,Median)

# 5 Generating a user Report

Name <- readline(prompt = "Enter Full Name:")
Age <- readline(prompt = "Enter Age:")
Gender <- readline(prompt = "Enter Gender:")
Email <- readline(prompt = "Enter Email:")
Work <- readline(prompt = "Enter number of Hours worked:")
ifelse(Work>=40,"Full-Time","Part-Time")
  
enhanced_report <- paste(c(
  paste("Hello", Name, ","),
  paste("You are", Age, "years old and identify as", Gender, "."),
  paste("Your email address is", Email, "."),
  paste("You work", Work, "hours per week."),
  ifelse(Work >= 40, "You are working full-time.", "You are working part-time.")
))

# Print the enhanced report
print(enhanced_report)
