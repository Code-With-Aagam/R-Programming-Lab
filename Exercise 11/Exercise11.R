# Problem 2:

n <- 8
In_Office <- rbinom(30,n,0.04)
In_Office
mean_office <- mean(In_office)
print(mean_office)


Remote <- rbinom(30,4,0.08)
Remote
mean_remote <- mean(Remote)
print(mean_remote)

t.test(In_Office,Remote)
#Report :
#We are not rejecting null hypothesis since the p-value (0.2129) is greater than 0.05, 
#indicating no significant difference between the means of the 'In_Office' and 'Remote' groups

#Problem 3:

mean_A <- 2
variance_A <- 16
sd_A <- sqrt(variance_A)
print(sd_A)

Model_A <- rnorm(40,mean_A,sd_A)
print(Model_A)

mean_B <- 2
variance_B <- 18
sd_B <- sqrt(variance_B)
Model_B <- rnorm(40,mean_B,sd_B)
print(Model_B)

f.test <- var.test(Model_A,Model_B)
print(f.test)

#Report:
#we are failing to reject the null hypothesis since the p-value (0.2679) is greater than 0.05, 
#indicating no significant difference in variances between Model_A and Model_B.

# Problem 1:

mean_value <- 2.5
sd_value <- 5
sample_size <- 50
data <- rnorm(sample_size, mean = mean_value, sd = sd_value)
print(data)

t_test_result <- t.test(data, mu = 2000)
print(t_test_result)

# Report :
# analysis strongly suggests that the true mean of the population is not 2000. 
# We are rejecting the null hypothesis as the p-value(2.2e-16) is very less than 0.05

#Problem 4:

size <- 30
mean_FA <- 5
sd_FA <- 7
Fertilizer_A <- rnorm(size,mean_FA,sd_FA)
print(Fertilizer_A)

mean_FB <- 8
sd_FB <- 5
Fertilizer_B <- rnorm(size,mean_FB,sd_FB)
print(Fertilizer_B)

t_test_result <- t.test(Fertilizer_A,Fertilizer_B)
print(t_test_result)

# Report :
# We are failing to reject the null hypothesis since the p-value (0.06988) is greater than 0.05, 
# indicating no statistically significant difference between the means of Fertilizer_A and Fertilizer_B.
