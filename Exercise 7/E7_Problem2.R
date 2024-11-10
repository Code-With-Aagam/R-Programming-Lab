# Problem 2:

#Task 1: Data Importing and Inspection

#loading air quality data set

data("airquality")
View(airquality)

df <- airquality

head(df,n=5)

#Structure of Air Quality data set

str(df)

# Handling Missing values
is.na(df$Ozone)
sum(is.na(df$Ozone))

hist(df$Ozone)

median_ozone <- median(df$Ozone ,na.rm = TRUE)
print(median_ozone)

df$Ozone <- ifelse(is.na(df$Ozone),median_ozone,df$Ozone)
df
is.na(df$Solar.R)
sum(is.na(df$Solar.R))

hist(df$Solar.R)
median_solar <- median(df$Solar.R ,na.rm = TRUE)
print(median_solar)

df$Solar.R <- ifelse(is.na(df$Solar.R),median_solar,df$Solar.R)
df

sum(is.na(df))

# Descriptive Statistics 

#1: Basic Descriptive Statistics

# Mean,Median,Variance and IQR for Temp
mean_temp <- mean(df$Temp)
median_temp <- median(df$Temp)
variance_temp <- var(df$Temp)
IQR_temp <- IQR(df$Temp)

# Mean,Median,Variance and IQR for Ozone
mean_ozone <- mean(df$Ozone)
median_ozone <- median(df$Ozone)
variance_ozone <- var(df$Ozone)
IQR_ozone <- IQR(df$Ozone)

# Mean,Median,Variance and IQR for Wind
mean_wind <- mean(df$Wind)
median_wind <- median(df$Wind)
variance_wind <- var(df$Wind)
IQR_wind <- IQR(df$Wind)

cat("Temp:\n Mean:", mean_temp, "Median:", median_temp, "Variance:", variance_temp,"IRQ:",IQR_temp,"\n")
cat("Ozone:\n Mean:", mean_ozone, "Median:", median_ozone, "Variance:", variance_ozone,"IQR",IQR_ozone, 
    "\n")
cat("Wind:\n Mean:", mean_wind, "Median:", median_wind, "Variance:", variance_wind,"IQR:",IQR_wind, "\n")

#2: Skewness and Kurtosis

library(moments)
skew_df <- skewness(df)
print(skew_df)

kurt_df <- kurtosis(df)
print(kurt_df)

#3. Mode

mode <- function(x) {
  unique_x <- unique(x)  
  freq <- tabulate(match(x, unique_x))  
  mode_val <- unique_x[which.max(freq)]  
  return(mode_val)
}

wind_mode <- mode(df$Wind)
print(wind_mode)

library(modeest)
mode_wind <- mfv(df$Wind)
print(mode_wind)

# Task 3: Outlier Detection

Q1 <- quantile(df$Ozone,0.25)
Q3 <- quantile(df$Ozone,0.75)  
IQR <- Q3 - Q1

Q1_lower_Bound <- Q1 - 1.5 * IQR
Q3_Upper_Bound<- Q3 + 1.5 * IQR

outliers_df <- df[df$Ozone < Q1_lower_Bound | df > Q3_Upper_Bound]

print(outliers_df)
library(ggplot2)
ggplot(df,aes(x=Ozone))+
  geom_boxplot(outlier.colour = "green",outlier.size = 2)+
  labs(title = "Boxplot",
       x = "Ozone Levels")+
  theme_dark()

#Task 4: Data Transformation

# Before transformation
ggplot(df,aes(x=Ozone))+
  geom_histogram(binwidth = 4,color="black", fill = "red",alpha = 1.2)+
  labs(title = "Histogram of Ozone Before Tranformation",x="Ozone Distribution",y="Frequency")+
  theme_dark()

# Log transformation
df$Ozone_Log <- log(df$Ozone + 1)

# After transformation
ggplot(df, aes(x = Ozone_Log)) +
  geom_histogram(binwidth = 0.2,color = "black",fill = "green", alpha = 1.2) +
  labs(title = "Distribution of Ozone after Log Transformation", x = "Log(Ozone + 1)", y = "Frequency") +
  theme_dark()

#Task 5: Covariance and Correlation

#1. Covariance
df_cov1 <- cov(df$Temp,df$Wind,method = "pearson")
print(df_cov)

df_cov2 <- cov(df$Ozone,df$Temp,method = "pearson")
print(df_cov2)

#2. Correlation Matrix

df_cor <- cor(df)
print(df_cor)

heatmap(df_cor,main = "Heatmap of Airquality Dataset")

# Task 7: Advance Visualization

#1. Pair Plot

# Create the pair plot
library(tidyverse)
df_new <- df %>% 
  select(Ozone,Wind,Temp,Solar.R)
df_new

pairs(df_new,
      main = "Pair Plot",
      pch = 21)

#2. Boxplot with Grouping
library(tidyverse)
df_group <-df %>% 
  select(Temp,Month,Ozone) %>% 
  group_by(Month)

ggplot(df_group, aes(x = factor(Month), y = Temp, fill = factor(Month))) +
  geom_boxplot() +
  labs(title = "Boxplot of Temperature Across Months", 
       x = "Month", 
       y = "Temperature") +
  theme_dark()

#3. Scatter Plot With Regression line

ggplot(df, aes(x = Temp, y = Ozone)) +
  geom_point(color = "red", shape = 15) +  
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  
  labs(title = "Scatter Plot of Temperature Vs Ozone",x = "Temperature",y = "Ozone") +
  theme_dark()

plot(df$Temp,df$Ozone,main="Scatter Plot of Temperature Vs Ozone",
     xlab = "Temperature",
     ylab = "Ozone",
     col = "red",
     pch = 15)

abline(lm(Ozone ~ Temp, data = df), col = "blue")
