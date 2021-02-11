### Libraries ###


if(require(tidyverse,RCurl) == FALSE)
		
	{
		
		# Packages are installed if the statement is false
		install.packages('tidyverse')
		install.packages('RCurl')
		
		# Loading libraries
		library(tidyverse,RCurl)
	}
	
#----------------------------------------------------------------------------------------------------------------------------------------------------
#(Zaahir- Processing First Dataset)
# 1. Import dataset

netflix_version1 <-  read.csv("netflix_titles.csv")

#>>> We must still add an additional dataset

# 2. Remove Unwanted Columns

## 2.1 Checking the variable names and dataset dimensions
colnames(netflix_version1)
dim(netflix_version1)

## 2.2 Removing the agreed columns
netflix_version2 <-  netflix_version1[,-c(5,10)]

## 2.3 Checking the variable names and dataset dimensions to confirm changes
colnames(netflix_version2)
dim(netflix_version2)




#--------------------------------------------------------------------------------------------------------------------------------------------------
#(Zaahir- joining data)


library(dplyr)
netflix_version2


imdb_rating <- read.csv("mycsvfile.csv")

netflix_version3 <- netflix_version2 %>% 
left_join(imdb_rating, by ="title",suffix =c("_orginal","imdb")) 
# write_rds(netflix_version3,file = "netflix_version3.rda")
# write.csv(netflix_version3,file= "netflix_version3.csv")


netflix_version4 <- netflix_version2 %>% 
inner_join(imdb_rating, by ="title",suffix =c("_orginal","imdb")) 
# write_rds(netflix_version4,file= "netflix_version4.rda")
# write.csv(netflix_version4,file= "netflix_version4.csv")


sum(is.na(netflix_version3))
sum(is.na(netflix_version4))
