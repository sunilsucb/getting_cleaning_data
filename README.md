# getting_cleaning_data

R Script: run_analysis.R

##### Execution: #####
Parameters: Directory where the UCI HAR Dataset is placed 
Default value for the directory is: Course3/CourseProject/Data/UCI HAR Dataset

This script navigates to the director specified above and loads the data in the /train and /test folders. 
It then merges it, extarcts certain columns, applies column names, replaces row values for activities.

The script then summarizes the data (mean) and groups it by subjest and activity and finally saves it to the disk.
