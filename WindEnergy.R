##############################################################################################
#                                     Wind Energy Dataset                                    #
#																			Hold on to your wigs :)                                #
#	                                                                                           #
##############################################################################################

#-------------------------------------- Loading Libraries -------------------------------------------#
# Loading Libraries (Please feel free to add those neccesary for the completion of the project)
if (require(tidyverse,VIM)==FALSE) 
{
	install.packages("tidyverse","VIM")
}
#--------------------------------------Loading the data-------------------------------------------#
# Loading Data
 energy = read.csv("weather_features.csv")
 weather_features = read.csv("energy_dataset.csv")
 #--------------------------------------Creating Useful Functions-------------------------------------------#
# SumNA function
sumNa <- function(x){
	ty= is.na(x)
	yt= sum(ty)
	return(yt)
}
 #--------------------------------------Summarising NA Values Per Variable-------------------------------------------#
# Checking for missingness
apply(energy, 2,sumNa) 
apply(weather_features, 2,sumNa)
#--------------------------------------Creating a Variable From The Dataset Without NA Values-------------------------------------------#
# Omitting NA values
energy_noNa = na.omit(energy)
#
#--------------------------------------Generating Summaries of the Data-------------------------------------------#
# Checking Datasets
# Summaries for energy dataset
summary(energy) 
str(energy)
# Summaries for weather_features dataset
summary(weather_features) 
str(weather_features)
#--------------------------------------Joining Datasets-------------------------------------------#
#joining WH datasets 
energy_weather = inner_join(weather_features,energy,by=c("time" ="dt_iso"),suffix=c("_W","_E"))
apply(energy_weather, 2, sumNa)

# write.csv(energy_weather,file="energy_weather.csv")
#-------------------------------------- -------------------------------------------#


