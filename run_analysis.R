#File URL to download
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

#Directory
dirFile <- "./UCI HAR Dataset"

#Directory and filename (txt or csv) of the clean/tidy data:
tidyDataFile <- "./Tidy_Data_Set.txt"
tidyDataFileAVGtxt <- "./AVE_Tidy_Data_Set.txt"

if(!file.exists(dirFile)) {
  temp <- tempfile()
  download.file(fileURL,temp)
  unzip(temp)
  unlink(temp)
}

#1. Merges the training and the test sets to create one data set.

#load the data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#combine the data
x <- rbind(x_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#load features
features <- read.table("./UCI HAR Dataset/features.txt")

#name the features
names(features) <- c('feat_id', 'feat_name')

#search for mean and std in data set
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
x <- x[,index_features] 

#Search and delete parenthesis
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

#3. Uses descriptive activity names to name the activities in the data set:
#4. Appropriately labels the data set with descriptive activity names:

#Read activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Add friendly names to activities column
names(activities) <- c('act_id', 'act_name')
y[, 1] = activities[y[, 1], 2]

names(y) <- "Activity"
names(subject) <- "Subject"

#Combines data table by columns
tidyDataSet <- cbind(subject, y, x)

#5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
p <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataAVGSet <- aggregate(p,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)

#Activity and Subject name of columns 
names(tidyDataAVGSet)[1] <- "Subject"
names(tidyDataAVGSet)[2] <- "Activity"

#Create tidy data set as csv
write.table(tidyDataAVGSet, tidyDataFileAVGtxt,row.names=FALSE)