# 1: Normal Distribution

set.seed(123)
mean <- 100
sd <- 15

df_normal <- rnorm(1000,mean,sd)
print(df_normal)

hist(df_normal,
     prob = TRUE,
     col = "green",
     main = "Normal Distribution")
lines(density(df_normal))
grid()

mean_normal <- mean(df_normal)
print(mean_normal)

variance_normal <- var(df_normal)
print(variance_normal)

mean_normal_the <- mean
print(mean_normal_the)

variance_normal_the <- sd^2
print(variance_normal_the)

cat("Comparing Empirical and Theoritical Mean of Normal Distribution","\n",
    "Empirical Mean :",mean_normal,"\n",
    "Theoritical Mean :",mean_normal_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Normal Distribution","\n",
    "Empirical Variance :",variance_normal,"\n",
    "Theoritical Variance",variance_normal_the,"\n")

CDF_Normal <- ecdf(df_normal)
plot(CDF_Normal,
     main = "CDF of Normal Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col.01line = "blue",
     col = "green")
grid()

conf_int <- t.test(df_normal)$conf.int
print(conf_int)
# 2: Exponential Distribution

set.seed(123)
lambda <- 0.1

exp <- rexp(1000,lambda)
print(exp)


hist(exp,
     col = "red",
     main = "Exponential Distribution",
     probability = TRUE)
lines(density(exp))


mean_exp <- mean(exp)
print(mean_exp)

variance_exp <- var(exp)
print(variance_exp)

mean_exp_the <- 1/lambda
print(mean_exp_the)

variance_exp_the <- 1/lambda^2
print(variance_exp_the)

cat("Comparing Empirical and Theoritical Mean of Exponential Distribution","\n",
    "Empirical Mean :",mean_exp,"\n",
    "Theoritical Mean :",mean_exp_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Exponential Distribution","\n",
    "Empirical Variance :",variance_exp,"\n",
    "Theoritical Variance",variance_exp_the,"\n")

CDF_Exp <- ecdf(exp)
plot(CDF_Exp,
     main = "CDF of Exponential Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col.01line = "blue",
     col = "green")
grid()

#In an exponential distribution, the probability of an event occurring after time t is independent of how much time has already passed.
# 3: Normal Approximation to the Binomial Distribution

n <- 50
p <- 0.5

bin <- rbinom(1000,n,p)
print(bin)

mean_bin <- mean(bin)
print(mean_bin)

variance_bin <- var(bin)
print(variance_bin)

sd_bin <- sd(bin)
print(sd_bin)

mean_bin_the <- n*p
print(mean_bin_the)

variance_bin_the <- n*p*(1-p)
print(variance_bin_the)

sd_bin_the <- (n*p*(1-p))^(1/2)
print(sd_bin_the)

hist(bin,
     col = "lightblue",
     main = "Binomial Distribution",
     xlab = "Number of Successes",
     ylab = "Frequency",prob = TRUE)
lines(density(bin))

cat("Comparing Empirical and Theoritical Mean of Binomial Distribution","\n",
    "Empirical Mean :",mean_bin,"\n",
    "Theoritical Mean :",mean_bin_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Binomial Distribution","\n",
    "Empirical Variance :",variance_bin,"\n",
    "Theoritical Variance",variance_bin_the,"\n")
cat("Comparing Empirical and Theoritical Standard Deviation of Binomial Distribution","\n",
    "Empirical Standard Deviation :",sd_bin,"\n",
    "Theoritical Standard Deviation",sd_bin_the,"\n")

CDF_bin <- ecdf(bin)
plot(CDF_bin,
     main = "CDF of Binomial Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col.01line = "blue",
     col = "green")
grid()

# Approximate the binomial using a normal Distribution

normal <- rnorm(1000,mean_bin,sd_bin)
print(normal)

mean_norm <- mean(normal)
print(mean_norm)

hist(normal,
     col = "red",
     main = "Normal Distribution",
     prob = TRUE)
lines(density(bin))

# plotting Two graphs and Comparing Results
par(mfrow = c(1, 2))
hist(bin,
     col = "lightblue",
     main = "Binomial Distribution",
     xlab = "Number of Successes",
     ylab = "Density",prob = TRUE)
lines(density(bin))

hist(normal,
     col = "red",
     main = "Normal Distribution",
     prob = TRUE)
lines(density(normal))

# 4: Case Study:Manufacturing Quality Control

p <- 0.95
n <- 50
q <- 1-p
bin4 <- pbinom(q, 45, 0.95, lower.tail = TRUE, log.p = FALSE)
print(bin4)

mean_bin4 <- n*p
print(mean_bin4)

sd_bin4 <- (n*p*q)^(1/2)
print(sd_bin4)

norm4 <- pnorm(45, mean_bin4, sd_bin4, lower.tail=FALSE)
print(norm4)

# when n is sufficiently large ( n ≥ 5 0 )