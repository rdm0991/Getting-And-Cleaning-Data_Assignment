## Load required libraries

library(reshape2)

## set the working directory 
setwd("C:\\Coursera\\UCI HAR Dataset")

## initialize constants and vectors
cleanOutput.file <- "cleanedOutput.txt"
## create a vector for column Index to read the mean and std columns
features.extract <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 
                      84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163,
                      164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241,
                      253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347,
                      348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504,
                      516, 517, 529, 530, 542, 543) 
## create a vector of column names for the features mean and std
feature.extract.names <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", 
                           "tBodyAcc-mean()-Z", "tBodyAcc-std()-X",
                           "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", 
                           "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", 
                           "tGravityAcc-mean()-Z","tGravityAcc-std()-X", 
                           "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", 
                           "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y", 
                           "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", 
                           "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", 
                           "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", 
                           "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", 
                           "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", 
                           "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", 
                           "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X",
                           "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", 
                           "tBodyAccMag-mean()", "tBodyAccMag-std()", 
                           "tGravityAccMag-mean()", "tGravityAccMag-std()", 
                           "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", 
                           "tBodyGyroMag-mean()", "tBodyGyroMag-std()", 
                           "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
                           "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", 
                           "fBodyAcc-mean()-Z", "fBodyAcc-std()-X",
                           "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", 
                           "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", 
                           "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", 
                           "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", 
                           "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", 
                           "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", 
                           "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", 
                           "fBodyAccMag-mean()", "fBodyAccMag-std()", 
                           "fBodyBodyAccJerkMag-mean()",
                           "fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()"
                           , "fBodyBodyGyroMag-std()", 
                           "fBodyBodyGyroJerkMag-mean()", 
                           "fBodyBodyGyroJerkMag-std()")

## vector for activities
activities <- c(1, 2, 3, 4, 5, 6) 
activity.names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                    "SITTING", "STANDING", "LAYING") 
