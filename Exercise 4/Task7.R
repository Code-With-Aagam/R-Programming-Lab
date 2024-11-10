# Advance Control Operations

# Basic Calculator

number1 = readline(prompt = "Enter the first number:")
number2 = readline(prompt = "Enter the second number:")

number1 <- as.integer(number1)
number2 <- as.integer(number2)
sum <- c(number1 + number2)
sub <- c(number1 - number2)
multiply <- c(number1*number2)
divide <- c(number2/number1)
operator = readline(prompt = "Enter the operator:")
if(operator == "+"){
  cat("sum",sum)
}else if (operator=="-"){
  cat("subtract",sub)
}else if(operator == "*"){
  cat("Multiply",multiply)
}else if(operator == "/"){
  cat("divide",divide)
}
  