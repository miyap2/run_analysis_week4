## Getting and Cleaning Data Course Project - Week 4 Assignment
This is a codebook that describes the variables, data and transformations or work that have been performed to clean up the data collected from the accelerometers from the Samsung Galaxy S smartphone.

### Raw data files
Raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data sets used in this process are:

1. /train/X_train.txt
       + training set data. Containing 561 readings in each row.
2. /train/subject_train.txt
       + subject id corresponding to the training set data
3. /train/y_train.txt
       + activity id corresponding to the training set data
4. /test/X_test.txt
       + test set data. Containing 561 readings in each row.
5. /test/subject_test.txt
       + subject id corresponding to the test set data
6. /test/y_test.txt
       + activity id corresponding to the test set data
7. features.txt
       + list of features (measurement)
8. activity_labels.txt
       + The activity id and the descriptive names. They are:
           * 1 WALKING 
           * 2 WALKING_UPSTAIRS 
           * 3 WALKING_DOWNSTAIRS 
           * 4 SITTING 
           * 5 STANDING 
           * 6 LAYING 

### Aggregated tidy dataset
#### allmerged
A new aggregated tidy dataset "allmerged" is created during the program execution. This dataset contains all the data from the train and the test set. It also merges with the subject and activity to provide a complete data set. Only measurements on the mean and standard deviation for each measurement are kept as requested in the instructions of the assignment.

#### tidydataset
Another aggregated tidy dataset "tidydataset" is created. The data is grouped by 'subject' and 'activity' and take the average of each measurement for each activity and each subject.

### Output file - avg_data2.txt
The file contains the independent tidy data set with the average of each variable for each activity and each subject. 

The data includes:

   * subject - the subject id who performed the activity
   
   * activity - e.g. WALKING, SITTING, STANDING, etc.
     
   * The average of each mean or standard deviation measurements corresponding to the activity performed by the subject