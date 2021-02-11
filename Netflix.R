### Libraries ###


if(require(tidyverse) == FALSE)
		
	{
		
		# Packages are installed if the statement is false
		#install.packages('tidyverse')
		
		# Loading libraries
		library(tidyverse)
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



imdb_rating <- read.csv("mycsvfile.csv")

netflix_version3 <- netflix_version2 %>% 
left_join(imdb_rating, by ="title",suffix =c("_orginal","_imdb")) 
# write.csv(netflix_version3,file= "netflix_version3.csv")


netflix_version4 <- netflix_version2 %>% 
inner_join(imdb_rating, by ="title",suffix =c("_orginal","_imdb")) 
# write.csv(netflix_version4,file= "netflix_version4.csv")


sum(is.na(netflix_version3))
sum(is.na(netflix_version4))


#--------------------------------------------------------------------------------------------------------------------------------------------------

# Joining Netflix Original Columns

netflix_originals <- read.csv("netflix_originals.csv")
netflix_version4 <- read.csv("netflix_version4.csv")

# Removing unncessary columns from both datasets to enable a merge.

## Checking colnames in netflix_originals

colnames(netflix_originals)
colnames(netflix_version4)

head(netflix_version4)

netflix_version4 <- netflix_version4[,2:22]
View(netflix_version4)

netflix_version4_removed_columns  <- netflix_version4 %>% 
  select(
    show_id_imdb,
    title,
    type_orginal,
    title,
    director_orginal,
    country_orginal,
    date_added_orginal,
    release_year_orginal,
    listed_in_orginal,
    description_orginal,
    duration,
    rating_imdb
  )

View(netflix_version4_removed_columns)



