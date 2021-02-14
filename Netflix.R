### Libraries ###


if(require(tidyverse,visdat) == FALSE)
		
	{
		
		# Packages are installed if the statement is false
		install.packages('tidyverse')
    install.packages('visdat')
    
    # Install libraries
    library(tidyverse)
	}
	

#----------------------------------------------------------------------------------------------------------------------------------------------------
#(Zaahir- Processing First Dataset)
# 1. Import dataset

# netflix_version1 <-  read.csv("netflix_titles.csv") # No longer need to load this we have version2


# 2. Remove Unwanted Columns

## 2.1 Checking the variable names and dataset dimensions
# colnames(netflix_version1)
# dim(netflix_version1)

#>>>>> If you want to load netflix_version2 double click on it from the data folder.
## 2.2 Removing the agreed columns
# netflix_version2 <-  netflix_version1[,-c(5,10)]

## 2.3 Checking the variable names and dataset dimensions to confirm changes
colnames(netflix_version2)
dim(netflix_version2)


#--------------------------------------------------------------------------------------------------------------------------------------------------
#(Zaahir- joining data)



imdb_rating <- read.csv("mycsvfile.csv")

# netflix_version3 <- netflix_version2 %>% 
# left_join(imdb_rating, by ="title",suffix =c("_orginal","_imdb")) # generates 17,000 NA values
# write.csv(netflix_version3,file= "netflix_version3.csv")
# sum(is.na(netflix_version3)) # Test the number of NA's produced

netflix_version4 <- netflix_version2 %>% 
inner_join(imdb_rating, by ="title",suffix =c("_orginal","_imdb")) 
# write.csv(netflix_version4,file= "netflix_version4.csv") 
#>>> note:- Write this as a csv file if you need to.
sum(is.na(netflix_version4))


#--------------------------------------------------------------------------------------------------------------------------------------------------

# Joining Netflix Original Columns

netflix_originals <- read.csv("netflix_originals.csv")
netflix_version4 <- read.csv("netflix_version4.csv")

#>>> note:-  Removing unncessary columns from both datasets to enable a merge.

## Checking colnames in netflix_originals

colnames(netflix_originals)
colnames(netflix_version4)

# Removing the extra first column

netflix_version4 <- netflix_version4[,2:22]
# View(netflix_version4) #>>> note:- Use if you would like to inspect datset.

# Removing the unnecessary columns
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


# View(netflix_version4_removed_columns) #use this code only if you want to view results

#write_csv(netflix_version4_removed_columns,file="netflix_version5.csv") 
#>>> note:- Use this code if you want to save anything to your local machine  

## Joining the Netflix Originals Dataset Columns to ours
new_netflix_version4_removed_columns <- netflix_version4_removed_columns %>% 
  left_join(netflix_originals, by=c("title"="Title"),suffix =c("_previous","_originals")) 

# new_netflix_version4_removed_columns <- netflix_version4_removed_columns %>% 
#   inner_join(netflix_originals, by=c("title"="Title"),suffix =c("_previous","_originals")) 
#>>> note:- The line of code above produces no NA's but eliminates 75% of the original data size.
## Checking the column names 
new_netflix_version4_removed_columns %>% 
  colnames()

## Removing the unncessary columns 
netflix_version6 <- new_netflix_version4_removed_columns %>%
  select(
    show_id_imdb,
    title,
    type_orginal,
    director_orginal,
    country_orginal,
    date_added_orginal,
    release_year_orginal,
    listed_in_orginal,
    rating_imdb,
    description_orginal,
    Original.Network,
    Seasons,
    duration,
    Genre
  )

# write_csv(netflix_version6,file="netflix_version6.csv") # use this to produce the latest version of the 
                                                          # dataset

## The number of NA's produced. 

sum(is.na(netflix_version6))

#--------------------------------------------------------------------------------------------------------------------------------------------------

# Visualising Missing Data
## View(test) # Use this code if you want to view the new dataset

visdat::vis_miss(netflix_version6) #Produces a visualisation of missing data in added columns

# netflix_version6[is.na(netflix_version6$Original.Network),] <- "not netflix original"







