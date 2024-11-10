# 1: Bernoulli trial

set.seed(123)
p <- 0.4
df <- rbinom(1000,1,p)
df

mean(df)
var(df)
hist(df,
     col = "red",
     main = "Bernoulli Distribution",
     xlab = "Outcome (0 = Failure, 1 = Success)",
     ylab = "Frequency")
legend("topright", legend = paste("p =", p), bg = "white")

CDF <- ecdf(df)
plot(CDF,main = "CDF of Bernoulli Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col = "green")
abline(h = 0:1, col = "blue", lty = 2)


# 2: Binomial distribution

set.seed(200)
n <- 10
p <- 0.6
df_Binomial <- rbinom(1000,n,p)
df_Binomial

mean <- mean(df_Binomial)
print(mean)

variance <- var(df_Binomial)
print(variance)
hist(df_Binomial,
     col = "lightgreen",
     main = "Binomial Distribution",
     xlab = "Number of Successes",
     ylab = "Frequency")
legend("topright", legend = paste("n =", n, ", p =", p), bg = "white")



mean_the <- n*p
print(mean_the)

#df_binomial <- rbinom(100000,10,p)
#print(df_binomial)

#mean_2 <- mean(df_binomial)
#print(mean_2)

var_the <- n*p*(1-p)
print(var_the)

CDF_Binomial <- ecdf(df_Binomial)
plot(CDF_Binomial, main = "CDF of Binomial Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col = "green")
abline(h = 0:1, col = "blue", lty = 2)

cat("Comparing Empirical and Theoritical Mean of Binomial Distribution","\n",
    "Empirical Mean :",mean,"\n",
    "Theoritical Mean :",mean_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Binomial Distribution","\n",
    "Empirical Variance :",variance,"\n",
    "Theoritical Variance",var_the,"\n")

# 3:Poisson Distribution

set.seed(123)
lambda <- 5
df_poisson <- rpois(1000, lambda)
print(df_poisson)

hist(df_poisson,
     col = "green",
     main = "Poisson Distribution",
     xlab = "Number of Events",
     ylab = "Frequency")
legend("topright", legend = paste("λ =", lambda), bg = "white")

mean_poisson <- mean(df_poisson)
print(mean_poisson)

variance_poisson <- var(df_poisson)
print(variance_poisson)

mean_poisson_the <- lambda
print(mean_poisson_the)

variance_poisson_the <- lambda
print(variance_poisson_the)

CDF_Poisson <- ecdf(df_poisson)
plot(CDF_Poisson,
    main = "CDF of Poisson Distribution",
    xlab = "X",
    ylab = "fn(X)",
    col = "red")
abline(h = 0:1, col = "blue", lty = 2)

cat("Comparing Empirical and Theoritical Mean of Poisson Distribution","\n",
    "Empirical Mean :",mean_poisson,"\n",
    "Theoritical Mean :",mean_poisson_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Poisson Distribution","\n",
    "Empirical Variance :",variance_poisson,"\n",
    "Theoritical Variance",variance_poisson_the,"\n")

# 4: Geometric Distribution

set.seed(150)
p <- 0.3
df_Geo <- rgeom(1000,p)
print(df_Geo)

hist(df_Geo,
     col = "lightblue",
     main = "Geometric Distribution",
     xlab = "Number of Failures Before First Success",
     ylab = "Frequency")
legend("topright", legend = paste("p =", p), bg = "white")

mean_geo <- mean(df_Geo)
print(mean_geo)

var_geo <- var(df_Geo)
print(var_geo)

CDF_Geo <- ecdf(df_Geo)
plot(CDF_Geo,
     main = "CDF of Geometric Distribution",
     xlab = "X",
     ylab = "fn(X)",
     col = "green")
abline(h = 0:1, col = "blue", lty = 2)
grid()

mean_geo_the <- 1/p
print(mean_geo_the)

var_geo_the <- (1-p)/p^2
print(var_geo_the)

cat("Comparing Empirical and Theoritical Mean of Geometric Distribution","\n",
    "Empirical Mean :",mean_geo,"\n",
    "Theoritical Mean :",mean_geo_the,"\n")
cat("Comparing Empirical and Theoritical Variance of Geometric Distribution","\n",
    "Empirical Variance :",var_geo,"\n",
    "Theoritical Variance",var_geo_the,"\n")







