# Matias Lindfors, 9.11.2018, tässä vkon 2 tehtävä:

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep = "\t", header=TRUE)

str(lrn14)
dim(lrn14)

#data sisältää 183 havaintoa 60 muuttujasta

#age- ja sex-muuttujia ei tarvitse muokata.

lrn14$Attitude

#Attitude on combination-muuttuja, skaalataan se alkuperäiselle asteikolle:

lrn14$attitude <- lrn14$Attitude/10
lrn14$attitude

#seuraavaksi muodostetaan muuttujat deep, surface ja strategic. poimitaan lrn14-datasta deep-, surface- ja strategic-kysymykset kuten datacamp-harjoituksessa:

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

library(dplyr)

#dplyr-paketin lataaminen ei onnistu useista yrityksistä huolimatta. päädytään käyttämään 2. osassa valmista dataa.

#-ML
