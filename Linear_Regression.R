# Question 1: Exploring Relationships

data("mtcars")

df <- mtcars
View(df)
head(df)
str(df)
summary(df)

library(ggplot2)

ggplot(df, aes(x = mpg, y = wt)) +
  geom_point(color = "red", shape = 21) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Scatter Plot of mpg and wt", 
       x = "mpg (miles per gallon)", 
       y = "wt (weight of the car)") +
  theme_minimal()

  
# looking at the scatter plot,I assume there is a negative linear relationship between the mpg and wt of a car. 
# The relationship appears to be strong.

# Question 2: Simple Linear Regression Model

model <- lm(mpg ~ wt, data = df)

print(model)
summary(model)

y = ((-5.344)*x)+37.285

# Question 3: Assessing Model Fit

R_squared_value = 0.7528

Adjusted_R_Squared <- 0.7446 

# Calculate the residuals and create a residual plot

residual <- resid(model)
print(residual)

plot(fitted(model), residual,
     pch = 21,
     col = "red",
     xlab = "Fitted Model",
     ylab = "Residual",
     main = "Residual Plot: Fitted vs Residuals")
abline(0, 0, col = "blue", lty = 2)



# Question 4: Multiple Linear Regression

model_new <- lm(mpg ~ hp+wt, data = df)

summary(model_new)

Multiple_R_Squared <- 0.8268

multiple_Adjusted_R_Squared <- 0.8148

cat("\n","Compairing R-Squared of the Multiple regression Model and Linear Regression Model","\n",
    "Linear Regression R-Squared:",R_squared_value,"\n","V/s","\n",
    "Multiple Regression Model R-Squared:",Multiple_R_Squared)
cat("\n","Adjusted R-Squared of the Multiple regression Model and Linear Regression Model","\n",
    "Linear Regression Adjusted-R-Squared:",Adjusted_R_Squared,"\n","V/s","\n",
    "Multiple Regression Model Adjusted-R-Squared:",multiple_Adjusted_R_Squared)

if(multiple_Adjusted_R_Squared > Adjusted_R_Squared)
{
  cat("Addig HP improved the model")
}else{
  cat("No Improvement")
}

# Question 5:

ggplot(data = data.frame(Residuals = resid(model_new), Fitted = fitted(model_new)),
       aes(x = Fitted, y = Residuals)) +
  geom_point(color = "red") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(title = "Residuals vs. Fitted Values (Multiple Model)", 
       x = "Fitted Values", y = "Residuals") +
  theme_light()

qqnorm(resid(model_new))
qqline(resid(model_new), col = "blue")

plot(model_new, which = 3)

