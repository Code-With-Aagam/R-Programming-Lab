#Using return Statements

Power_Function <- function(base,power){
number1 = 1
for(i in 1:power){
  number1 = number1 * base
}
  return(number1)
}
print(Power_Function(2,5))
