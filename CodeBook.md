# Code Book
A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

## Data Source
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data
The data is read from the following files,
- UCI HAR Dataset\test\subject_test.txt
- UCI HAR Dataset\test\X_test.txt
- UCI HAR Dataset\test\y_test.txt
- UCI HAR Dataset\train\subject_train.txt 
- UCI HAR Dataset\train\X_train.txt 
- UCI HAR Dataset\train\Y_train.txt 
- UCI HAR Dataset\activity_labels.txt
- UCI HAR Dataset\features.txt

## Code Variables in run_analysis.R
- test: Stores test data from subject_test.txt, X_test.txt and y_test.txt
- train: Stores training data from subject_train.txt, X_train.txt and Y_train.txt 
- activity_Labels: Stores activity labels from activity_labels.txt
- features: Store features data from features.txt
- data: Stores final output data

## Transformations in run_analysis.R
- Read train data
- Read test data
- Merge training and test sets to variable data
- Read features data
- Read activity_labels data
- Add the columns to variable data (Appropriately labels the data set with descriptive variable names)
- Write.table() using row.name=FALSE
