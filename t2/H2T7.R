v1 <- seq(3,6, by <- 0.1)
for(i in 1:length(v1)) { v1[i] <- exp(v1[i])*cos(v1[i]) }
print(mean(v1))


