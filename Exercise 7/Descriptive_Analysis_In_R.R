data()
data(package = .packages(all.available = TRUE))

head(CardioGoodFitness)

library(ggplot2)
ggplot(CardioGoodFitness,aes(x=Age)) +
  geom_histogram(binwidth=3,fill = "red",color = "black",alpha =0.8)+
  labs(title = "Age Distribution",x = "Age",y = "frequency")

ggplot(CardioGoodFitness,aes(x=Gender,y=Miles,fill = Gender)) +
  geom_boxplot()+
  labs(title = "Miles Distribution by gender",x = "Gender",y = "Miles")
summary(CardioGoodFitness)

ggplot(CardioGoodFitness,aes(x= factor(Education),fill = factor(Education)))+
  geom_bar()+
  labs(title = "Education Distribution",x="Education Levels",y="Count")+
  theme_dark()

mean = mean(CardioGoodFitness$Income)

cat(mean)

median = median(CardioGoodFitness$Age)
cat(median)

library(modeest)

install.packages("modeest")

library(modeest)
mode = mfv(CardioGoodFitness$Age)
print(mode)

r = range(CardioGoodFitness$Age)
print(r)

varience = var(CardioGoodFitness$Age)
print(varience)

sd = sd(CardioGoodFitness$Miles)
print(sd)

sd = sd(CardioGoodFitness$Age)
print(sd)

q = quantile(CardioGoodFitness$Age)
print(q)

IQR <- IQR(CardioGoodFitness$Age)
print(IQR)

summary(CardioGoodFitness)
sum = summary(CardioGoodFitness$Age)
print(sum)

x <- c(1,5,7,10,13)
y <- c(2,4,5,9,12)
print(cov(x,y))
print(cov(x,y,method = "pearson"))
print(cov(x,y,method = "kendall"))
print(cov(x,y,method = "spearman"))


print(cor(x,y))
print(cor(x,y,method = "pearson"))
print(cor(x,y,method = "kendall"))
print(cor(x,y,method = "spearman"))

head(CardioGoodFitness)

CardioGoodFitness_cor <- CardioGoodFitness %>% 
  select(Age,Education,Usage,Fitness,Income,Miles)
cor(CardioGoodFitness_cor)

CardioGoodFitness_cov <- CardioGoodFitness %>% 
  select(Usage,Fitness,Income,Miles)
cov(CardioGoodFitness_cov)

library(moments)
data <- c(1,2,3,4,6,7,10,30)
sk_value <- skewness(data)         
print(sk_value)


skew <- skewness(CardioGoodFitness_cor)
print(skew)
