#Task 8:Advance Control Operations

# Fibonacci Sequence

num <- numeric(10)
num[1] <- 1
num[2] <- 1

for(i in 3:10){
  num[i] <- num[i-1] + num[i-2]
}
print(num)
