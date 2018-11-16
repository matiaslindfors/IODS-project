#Matias Lindfors 16.11.2018
#Week 3 assignment:

data_mat <- read.csv("C:\\Users\\matia\\Desktop\\GitHub\\IODS-project\\data\\student-mat.csv", sep=";", header=TRUE)
data_por <- read.csv("C:\\Users\\matia\\Desktop\\GitHub\\IODS-project\\data\\student-por.csv", sep=";", header=TRUE)

dim(data_mat)
#33 variables and 395 observations

dim(data_por)
#33 variables and 649 observations

str(data_mat)
str(data_por)

install.packages("dplyr")
library(dplyr)

join_by <- c("school", "sex", "age", "adress", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery", "internet")

mat_por <- inner_join(data_mat, data_por, by = join_by, suffix = c(".data_mat", ".data_por"))

#This produces an error that I can't solve:
#"Error: `by` can't contain join column `adress` which is missing from LHS"
#I'll get back to this after the analysis exercise