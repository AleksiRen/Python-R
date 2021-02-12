v1 <- c(3.3, 1.12, 3, -2.5, NA, 4.3, NA, 2, 0.5, NA, 4.3, -2, NA, -0.67, 5.2)
v1[is.na(v1)] <- mean(v1,na.rm = T)
print(median(v1))
