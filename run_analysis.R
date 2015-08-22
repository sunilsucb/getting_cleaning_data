run_analysis <- function(directory="Course3/CourseProject/Data/UCI HAR Dataset") {

  # Set WD to the folder containing the UCI HAR Dataset
  setwd(directory)
  
  # Read training dataset
  train_data <- read.table("train/X_train.txt",as.is=T)
    
  # Read Train Subjects
  train_subjects <- read.table("train/subject_train.txt",as.is=T)
    
  # Read Train Activities
  train_activities <- read.table("train/y_train.txt",as.is=T)
  
  # Merge Training Data
  train <- data.frame(train_subjects,train_activities,train_data)
  
  # Read training dataset
  test_data <- read.table("test/X_test.txt",as.is=T)
  
  # Read Train Subjects
  test_subjects <- read.table("test/subject_test.txt",as.is=T)
  
  # Read Train Activities
  test_activities <- read.table("test/y_test.txt",as.is=T)
  
  # Merge Test Data
  test <- data.frame(test_subjects,test_activities,test_data)
  
  # Merge Test and Train Datasets
  all.data <- rbind(test,train)
  
  # Read the features
  features <- read.table("features.txt",as.is=T)
  
  # Select rows that contain mean or std
  mean_cols <- grep("mean",features[,2])
  std_cols <- grep("std",features[,2])
  mean_std_cols_num <- sort(c(mean_cols,std_cols))
  
  # Move all the col numbers fr mean, std columns by 2 since we have 2 columns at the beginnijng for subjects and activity
  mean_std_cols_num_2 <- mean_std_cols_num + 2
  
  # Extract columns from all.data that have column number in mean_std_cols
  all_mean_std.data <- all.data[,c(1,2,mean_std_cols_num_2)]
  
  # Get Column names from features and apply to the all_mean_std.data
  feature_names <- features$V2
  mean_std_column_names <- c("subject","activity",feature_names[mean_std_cols_num_2-2])
  
  # Replace col names to the all.dataset with only mean and std cols
  colnames(all_mean_std.data) <- mean_std_column_names
  
  # Replace Activity numbers with Activity names in all_mean_std.data
  activity_names <- read.table("activity_labels.txt",as.is=T)
  all_mean_std.data$activity <- activity_names[,2][match(all_mean_std.data$activity,activity_names[,1])]
  
  # Group data by subject and activity
  all_mean_std.data <- group_by(all_mean_std.data,subject,activity)
  
  # Summarize the data - get the means for each activity and group by subject
  new_summarized_data <- summarise_each((all_mean_std.data),funs(mean))
  
  # Save summarized data into a table
  write.table(new_summarized_data,"tidy_dataset.txt",row.names=FALSE)
}