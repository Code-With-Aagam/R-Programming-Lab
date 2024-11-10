# Question 1: 

# a. Generating random data points

df <- rnorm(1000)
print(df)

mean_normal <- mean(df)
print(mean_normal)

# b. Use t-test to determine if the mean of sampled data is significantly different from zero

t.test(df, mu = 0)

# Question 2:

p <- 0.03

df_binomial <- rbinom(1000,n,p)
print(df_binomial)

mean_bio <- mean(df_binomial)
print(mean_bio)

variance <- var(df_binomial)
print(variance)

sd_bio <- sd(df_binomial)
print(sd_bio)

df_normal <- rnorm(1000,mean_bio , sd_bio)
print(df_normal)

t_test_normal <- t.test(df_normal , mu = mean_bio)
print(t_test_normal)

# Question 3:

data("sleep")
View(sleep)

head(sleep)

paired_t_test <- t.test(
  sleep$extra[sleep$group == 1], sleep$extra[sleep$group == 2],
  paired = TRUE)

print(paired_t_test)

# Question 4:

Group1 <- rnorm(500, mean = 5,sd = 2)
Group2 <- rnorm(500, mean = 5,sd = 3)

F_test <- var.test(Group1, Group2)
print(F_test)

# Question 5:

data("ToothGrowth")
View(ToothGrowth)

head(ToothGrowth)

library(tidyverse)
ToothGrowth1 <- ToothGrowth %>% 
  select(len,supp,dose) %>% 
  filter(supp == "VC")

print(ToothGrowth1)

mean1 <- mean(ToothGrowth1$len)
print(mean1)

ToothGrowth2 <- ToothGrowth %>% 
  select(len, supp, dose) %>% 
  filter(supp == "OJ")

mean2 <- mean(ToothGrowth2$len)
print(mean2)
cat("Compairing Mean of tooth length","\n",
    "Mean of Guinea pigs Given VC:",mean1,"\n",
    "mean of Guinea pigs Given OJ:",mean2)

t_test_result <- t.test(ToothGrowth1$len, ToothGrowth2$len)
print(t_test_result)

# Question 6:


data("mtcars")

mtcars_auto <- mtcars %>%
  filter(am == 0)
View(mtcars_auto)
head(mtcars_auto)

mtcars_manual <- mtcars %>%
  filter(am == 1)

View(mtcars_manual)

f_test_result <- var.test(mtcars_auto$mpg, mtcars_manual$mpg)
print(f_test_result)


