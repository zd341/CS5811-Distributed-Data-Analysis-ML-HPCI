##############################################################################################
#                      World Happiness - Machine Learning Group Project                      #
#				          Be happy :)                                        #
#	                                                                                     #
##############################################################################################

# Loading Libraries (Please feel free to add those neccesary for the completion of the project)
if (require(tidyverse,VIM)==FALSE) 
{
	install.packages("tidyverse","VIM")
}
#----------------------------------------------------------
# Loading Data
world_happiness_2018 = read.csv("2018.csv")
world_happiness_2019 = read.csv("2019.csv")
world_bank_debt1819 = read.csv("world_bank_debt_data.csv")
#----------------------------------------------------------
# SumNA function

sumNa <- function(x){
	ty= is.na(x)
	yt= sum(ty)
	return(yt)
}
#----------------------------------------------------------
# Checking for missingness
apply(world_happiness_2018, 2,sumNa) 
apply(world_happiness_2019, 2,sumNa)
apply(world_bank_debt1819, 2,sumNa)
#----------------------------------------------------------
# Checking Datasets
# Summaries for world_happiness_2018 dataset
summary(world_happiness_2018) 
str(world_happiness_2018)
world_happiness_2018$Perceptions.of.corruption <- NULL
#note:- Perception of corruption may be require transformation to become a numeric type.
#----------------------------------------------------------
# Summaries for world_happiness_2019 dataset
summary(world_happiness_2019) 
str(world_happiness_2019)
world_happiness_2019$Perceptions.of.corruption <- NULL
#note:- Perception of corruption is a numeric type in this case.
#----------------------------------------------------------
# Summaries for world_bank datasets
summary(world_bank_debt1819) 
str(world_bank_debt1819)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Might remove this section evaluating how to join these sets horizontally 
#---------------------------------------------------------------------------------
# #Adding a column to distinguish WH2018 dataset by year
nrow(world_happiness_2018)
year <- rep(2018,156)
world_happiness_2018$year <- year
head(world_happiness_2018)
# #--------------------------------------------------------------------------------
# Adding a column to distinguish WH2019 dataset by year
nrow(world_happiness_2019)
year <- rep(2019,156)
world_happiness_2019$year <- year
head(world_happiness_2019)
#----------------------------------------------------------------------------------
# Creating a dataframe from both WH2018/19
# world_happiness_1819 = rbind(world_happiness_2018,world_happiness_2019)
# world_happiness_1819 <-  as.data.frame(world_happiness_2018,world_happiness_2019)
# rows_insert(world_happiness_2018,world_happiness_2019,by="Country.or.region")
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
world_happiness_1819 <- rbind.data.frame(world_happiness_2018,world_happiness_2019)
View(world_happiness_1819)
#note:- Was getting closer to the solution. Might just add the column for the year.***
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#----------------------------------------------------------------------------------
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#joining WH datasets 
# world_happiness1819 = inner_join(world_happiness_2018,world_happiness_2019,by="Country.or.region",suffix=c("_18","_19"))
# world_happiness1819 = left_join(world_happiness_2018,world_happiness_2019,by="Country.or.region")
#note:- On the left_join there were 4 missing values if you want to retain those, I can run a prediction to estimate the values
#----------------------------------------------------------
#Inspecting for missingness after join
# apply(world_happiness1819, 2, sumNa)
# summary(world_happiness1819) 
# str(world_happiness1819)
# View(world_happiness1819)
# dim(world_happiness1819)
#----------------------------------------------------------
#Potential Split in WB data

world_bank_debt1819 %>% 
	select(Country.Name,Series.Name,X2018..YR2018.) %>% 
	filter(Series.Name =="Total debt service (% of GNI)") %>% 
	head()

world_bank_debt1819 %>% 
	select(Country.Name,Series.Name,X2019..YR2019.) %>% 
	filter(Series.Name =="Total debt service (% of GNI)") %>% 
	head()

# VIM::kNN(,k = 5,weights = "mean")
