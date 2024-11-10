#Task 1: create or load multiple data sets

df1 <- data.frame(
  Product_id <- c(1,2,3,4,5,6,7,8,9),
  Product_Name <- c("Milk","Bread","Eggs","Potato","Carrot","Beans","Palm oil",
                    "Olive oil","Chicken"),
  Category <- c("Essentials","Essentials","Essentials","Vegetables","Vegetables","Vegetables",
                "Oils","Oils","Meat"),
  Units_Sold <- c(15,20,10,22,18,17,10,6,1),
  Revenue <- c(150,100,100,440,108,51,1000,600,50),
  Date <- c(2003,2003,2004,2001,1947,1987,2024,2001,2015)
)
df2 <- data.frame(
  Product_id <- c(1,2,3,4,5,6,7,8,9),
  Product_Name <- c("Milk","Bread","Eggs","Potato","Carrot","Beans","Palm oil","Olive oil","Chicken"),
  Category <- c("Essentials","Essentials","Essentials","Vegetables","Vegetables","Vegetables",
                "Oils","Oils","Meat"),
  Price <- c(10,5,10,20,6,3,100,100,50)
  
)
write.csv(df1,file = "sales.csv",row.names = FALSE)
sales <- read.csv("C:/Users/user/NIT/Sem 1/R/Exercise5/sales.csv")

head(sales)
View(sales)

write.csv(df2,file ="product.csv",row.names = FALSE)
# loading product data
product <- read.csv("C:/Users/user/NIT/Sem 1/R/Exercise5/product.csv")
View(product)
head(product)

#Task 2: Data Inspection And cleaning

str(sales)
str(product)

summary(sales)
summary(product)

# identifying missing data in both data sets
sum(is.na(sales))
is.na(product)
library(zoo)

# Task 3: Merging Data Sets

data <- merge(sales,product,by = "Product_id",all = FALSE)
head(data)
print(data)


library(tidyverse)

# Task 4: data Transformation

#creating a new column
new_data <- data %>% 
  mutate(Total_revenue = Units_Sold*Price)
new_data
# Grouping the data by category and calculating the total units sold for each category
print(new_data)
library(dplyr)
group_data <- new_data %>% 
  group_by(Category.x) %>% 
  summarise(
    total_sale = sum(Units_Sold),
    total_revenue = sum(Total_revenue)
  )
print(group_data)

#Task 5 handling Data

new_data$Date <- as.Date(paste0(new_data$Date, "%Y-%m-%d"))

head(new_data$Date)

#creating new column month 
new_data$Month <- format(new_data$Date, "%m")

new_data$Year <- format(new_data$Date, "%Y")

head(new_data)
#Revenue for each month
yearly_data <- new_data %>%
  group_by(Year) %>%
  summarise(
    total_revenue = sum(Total_revenue)
  )


print(yearly_data)


#Task 6: Visualizing Data

# Bar plot for total revenue by category
barplot(group_data$total_revenue,
        names.arg = group_data$Category.x, # Set category names as x-axis labels
        xlab = "Category", 
        ylab = "Total Revenue", 
        col = "red", 
        main = "Total Revenue for Each Category")

# Line plot for total revenue over the years
plot(yearly_data$Year, yearly_data$total_revenue, 
     type = "o",
     col = "blue", 
     xlab = "Year", 
     ylab = "Total Revenue", 
     main = "Total Revenue Over Years")

#task 7: Applying Functions to Data

calculate_profit <- function(revenue, margin = 0.20) {
  profit <- revenue * margin
  return(profit)
}
new_data$Profit <- calculate_profit(new_data$Total_revenue)
head(new_data)

# Export the final data set to CSV
write.csv(new_data, file = "final_sales_data.csv", row.names = FALSE)

final_sales_data


df <- read.csv("C:/Users/user/NIT/Sem 1/R/Exercise5/sales.csv")

df_total <- df %>% 
  select(Revenue) %>% 
  summarise(sum = sum(Revenue))

print(df_total)
