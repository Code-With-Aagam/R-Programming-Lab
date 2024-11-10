#implementing nested loops

#Multiplication table

for(i in 1:10){
  for(j in 1:10){
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}
