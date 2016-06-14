files_path <- ".data/UCI HAR Dataset"

# to read the subject files
data_subject_Train <- tbl_df(read.table(file.path(files_path, "train", "subject_train.txt")))
data_subject_Test  <- tbl_df(read.table(file.path(files_path, "test" , "subject_test.txt" )))

# to read the labels files
data_labels_Train <- tbl_df(read.table(file.path(files_path, "train", "Y_train.txt")))
data_labels_Test  <- tbl_df(read.table(file.path(files_path, "test" , "Y_test.txt" )))

# to read the sets files
data_sets_Train <- tbl_df(read.table(file.path(files_path, "train", "X_train.txt" )))
data_sets_Test  <- tbl_df(read.table(file.path(files_path, "test" , "X_test.txt" )))

## STEP 1.Merges the training and the test sets to create one data set

# this code merges the training and the test sets for labels and subject files by row binding and renames the variables to "subject" and "activityNum"
data_subject <- rbind(data_subject_Train, data_subject_Test)
setnames(data_subject, "V1", "subject")
data_labels <- rbind(data_labels_Train, data_labels_Test)
setnames(data_labels, "V1", "activityNum")

# this code combines the sets of training and test files
data_sets <- rbind(data_sets_Train, data_sets_Test)

# this code renames the variables according to information concerning the features.txt 
data_features <- tbl_df(read.table(file.path(files_path, "features.txt")))
setnames(data_features, names(data_features), c("featureNum", "featureName"))
colnames(data_sets) <- data_features$featureName

# this code sets the column names for activity labels
activity_labels<- tbl_df(read.table(file.path(files_path, "activity_labels.txt")))
setnames(activity_labels, names(activity_labels), c("activityNum","activityName"))

# this code merges the columns of the subject and labels datas
data_subject_label <- cbind(data_subject, data_labels)
data_sets <- cbind(data_subject_label, data_sets)

## STEP 2.Extracts only the measurements on the mean and standard deviation for each measurement

# code to read the file "features.txt" and extract only the mean and standard deviation
features_mean_std <- grep("mean\\(\\)|std\\(\\)",data_features$featureName,value=TRUE)

# code to measure the mean and standard deviation and add the variables "subject","activityNum"

features_mean_std <- union(c("subject","activityNum"), features_mean_std)
data_sets <- subset(data_sets, select = features_mean_std) 

## STEP 3.Uses descriptive activity names to name the activities in the data set

# code to merge the activityName into data_sets
data_sets <- merge(activity_labels, data_sets , by="activityNum", all.x=TRUE)
data_sets$activityName <- as.character(data_sets$activityName)

# code to aggregate the variable means sorted by subject and activityName into data_sets
data_sets$activityName <- as.character(data_sets$activityName)
dataAggr <- aggregate(. ~ subject - activityName, data = data_sets, mean) 
data_sets <- tbl_df(arrange(dataAggr,subject,activityName))

## STEP 4.Appropriately labels the data set with descriptive variable names

names(data_sets) <- gsub("std()", "SD", names(data_sets))
names(data_sets) <- gsub("mean()", "MEAN", names(data_sets))
names(data_sets) <- gsub("^t", "time", names(data_sets))
names(data_sets) <- gsub("^f", "frequency", names(data_sets))
names(data_sets) <- gsub("Acc", "Accelerometer", names(data_sets))
names(data_sets) <- gsub("Gyro", "Gyroscope", names(data_sets))
names(data_sets) <- gsub("Mag", "Magnitude", names(data_sets))
names(data_sets) <- gsub("BodyBody", "Body", names(data_sets))

## STEP 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

write.table(data_sets, "tidy_data.txt", row.name=FALSE)
