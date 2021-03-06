# 1.Merges the training and the test sets to create one data set.
# Read train data
train = read.csv("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

# Read test data
test = read.csv("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

# Merge training and test sets
data = rbind(train, test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# Read features data
features = read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

features <- features[grep(".*Mean.*|.*Std.*", features[,2]),]

data <- data[,c(grep(".*Mean.*|.*Std.*", features[,2]), 562, 563)]

# 3.Uses descriptive activity names to name the activities in the data set
# Read activity_labels data
activity_Labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

# 4.Appropriately labels the data set with descriptive variable names. 
# Add the columns
colnames(data) <- c(features$V2, "Activity", "Subject")
colnames(data) <- tolower(colnames(data))

count = 1
for (label in activity_Labels$V2) {
  data$activity <- gsub(count, label, data$activity)
  count <- count + 1
}

data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data = aggregate(data, by = list(activity = data$activity, subject = data$subject), mean)

# Remove the subject and activity column, since a mean of those has no use
data[,90] = NULL
data[,89] = NULL

# Write.table() using row.name=FALSE
write.table(data, "tidy_data_set.txt", sep="\t", row.names = FALSE)
