asteikko <- c("täysin eri mieltä","täysin samaa mieltä","jokseenkin eri mieltä","jokseenkin eri mieltä","täysin eri mieltä",
              "täysin samaa mieltä","täysin eri mieltä","jokseenkin samaa mieltä","jokseenkin samaa mieltä","ei samaa eikä eri mieltä",
              "täysin samaa mieltä","jokseenkin eri mieltä","täysin eri mieltä",
              "jokseenkin samaa mieltä","täysin eri mieltä","ei samaa eikä eri mieltä",
              "jokseenkin eri mieltä","ei samaa eikä eri mieltä","jokseenkin eri mieltä","täysin samaa mieltä")

asteikkoarvot <- factor(asteikko, #order = TRUE, 
                        
                        levels <-c(1,2,3,4,5),
                        labels = c("täysin eri mieltä",
                                   "jokseenkin eri mieltä",
                                   "ei samaa eikä eri mieltä",
                                   "jokseenkin samaa mieltä",
                                   "täysin samaa mieltä"))
print(asteikkoarvot)
asteikkoarvot
print(mean(asteikkoarvot))
sum(table(asteikkoarvot))
sum(asteikkoarvot)
table(asteikkoarvot)
asteikkoarvot[5]
      