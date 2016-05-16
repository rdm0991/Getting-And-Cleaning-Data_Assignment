# Getting-And-Cleaning-Data_Assignment
Repo for 'Getting And Cleaning Data' Course Assignment

run_analysis.R

The does the following cleanup:
1.The training and the test sets are merged to create one data set.
2.Only the measurements on the mean and standard deviation for each measurement
are extracted. 
3.The activities in the data set are named using descriptive activity names
4.Appropriately labels the data set with descriptive activity names. 
5.An independent tidy data set is created with the average of each variable 
for each activity and each subject. 

Analysis 

In R, source("run_analysis.R") initiates the analysis process and the output is
as shown below:

[run_analysis.R] Getting and Cleaning Data Project 
[run_analysis.R] Analysis started --  Sun May 15 12:36:50 PM 2016 
[run_analysis.R] Reading test datasets. Sun May 15 12:36:50 PM 2016 
[run_analysis.R] Getting dataset: Data/test 
[run_analysis.R]   reading features... 
[run_analysis.R]   reading activities... 
[run_analysis.R]   reading subjects... 
[run_analysis.R] Finished Reading test datasets. Sun May 15
                                                          12:36:54 PM 2016 
[run_analysis.R] Reading train datasets. Sun May 15 12:36:54 PM 2016 
[run_analysis.R] Getting dataset: Data/train 
[run_analysis.R]   reading features... 
[run_analysis.R]   reading activities... 
[run_analysis.R]   reading subjects... 
[run_analysis.R] Finished Reading train datasets. Sun May 15
                                                           12:37:05 PM 2016 
[run_analysis.R] Joining datasets. Sun May 15 12:37:05 PM 2016 
[run_analysis.R] Melting to include IDs. Sun May 15 12:37:05 PM 
                                                   2016 
[run_analysis.R] Dcasting to get summarized data for subject-Activity. 
                        Sun May 15 12:37:05 PM 2016 
[run_analysis.R] Cleaned and summarized data file created -  
                        Data/cleanedOutput.txt Sun May 15 12:37:06 PM 2016 

Process
1.For both the test and train datasets, produce an interim dataset: 
        i.Extract the mean and standard deviation features
        (listed in CodeBook.md, section 'Extracted Features'). 
        This is the  values  table.
        ii.Get the list of activities.
        iii.Put the activity labels (not numbers) into the  values  table.
        iv.Get the list of subjects.
        v.Put the subject IDs into the  values  table.

2.Join the test and train intermediate datasets.
3.Put each variable on its own row.
4.Rejoin the entire table, keying on subject/acitivity pairs, applying the mean 
function to each vector of values in each subject/activity pair. This is the 
clean dataset.
5.Write the clean dataset to disk.

Cleaned Data

The resulting clean dataset is in cleanOutput.txt . It contains one row for each
subject/activity pair and columns for subject, activity, and each feature that
was a mean or standard deviation from the original dataset.

Note:
three files are read in each folder.
X_* is the feature value file
Y_* is the activity identifier for the feature 
Subject_* is the identifier for the rows in X
