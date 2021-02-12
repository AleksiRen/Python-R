m <- matrix(1:10, nrow = 10, ncol = 10)

for(i in 1:10) { 
  for(y in 1:10){
  m[i,y]= (1/i)*y
  }
} 
print(sd(m))

