#run_analysis.R
#author: Bryan Wise
#version: 1
#Gitbuh repo: 
#Load the dplyr and data.table packages
library(dplyr)
library(data.table)

#Make sure you are in a directory containing the UCI HAR Dataset
#This scripts assumes that the train and test data are in train and test folders
#setwd("~/Presentations/Coursera/Getting and cleaning data/Project/UCI HAR Dataset")
features <- read.table(file = "features.txt", sep = " ")
activity_labels <- read.table(file = "activity_labels.txt", sep = " ")

X_train <- read.table(file= "train/X_train.txt")
y_train <- read.table(file = "train/y_train.txt")
subject_train <- read.table(file= "train/subject_train.txt")

X_test <- read.table(file = "test/X_test.txt")
y_test <- read.table(file = "test/y_test.txt")
subject_test <- read.table(file = "test/subject_test.txt")

#Remove special characters from column names
#Add column names to all the data frames
names(X_train) <- gsub("[()-]","",features[,2])
names(X_test) <- gsub("[()-]","",features[,2])
names(y_train) <- "ActivityCode"
names(y_test) <- "ActivityCode"
names(subject_train) <- "Subject"
names(subject_test) <- "Subject"
names(activity_labels) <- c("ActivityCode","Activity")

#Combine data frames and convert to data tables for faster processing
X_train <- cbind(set = "train", subject_train, y_train, X_train)
X_test <- cbind(set = "test", subject_test, y_test, X_test)
train <- data.table(X_train)
test <- data.table(X_test)
all_data <- rbind(train,test)

#Use only columns with "mean" and "std" in the column name
cols <- c(2,3,intersect(grep("mean",names(all_data)),grep("meanFreq",names(all_data), invert=TRUE)),grep("std",names(all_data)))
result <- 
  all_data %>%
  select(cols) %>%
  #Join on the ActivityCode column
  merge(activity_labels, by = "ActivityCode") %>%
  #Remove ActivityCode from the data set
  select(-ActivityCode) 

#Take the mean of every column, grouped by Activity and Subject
result2 <- result[,lapply(.SD, mean), by = list(Activity,Subject)]
  
#Write the results to disk
write.table(result2, "tidy_data.txt", row.name=FALSE)  

