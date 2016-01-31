The following process was followed to produce the tidydata for the cousera Getting and clearing data class: 

1 Check to make sure that the data was in the folder. If not download the data to the "UCI HAR Dataset" sub directory.

2 Load the feature_Names table with the contents of "UCI HAR Dataset/features.txt"


3 Load the test_Subject_file_location table with the contents of "UCI HAR Dataset/test/subject_test.txt" - Pulling out the coloums with the heading "Subject"

4 Load the test_xTest_file_location table with the contents of "UCI HAR Dataset/test/X_test.txt" - Pulling out the coloums with the headings from the second coloum of the  feature_Names table

5 Load the test_yTest_file_location table with the contents of "UCI HAR Dataset/test/y_test.txt" - Pulling out the coloums with the heading "Activity"

6 combine the df_test_Subject , df_Y_Test , df_X_Test tables into one table called combined_test_data combine by coloums 

7 Load the train_Subject_file_location table with the contents of "UCI HAR Dataset/train/subject_test.txt" - Pulling out the coloums with the heading "Subject"

8 Load the train_xtrain_file_location table with the contents of "UCI HAR Dataset/train/X_test.txt" - Pulling out the coloums with the headings from the second coloum of the  feature_Names table

9 Load the train_ytrain_file_location table with the contents of "UCI HAR Dataset/train/y_test.txt" - Pulling out the coloums with the heading "Activity"

10 combine the df_train_Subject , df_Y_train , df_X_train tables into one table called combined_train_data combine by coloums 


11 Combine by row the combined_test_data , combined_train_data  tables to a table called All_data

12 create a table from All_data called all_mean_col that only contains the words "mean()" in the column names called all_mean_col

13 create a table from All_data called all_mean_col that only contains the words "std()" in the column names called all_std_col

14 combine the tables all_mean_col  and all_std_col to a table called mean_std 

15 Load the activity_labels_File table with the contents of "UCI HAR Dataset/activity_labels.txt" - use this to change test code to descriptive activity

16 Merge the  activity_labels_File with the activity_labels into a new table called data_w_activity_label

17 Clean up the coloum names removing the special characters V2 V1 - ( ) , ... .. 

18 Summarize the data by Activity.Label and Subject giveing the result as the mean of mutiple values place this into a table called finaldata

19 Export the finaldata table to a file called 'tidyData.txt'


