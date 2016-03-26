# run_analysis_week4
Getting and Cleaning Data Week 4 Course Assignment

This README explains how the run_analysis.R script work.

This script assumes that the Samsung data used for this assignment has been downloaded and unzipped in your working directory.
For your reference, the data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This is the URL to download the data (if you have not done so)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To run the program, simply type "source("run_analysis.R") in your R Studio. 

The program will then do the following: 

1. Merge the training and test data sets to create one data set. This includes merging of X_train and X_test data, y_train and y_test data, as well as the subject_train and subject_test data. The "train" files contain 7352 rows of data, where the "test" files contain 2947 rows of data. After the merging, there is a total of 10,299 rows of data.

2. Extract only the measurements related to the mean and standard deviation for each measurement. There are total of 561 features (or measurement) listed. The program will filter the list and only get features with "-mean()" or "-std()".

3. Assign descriptive names to the activities that describe the activity taking place (i.e., walking). The activity descrptive names are extracted from the activity_labels.txt.

4. Appropriately label the variables, or columns, with descriptive variable names. This includes the "subject" and "activity". The "subject" is the person (represented by an ID) who performed the activities.

5. Finally, create an independent tidy data set with the average of each variable for each combination of activity and subject. The program will also clean up the temporary data set and variables created during the execution.

The output from step 5 above is written to a file named 'avg_data2.txt' in the user's working directory. 
To read the data, you should use the read.table() in R to load the data. 
