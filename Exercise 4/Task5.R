#Task 5: Using Repeat loop with break and next

#Number Guessing Game

number = runif(1,1,100)
number = as.integer(number)
print(paste("The Random Number is",number))
 repeat{
   guess = readline(prompt = "Guess the Random number:")
   print(guess)
   if(as.integer(guess)==number){
     print("Guessed it right")
     break;
   }
 }
