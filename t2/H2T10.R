asteikko <- c("t�ysin eri mielt�","t�ysin samaa mielt�","jokseenkin eri mielt�","jokseenkin eri mielt�","t�ysin eri mielt�",
              "t�ysin samaa mielt�","t�ysin eri mielt�","jokseenkin samaa mielt�","jokseenkin samaa mielt�","ei samaa eik� eri mielt�",
              "t�ysin samaa mielt�","jokseenkin eri mielt�","t�ysin eri mielt�",
              "jokseenkin samaa mielt�","t�ysin eri mielt�","ei samaa eik� eri mielt�",
              "jokseenkin eri mielt�","ei samaa eik� eri mielt�","jokseenkin eri mielt�","t�ysin samaa mielt�")

asteikkoarvot <- factor(asteikko, #order = TRUE, 
                        
                        levels <-c(1,2,3,4,5),
                        labels = c("t�ysin eri mielt�",
                                   "jokseenkin eri mielt�",
                                   "ei samaa eik� eri mielt�",
                                   "jokseenkin samaa mielt�",
                                   "t�ysin samaa mielt�"))
print(asteikkoarvot)
asteikkoarvot
print(mean(asteikkoarvot))
sum(table(asteikkoarvot))
sum(asteikkoarvot)
table(asteikkoarvot)
asteikkoarvot[5]
      