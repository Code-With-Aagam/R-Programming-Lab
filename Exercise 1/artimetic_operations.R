#creating x and y
x <- 15
y <- 4

# Multiplication
mul_xy <- x*y

#addition
sum_xy <- x+y

#Subtraction
sub_xy <- x-y

#division
div_xy <- x/y

# Printing all 
cat(mul_xy,sum_xy,sub_xy,div_xy)

# modulus operation
mod_xy <- x%%y
# power operation
pow_xy <- x^y
# printing both Exponentiation and modulus
cat(mod_xy,pow_xy)

# integer division

div2_xy <- x%/%y

#printing div2_xy

print(div2_xy)

help("vector")

#Vector arithmetic

a <- c(1,2,3,4,5)
b <- c(6,7,8,9,10)

#Element wise addition
vec_sum <- a+b
print(vec_sum)

#subtraction
vec_sub <- a-b
print(vec_sub)

#multiplication
vec_mul <- a*b
print(vec_mul)

#division
vec_div <- a/b
print(vec_div)

#printing each resulting vector to console
cat(vec_sum,vec_sub,vec_mul,vec_div)

# Scalar and Vector Arithmetic
a <- c(1,2,3,4,5)+3
print(a)
b <- c(6,7,8,9,10)*2
print(b)
#printing result to console
cat(a,b)
#sum of squares
a <- c(1,2,3,4,5)^2
print(a)
sum_a <- sum(a)
print(sum_a)

