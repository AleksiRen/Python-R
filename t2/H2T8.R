
summa<- 0
summa2 <- 0
for(i in 10:109) {summa <- summa + (i^3 + 4*i^2) }  #eka
for(i in 1:21) {summa2 <- summa + (2^i)/i + (3^i)/(i^2) } #toka
print(abs(summa-summa2))

