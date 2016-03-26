###########################################################################
## This script is written for Getting and Cleaning Data Course Project
## Week 4 Assignment
###########################################################################
#
# make sure you have dplyr installed. You can run the following command if not: 
# install.packages("dplyr")
# It is required for the group_by and summarise_each below
library(dplyr)
#
# Assumption: you have unzipped the data for the project in your working directory.
# You should have the following as the base data directory, the train and test subdirectories
dataBaseDir = "UCI HAR Dataset/"
trainDataDir <- paste(dataBaseDir, "train/", sep="")
testDataDir <- paste(dataBaseDir, "test/", sep="")

# Firstly, merge the training and the test sets to create one data set 
#
# X_train.txt merge with X_test.txt   (Training set and Test set data)
xtrain <- read.table(paste(trainDataDir, "X_train.txt", sep=""))
xtest <- read.table(paste(testDataDir, "X_test.txt", sep=""))
xmerged <- rbind(xtrain, xtest)

# y_train.txt merge with y_test.txt   (Training labels and Test labels)
ytrain <- read.table(paste(trainDataDir, "y_train.txt", sep=""))
ytest <- read.table(paste(testDataDir, "y_test.txt", sep=""))
ymerged <- rbind(ytrain, ytest)

# subject_train.txt merge with subject_test.txt   (subjects who performed the activities)
subjecttrain <- read.table(paste(trainDataDir, "subject_train.txt", sep=""))
subjecttest <- read.table(paste(testDataDir, "subject_test.txt", sep=""))
subjectmerged <- rbind(subjecttrain, subjecttest)

# Secondly, extract only the measurements on the mean and standard deviation for each measurement
# The features.txt contains the list of all features (measurements).
# There should be 561 entries
features <- read.table(paste(dataBaseDir, "features.txt", sep=""), 
                       col.names=c("featureid", "featurename"))

# Get features with '-mean()' or '-std()' (standard deviation)
mean_std_features <- grep("-(mean|std)\\(\\)", features$featurename)

# get the subset of X merged data on mean and std features only, and set the columns names
xmerged <- xmerged[, mean_std_features]
names(xmerged) <- features[mean_std_features, 2]

# Thirdly, uses descriptive activity names to name the activities in the data set
# Get the list of activity labels first 
activityLabels <- read.table(paste(dataBaseDir, "activity_labels.txt", sep=""), 
                       col.names=c("activityid", "activity"))

# Fourthly, appropriately labels the data set with descriptive variable names
# label activity
names(ymerged) <- "activity"
# Replace the activity id with activity names in the Y merged data
ymerged[,1] <- activityLabels[ymerged[,1], 2]

# label subject
names(subjectmerged) <- "subject"

# Merge all data together into one large dataset
allmerged <- cbind(subjectmerged, ymerged, xmerged)

# Fifthly, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# Use the group_by to group by subject and activity
allmerged_groupby <- group_by(allmerged, subject, activity)
# Then apply the mean function to each variable
tidydataset <- summarise_each(allmerged_groupby, funs(mean))

# write the tidy data set to a file
write.table(tidydataset, "avg_data2.txt", row.name=FALSE)

# clean up the temporary data set and variables
rm(dataBaseDir, trainDataDir, testDataDir)
rm(xtrain, xtest, xmerged)
rm(ytrain, ytest, ymerged)
rm(subjecttrain, subjecttest, subjectmerged)
rm(features, mean_std_features)
rm(allmerged, allmerged_groupby)