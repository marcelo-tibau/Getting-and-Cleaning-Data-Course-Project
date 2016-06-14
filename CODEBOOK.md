#Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

    First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
    Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
    As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
    On the whole dataset, those columns with vague column names are corrected.
    Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

#Variables

    x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
    data_subject, data_labels and data_sets merges the previous datasets to further analysis.
    data_features contains the variables according to information concerning the features.txt, which are applied to the column names stored in features_mean_std.
    feature_means_std contains the code to measure the mean and standard deviation and add the variables "subject","activityNum".
    the data_sets had aggregated the variable means sorted by subject and activityName and was labeled with descriptive variable names. 
    Finally, tidy_data.txt contains relevant averages.

#Descriptive Variables Names

    
    "MEAN" for mean value
    "SD" for standard deviation
    "time" 
    "frequency" 
    "Accelerometer" for Acc 
    "Gyroscope" for Gyro 
    "Magnitude" for Mag
    "Body" for BodyBody
    

#Tidy Data

This part summarizes the resulting data fields in tidy_data.txt.

##Identifiers

    subject - The ID of the test subject
    activityName - The type of activity performed when the corresponding measurements were taken

##Measurements

    tBodyAccMeanX
    tBodyAccMeanY
    tBodyAccMeanZ
    tBodyAccStdX
    tBodyAccStdY
    tBodyAccStdZ
    tGravityAccMeanX
    tGravityAccMeanY
    tGravityAccMeanZ
    tGravityAccStdX
    tGravityAccStdY
    tGravityAccStdZ
    tBodyAccJerkMeanX
    tBodyAccJerkMeanY
    tBodyAccJerkMeanZ
    tBodyAccJerkStdX
    tBodyAccJerkStdY
    tBodyAccJerkStdZ
    tBodyGyroMeanX
    tBodyGyroMeanY
    tBodyGyroMeanZ
    tBodyGyroStdX
    tBodyGyroStdY
    tBodyGyroStdZ
    tBodyGyroJerkMeanX
    tBodyGyroJerkMeanY
    tBodyGyroJerkMeanZ
    tBodyGyroJerkStdX
    tBodyGyroJerkStdY
    tBodyGyroJerkStdZ
    tBodyAccMagMean
    tBodyAccMagStd
    tGravityAccMagMean
    tGravityAccMagStd
    tBodyAccJerkMagMean
    tBodyAccJerkMagStd
    tBodyGyroMagMean
    tBodyGyroMagStd
    tBodyGyroJerkMagMean
    tBodyGyroJerkMagStd
    fBodyAccMeanX
    fBodyAccMeanY
    fBodyAccMeanZ
    fBodyAccStdX
    fBodyAccStdY
    fBodyAccStdZ
    fBodyAccMeanFreqX
    fBodyAccMeanFreqY
    fBodyAccMeanFreqZ
    fBodyAccJerkMeanX
    fBodyAccJerkMeanY
    fBodyAccJerkMeanZ
    fBodyAccJerkStdX
    fBodyAccJerkStdY
    fBodyAccJerkStdZ
    fBodyAccJerkMeanFreqX
    fBodyAccJerkMeanFreqY
    fBodyAccJerkMeanFreqZ
    fBodyGyroMeanX
    fBodyGyroMeanY
    fBodyGyroMeanZ
    fBodyGyroStdX
    fBodyGyroStdY
    fBodyGyroStdZ
    fBodyGyroMeanFreqX
    fBodyGyroMeanFreqY
    fBodyGyroMeanFreqZ
    fBodyAccMagMean
    fBodyAccMagStd
    fBodyAccMagMeanFreq
    fBodyBodyAccJerkMagMean
    fBodyBodyAccJerkMagStd
    fBodyBodyAccJerkMagMeanFreq
    fBodyBodyGyroMagMean
    fBodyBodyGyroMagStd
    fBodyBodyGyroMagMeanFreq
    fBodyBodyGyroJerkMagMean
    fBodyBodyGyroJerkMagStd
    fBodyBodyGyroJerkMagMeanFreq

##Activity Labels

    WALKING (value 1): subject was walking during the test
    WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
    WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
    SITTING (value 4): subject was sitting during the test
    STANDING (value 5): subject was standing during the test
    LAYING (value 6): subject was laying down during the test

