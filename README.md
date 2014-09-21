#Getiing and Cleaning Data Course Project
This repository contains a "dirty" data set, the script to tidy up this data set and the "tidy" data set.

#Backgroup
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data used in this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Code to tidy the data
run_analysis.R that does the following: 
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement. 
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names. 
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
See notes in the script itself for how each step was accomplished

#Running the script
Set your working directory to the directory that contains the script and the data.  Train and test data should be in Train and test folders repsectively.
```
source("run_analysis.R", echo=TRUE)
```