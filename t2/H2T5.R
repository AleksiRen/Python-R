sade <- c(2.27,1.98,1.69,1.88,1.64,2.14 )
korkeus <- c(8.28,8.04,9.06,8.70,7.58,8.34)
tilavuus <- c()
for(i in 1:length(sade)){tilavuus[i]= (1/3*pi) * (sade[i]^2) *korkeus[i]}
print(mean(tilavuus[tilavuus>=10]))
  
  