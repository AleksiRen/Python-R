
data <- read.csv('loans.csv')
data2<- read.csv('loans.csv')
dd = na.omit(data2)

#(data_cleaned[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)]

library(mice)

set.seed(843)

imputoitavat <- setdiff(names(data), "not.fully.paid")
imputoitu <- complete(mice(data[imputoitavat]))
data[imputoitavat] <- imputoitu

rm(imputoitu)



set.seed(144)
split <- sample.split(data$not.fully.paid, SplitRatio = 0.70)
data_train <- subset(data, split == T)
data_test <- subset(data, split == F)




#funktio : luokittelumatriisi
luokittelumatriisi <- function (oikeat, ennusteet, raja)
{
  table(oikeat, ennusteet > raja)
}



#funktio : tarkkuus
tarkkuus <- function ( TN, TP, FN, FP) {
  return ((TN*1.0+TP)/(TN+TP+FN+FP))
}
#credit.policy+ purpose+ installment+ log.annual.inc+ fico, revol.bal+ inq.last.6mths + pub.rec
malli <- glm(not.fully.paid ~ credit.policy+purpose+ installment+ log.annual.inc+fico+revol.bal+inq.last.6mths+ pub.rec, data= data_train, family= binomial)
summary(malli)

#tehdään ennusteet
ennusteet = predict(malli, type = "response", newdata = data_test)

#luokittelumatriisi
matriisi1 <- luokittelumatriisi(data_test$not.fully.paid, ennusteet, 0.5)
#tarkkuus
tarkkuus1 <- tarkkuus(matriisi1[1,1], matriisi1[2,2], matriisi1[1,2], matriisi1[2,1])
