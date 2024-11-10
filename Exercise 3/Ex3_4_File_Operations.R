# 4 File operations

file_name <- readline(prompt = "Enter File name:")
if(file.exists(file_name)){
  data <- scan(file = file_name, what = double())
  
  mean1 = mean(data)
  median1 = median(data)
  
  print(data)
  print(paste("Mean is:",mean1))
  print(paste("Median is:",median1))
  
}else{
  print("file does not exist")
}

