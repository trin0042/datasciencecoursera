---
title: "README"
author: "Chris Trinh"
date: "Saturday, January 24, 2015"
output: html_document
---

This code follows the logical order that is given in the assignment:

 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This program checks to see if the zip file already exists in the directory and downloads it if is not available. 

It loads in the features from the features.txt file.

To clean the data up, grep and gsub are used to remove the parenthesis from the mean() and std() values.

The program then reads in activity labels and adds in friendly names.

We then combine all of the data tables (x, y, and subject) to take an aggregate.  This aggregate then gives us the averages by Subject and Activity.  We then export out the results to a TXT file.
