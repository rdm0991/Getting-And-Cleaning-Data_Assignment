## Load required libraries

library(reshape2)

## set the working directory 
setwd("C:\\Coursera\\UCI HAR Dataset")

## initialize constants and vectors
cleanOutput.file <- "cleanedOutput.txt"

## Only read the mean and std values from the data files
## create a vector for column Index to read the mean and std columns
features.extract <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 
                      84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163,
                      164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241,
                      253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347,
                      348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504,
                      516, 517, 529, 530, 542, 543) 

## create a vector of column names for the features mean and std
features.extract.names <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", 
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
                           "fBodyBodyAccJerkMag-std()",
                           "fBodyBodyGyroMag-mean()",
                           "fBodyBodyGyroMag-std()",
                           "fBodyBodyGyroJerkMag-mean()", 
                           "fBodyBodyGyroJerkMag-std()")

## vector for activities
activities <- c(1, 2, 3, 4, 5, 6) 
## vector for activity names
activity.names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                    "SITTING", "STANDING", "LAYING") 

# method for printing to the console. 
console <- function(...) {
        cat("[run_analysis.R]", ..., "\n") 
} 

# create a features filename given a dataset name. 
features.file <- function(name) { 
        paste("X_", name, ".txt", sep = "") 
} 

# create an activities filename given a dataset name. 
activities.file <- function(name) { 
        paste("Y_", name, ".txt", sep = "") 
} 

# create a subjects filename given a dataset name. 
subjects.file <- function(name) { 
        paste("subject_", name, ".txt", sep = "") 
} 

# Returns an intermediate dataframe for a single dataset. 
get.data <- function(dir, name) {
        # Setup the file paths. 
        real.dir <- file.path(dir, name) 
        features.name <- file.path(real.dir, features.file(name)) 
        activities.name <- file.path(real.dir, activities.file(name)) 
        subjects.name <- file.path(real.dir, subjects.file(name)) 
        
        console("Getting dataset:", real.dir) 
        
        # features, activities and subject are read from file and a data frame
        # is created by column binding each one of them
        
        # Read the features table. 
        console("  reading features...") 
        features.t <- read.table(features.name)[features.extract] 
        names(features.t) <- features.extract.names
        clean.data <- features.t 
        
        # Read the activities list. 
        console("  reading activities...") 
        activities.t <- read.table(activities.name) 
        names(activities.t) <- c("activity") 
        activities.t$activity <- factor(activities.t$activity, levels = activities, labels = activity.names) 
        clean.data <- cbind(clean.data, activity = activities.t$activity) 
        
        # Read the subjects list. 
        console("  reading subjects...") 
        subjects.t <- read.table(subjects.name) 
        names(subjects.t) <- c("subject") 
        clean.data <- cbind(clean.data, subject = subjects.t$subject) 
        
        # Return the clean data 
        clean.data 
} 


run.analysis <- function(dir) {
        console("Getting and Cleaning Data Project") 
        console("Analysis started -- ", format(Sys.time(), "%a %b %d %X %Y"))
        
        # Read the data. 
        console("Reading test datasets.", format(Sys.time(), "%a %b %d %X %Y")) 
        test <- get.data(dir, "test") 
        console("Finished Reading test datasets.", format(Sys.time(), "%a %b %d
                                                          %X %Y")) 
        console("Reading train datasets.", format(Sys.time(), "%a %b %d %X %Y")) 
        train <- get.data(dir, "train") 
        console("Finished Reading train datasets.", format(Sys.time(), "%a %b %d
                                                           %X %Y"))
        
        # Join the data. 
        console("Joining datasets.", format(Sys.time(), "%a %b %d %X %Y")) 
        complete.data <- rbind(test, train) 
        complete.data
        
        # Reshape the data. 
        
        # phase - 1
        # this steps takes the data and creates a molten data frame where id for 
        # row is a key made of subject and activity
        console("Melting to include IDs.",  format(Sys.time(), "%a %b %d %X 
                                                   %Y")) 
        complete.data.long <- melt(complete.data, id = c("subject", "activity")) 
        
        # phase - 2
        # In this phase data is recast into group by taking subject + activity 
        # as a primary key and mean is determined for the set of rows and 
        # a mean value returned to get the mean measurement
        console("Dcasting to get summarized data for subject-Activity.", 
                format(Sys.time(), "%a %b %d %X %Y")) 
        complete.data.wide <- dcast(complete.data.long, subject + 
                                            activity ~ variable, mean) 
        
        # Set the cleaned up data. 
        complete.data.clean <- complete.data.wide 
        
        # write final cleaned up file to a text file
        cleanOutput.file.name <- file.path(dir, cleanOutput.file)
        write.table(complete.data.clean, cleanOutput.file.name, 
                    row.names = FALSE, quote = FALSE) 
        console("Cleaned and summarized data file created - ", 
                cleanOutput.file.name, format(Sys.time(), "%a %b %d %X %Y"))
        
}




# Call analysis function to start the analysis process
run.analysis("Data") 

