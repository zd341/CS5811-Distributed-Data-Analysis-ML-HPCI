## Installing Packages if Neccesary ##
if (require(tidyverse,visdat)==F) {
  
  install.packages("tidyverse")
  install.packages("visdat")
}

# 1. Reading Csv file

playstore = read.csv("googleplaystore.csv")
playstore_user_reviews = read.csv("googleplaystore_user_reviews.csv")

#-------------------------------------------------------------------------------
## 1.1 Finding out structure of our dataset

str(playstore,playstore_user_reviews)

#-------------------------------------------------------------------------------
## 1.2 Determining the amount of missingness

sum(is.na(playstore))
sum(is.na(playstore_user_reviews))

#-------------------------------------------------------------------------------

## 1.3 Scope of cleaning 

                                #** Incomplete **#


#-------------------------------------------------------------------------------

# 2. Joining Columns dataset columns 

# playstore_joined <- dplyr::left_join(playstore,playstore_user_reviews,by="App", keep=F)

# View(playstore_joined)



