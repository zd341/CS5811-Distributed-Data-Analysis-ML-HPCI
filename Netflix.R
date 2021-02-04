

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




