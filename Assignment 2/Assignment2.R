# Problem 3:

Mine1 = c(8260,8130,8350,8070,8340)
Mine2 <- c(7950,7890,7900,8140,7920,7840)

F_test <- var.test(Mine1,Mine2)
print(F_test)

if (F_test$p.value > 0.05) {
  print("Fail to reject the null hypothesis")
} else {
  print("Reject the null hypothesis")
}

# Report :

# We fail to reject the null hypothesis because the p-value > 0.05
# meaning there's no significant evidence to suggest that the variances of the two population are different.

# Problem 1:

sample_mean <- 10000
x <- 9900              
n <- 30               
alpha <- 0.05          
sd <- 120

z_score <- (x - sample_mean) / (sd / sqrt(n))
print(z_score)

critical <- qnorm(1 - alpha)
print(critical)

# Decision: Reject the null hypothesis if z_score is less than -critical
reject <- z_score < -critical
print(reject)


# Problem 5:

south <- c(15.0,8.0,3.8,6.4,27.4,19.0,35.3,13.6)
north <- c(18.8,23.1,10.3,8.0,18.0,10.2,15.2,190.0,20.2)

F_test_expenditure <- var.test(south,north)
print(F_test_expenditure)

# Report :
# Since the p-value is extremely low (0.0002152), 
# we have strong evidence to reject the null hypothesis and conclude that the 
# variances of south and north are significantly different

# Problem 7:

df <- data.frame( Regions = c(1,2,3,4,5,6,7,8,9,10,11),
                  LE_1900 = c(42.7,43.7,34.0,39.2,46.1,48.7,49.4,5.9,55.3,NA,NA),
                  LE_1970 = c(54.2,50.4,44.2,49.7,55.4,57.0,58.2,56.6,61.9,57.5,53.4))
df

f_test_LE <- var.test(df$LE_1900,df$LE_1970)
print(f_test_LE)

# Report :
# Since the p-value is very low (0.002457),
# we have strong evidence to reject the null hypothesis and conclude that the variances are significantly different

# Problem 4:

df1 <- data.frame(sampleA = c(24,27,26,21,25,NA),
                  SampleB = c(27,30,28,31,22,36))

f_test_nicotine <- var.test(df1$sampleA,df1$SampleB)
print(f_test_nicotine)

paired_t_test <- t.test(df1$sampleA,df1$SampleB)
print(paired_t_test)

# Report:

# Based on both the Welch Two Sample t-test and the F-test:

# The two samples do not show statistically significant differences in means or variances at the 5% level.
# This might suggest that the samples could come from populations with similar characteristics, 
# though this is not definitive evidence that they come from the same population


# Problem 2:

n_A <- 1000
x_A <- 400
n_B <- 800
x_B <- 400

p_A <- x_A / n_A
p_B <- x_B / n_B

p_pool <- (x_A + x_B) / (n_A + n_B)

SE <- sqrt(p_pool * (1 - p_pool) * (1/n_A + 1/n_B))


z <- (p_A - p_B) / SE
print(z)
p_value <- 2 * (1 - pnorm(abs(z)))
print(p_value)

#Since the p-value is much less than 0.05, you reject the null hypothesis. 
#This means that there is a statistically significant difference between the 
#proportions of wheat consumers in the two towns (A and B) at the 5% significance level.

# Problem 9:

#part a:
mean1 <- 70
sd1 <- 10
normal1 <- rnorm(150, mean1,sd1)
normal1

mean2 <- 75
sd2 <- 10
normal2 <- rnorm(150,mean2,sd2)
normal2

#part b
mean_1 <-mean(normal1)
print(mean_1)
sd_1 <- sd(normal1)
print(sd_1)

mean_2 <- mean(normal2)
print(mean_2)

sd_2 <- sd(normal2)
print(sd_2)

t_test_result <- t.test(normal1, normal2)
print(t_test_result)

standard_error <- sqrt((sd1^2 / n) + (sd2^2 / n))
print(standard_error)

z_score <- (mean2 - mean1) / standard_error
print(z_score)

p_value <- 2 * (1 - pnorm(abs(z_score)))
print(p_value)

#part d:
if (p_value < alpha) {
  print("Reject the null hypothesis: There is a significant difference in means at the 5% significance level.\n")
} else {
  print("Fail to reject the null hypothesis: No significant difference in means at the 5% significance level.\n")
}

#Problem 8:

#part a:
test <- 0.6
n <- 200
alpha <- 0.05

data <- rbinom(n, 1,test)
data

#part b:
sample <- mean(data)
print(sample)

#part c:
z_score <- (sample-test)/sqrt((test*(1-test))/n)
print(z_score)

# part d:
p_value <- 2 * (1 - pnorm(abs(z_score)))
print(p_value)

if (p_value < alpha) {
  print("Reject the null hypothesis: The sample is significantly different from 0.6 at the 5% significance level.\n")
} else {
  print("Fail to reject the null hypothesis: The sample is not significantly different from 0.6 at the 5% significance level.\n")
}
