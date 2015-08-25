### Getting and Cleaning Data ###

##### This project is about downloading, cleaning and summarizing wearables data from 30 subjects for 6 different activities. #####

Data was downloaded from [Wearables Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Data contains training and test data for 21 and 9 subjects respectively. Input Data contains 3 files - Subjects (1 column), Activity (1 col) and Processed Data (561 variables).

### Variables ###
 -subject
 -activity
 -tBodyAcc-mean()-X
 -tBodyAcc-mean()-Y
 -tBodyAcc-mean()-Z
 -tBodyAcc-std()-X
 -tBodyAcc-std()-Y
 -tBodyAcc-std()-Z
 -tGravityAcc-mean()-X
 -tGravityAcc-mean()-Y
 -tGravityAcc-mean()-Z
 -tGravityAcc-std()-X
 -tGravityAcc-std()-Y
 -tGravityAcc-std()-Z
 -tBodyAccJerk-mean()-X
 -tBodyAccJerk-mean()-Y
 -tBodyAccJerk-mean()-Z
 -tBodyAccJerk-std()-X
 -tBodyAccJerk-std()-Y
 -tBodyAccJerk-std()-Z
 -tBodyGyro-mean()-X
 -tBodyGyro-mean()-Y
 -tBodyGyro-mean()-Z
 -tBodyGyro-std()-X
 -tBodyGyro-std()-Y
 -tBodyGyro-std()-Z
 -tBodyGyroJerk-mean()-X
 -tBodyGyroJerk-mean()-Y
 -tBodyGyroJerk-mean()-Z
 -tBodyGyroJerk-std()-X
 -tBodyGyroJerk-std()-Y
 -tBodyGyroJerk-std()-Z
 -tBodyAccMag-mean()
 -tBodyAccMag-std()
 -tGravityAccMag-mean()
 -tGravityAccMag-std()
 -tBodyAccJerkMag-mean()
 -tBodyAccJerkMag-std()
 -tBodyGyroMag-mean()
 -tBodyGyroMag-std()
 -tBodyGyroJerkMag-mean()
 -tBodyGyroJerkMag-std()
 -fBodyAcc-mean()-X
 -fBodyAcc-mean()-Y
 -fBodyAcc-mean()-Z
 -fBodyAcc-std()-X
 -fBodyAcc-std()-Y
 -fBodyAcc-std()-Z
 -fBodyAcc-meanFreq()-X
 -fBodyAcc-meanFreq()-Y
 -fBodyAcc-meanFreq()-Z
 -fBodyAccJerk-mean()-X
 -fBodyAccJerk-mean()-Y
 -fBodyAccJerk-mean()-Z
 -fBodyAccJerk-std()-X
 -fBodyAccJerk-std()-Y
 -fBodyAccJerk-std()-Z
 -fBodyAccJerk-meanFreq()-X
 -fBodyAccJerk-meanFreq()-Y
 -fBodyAccJerk-meanFreq()-Z
 -fBodyGyro-mean()-X
 -fBodyGyro-mean()-Y
 -fBodyGyro-mean()-Z
 -fBodyGyro-std()-X
 -fBodyGyro-std()-Y
 -fBodyGyro-std()-Z
 -fBodyGyro-meanFreq()-X
 -fBodyGyro-meanFreq()-Y
 -fBodyGyro-meanFreq()-Z
 -fBodyAccMag-mean()
 -fBodyAccMag-std()
 -fBodyAccMag-meanFreq()
 -fBodyBodyAccJerkMag-mean()
 -fBodyBodyAccJerkMag-std()
 -fBodyBodyAccJerkMag-meanFreq()
 -fBodyBodyGyroMag-mean()
 -fBodyBodyGyroMag-std()
 -fBodyBodyGyroMag-meanFreq()
 -fBodyBodyGyroJerkMag-mean()
 -fBodyBodyGyroJerkMag-std()
 -fBodyBodyGyroJerkMag-meanFreq()


##### Following processing was done to the data to clean it. #####

Step 1: Read the three data files for both training and test datasets

Step 2: Merge the 3 data files for Training Data to make one big data frame containing 563 columns for 21 subjects - Training Data

Step 3: Merge the 3 data files for Test Data to make one big data frame cont
aining 563 columns for 9 subjects - Test Data

Step 4: Merge the two big data frames for Test and Training Data to create another bigger data frame for all data for 30 subjects containing 563 variables with Subject and Activity being columns 1 and 2 and rest of the 561 variables - All Data

Step 5: Read the features names into a data frame containing 561 rows - All Feature Names

Step 6: Extract the column numbers from the features names data frame that are for mean or standard deviation - Mean and Std Column numbers

Step 7: Shift the extracted column numbers in Step 6 by 2, to account for the fact that first 2 columns in our combined training and test data is for Subject and Activity - Column numbers mapped to All Data

Step 8: Extract the columns from All Data for columns 1, 2 and all of the mean and std data columns - Extracted Mean and Std data

Step 9: Set the column names for the Extracted Mean and Std data with Subject, Activity, other column names for Mean and Std data

Step 10: Read the activity names from the Acvity_labels.txt file into a data frame

Step 11: Replace the Activity # in the Extracted Mean and Std data frame by matching the Activity # between the two data frames and replacing it with activity name

Step 12: Group all the data by Subject and then Activity

Step 13: Summarize the data in the data frame using summarize_each and applying mean function 

Step 14: Write the Summarized data to a file on the disk using write.table command 
