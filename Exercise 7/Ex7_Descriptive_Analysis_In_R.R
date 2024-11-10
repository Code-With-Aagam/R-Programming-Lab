# Problem 1:

# Task 1 Importing Data Set
data("PlantGrowth")

View(PlantGrowth)

df <- PlantGrowth
head(df,n=8)

str(df)

# Task 2: Calculate Descriptive Statistics

mean <- mean(df$weight)
print(mean)

median <- median(df$weight)
print(median)

library(modeest)

mode <- mfv(df$weight)
print(mode)

varience <- var(df$weight)
print(varience)

quatiles <- quantile(df$weight)
print(quatiles)

# Task 3: Plotting

library(ggplot2)

ggplot(df,aes(x=weight)) +
  geom_histogram(binwidth=1,fill = "green",color = "red",alpha =0.7)+
  labs(title = "Weight Distribution",x = "Weight",y = "frequency")+
  theme_dark()

ggplot(df,aes(x=group,y=weight,fill = group)) +
  geom_boxplot()+
  labs(title = "Group Distribution by Weight",x = "Group",y = "Weight")+
  theme_grey()

