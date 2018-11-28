#Matias Lindfors, weeks 4 & 5; data wrangling

#WEEK 4 (Week 5 can be found below):

# 1) File created 
# 2) Reading data into R:

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# 3) Exploring the datasets:

dim(hd)
str(hd)

#The hd-dataset contains data on 194 countries, including details on their respective human development indexes, expected years of education, gross national income etc. Altogether 195 obs. across 8 variables.

dim(gii)
str(gii)

#The gii-dataset contains data on 194 countries, including details on their respective gender inequality indexes, maternal mortality ratios, female representation in parliament etc. Altogether 195 obs. across 10 variables.

#Let's create summaries of the variables included in the above-mentioned datasets:

summary(hd)
summary(gii)

# 4) Renaming variables

colnames(hd) <- c("HDI_rank", "country", "HDI", "exp_life", "exp_educ", "educ", "GNIpc", "GNIHDI_rank")
colnames(gii) <- c("GII_rank", "country", "GII", "mortality_maternal", "birth_adolescent", "female_parliament", "female_secondary", "male_secondary", "female_work", "male_work")

# 5) Creating new variables:

library(dplyr)
gii <- mutate(gii, sex_secondary = (female_secondary/male_secondary))
gii <- mutate(gii, sex_work = (female_work/male_work))

# 6) Joining the two datasets:

join_by <- "country"
hd_gii <- inner_join(hd, gii, by = join_by)
dim(hd_gii)

#We now have 195 obs. across 19 variables, as we should have.

#Let's rename the data and save it to a specified folder:

human <- hd_gii
write.table(human, file = "human")

#THE END OF WEEK 4.

#WEEK 5:

#At the moment, we have a dataset called "human" that was created last week. Let's explore its dimensions and structure:

dim(human)
str(human)

#So 195 observations accross 19 variables, as expected. The dataset includes data on health and educational aspects as well as data on female empowerment.

#Let's transform GNI to a numeric variable:

install.packages("stringr")
library(stringr)
str_replace(human$GNIpc, pattern=",", replace ="") %>% as.numeric

#Excluding unneeded variables:

keep <- c("country", "sex_secondary", "sex_work", "exp_educ", "exp_life", "GNIpc", "mortality_maternal", "birth_adolescent", "female_parliament")
human <- select(human, one_of(keep))

#Removing missing values:

complete.cases(human)
data.frame(human[-1], comp = complete.cases(human))
human_ <- filter(human, complete.cases(human))

#Removing observations related to regions instead of countries:

tail(human_, 10)
last <- nrow(human_) - 7
human_ <- human_[1:last, ]

#Adding countries as row names:

rownames(human_) <- human_$country

#Removing the country-variable:

human_ <- dplyr::select(human_, -country)

#Overwriting and saving:

human <- human_
write.table(human, file = "human")

#THE END OF WEEK 5.