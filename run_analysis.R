## read feature names into a dataset called feature
feature_Names_File  <- "features.txt"
if (file.exists(feature_Names_File))  
  feature_Names <- read.table(feature_Names_File,  header = FALSE, sep="")

## Get Test Data *********************************************************************************##

## Point to location of the test file data formated for linux PC 
test_Subject_file_location  <- "./test/subject_test.txt"
test_xTest_file_location    <- "./test/X_test.txt"
test_yTest_file_location    <- "./test/y_test.txt"

## Check that the file locations exist then load the file informatio into Data frames 
## also add names of the cololums baised on the read values 

if (file.exists(test_Subject_file_location))  
  df_test_Subject <- read.table(test_Subject_file_location,  header = FALSE, sep="\t", col.names = "Subject")
if (file.exists(test_xTest_file_location))  
  df_X_Test <- read.table(test_xTest_file_location,  header = FALSE, sep="", col.names = feature_Names[[2]])
if (file.exists(test_yTest_file_location))  
  df_Y_Test <- read.table(test_yTest_file_location,  header = FALSE, sep="\t", col.names = "Activity")

## coloum combine Subject, xTest and yTest into one test data frame
combined_test_data <- cbind(df_test_Subject , df_Y_Test , df_X_Test )


## Get Train Data **********************************************************************************##

## Point to location of the test file data formated for linux PC 
train_Subject_file_location  <- "./train/subject_train.txt"
train_xtrain_file_location    <- "./train/X_train.txt"
train_ytrain_file_location    <- "./train/y_train.txt"

## Check that the file locations exist then load the file informatio into Data frames 
## also add names of the cololums baised on the read values 

if (file.exists(train_Subject_file_location))  
  df_train_Subject <- read.table(train_Subject_file_location,  header = FALSE, sep="\t", col.names = "Subject")
##****************************##
## partial ANSWER Question 4  ##
## loaded feature name when   ##
## data loaded                ##
##****************************##

if (file.exists(train_xtrain_file_location))  
  df_X_train <- read.table(train_xtrain_file_location,  header = FALSE, sep="", col.names = feature_Names[[2]])
if (file.exists(train_ytrain_file_location))  
  df_Y_train <- read.table(train_ytrain_file_location,  header = FALSE, sep="\t", col.names = "Activity")

## coloum combine Subject, xTest and yTest into one test data frame
combined_train_data <- cbind(df_train_Subject , df_Y_train , df_X_train )

##****************************##
## ANSWER Question 1          ##
##****************************##

All_data <- rbind(combined_test_data , combined_train_data )

##*********************************************************************************************************##

## extract names from coloums that contain std and mean
all_mean_col <- grep(c("*mean()"), names(All_data), ignore.case = TRUE)
all_std_col <- grep(c("*std()"), names(All_data), ignore.case = TRUE)

##****************************##
## ANSWER Question 2          ##
##****************************##

mean_std <- All_data[,c(1,2,all_std_col,all_mean_col)]

##*********************************************************************************************************##

## read descriptive activity from file 

## read feature names into a dataset called activity_labels 
activity_labels_File  <- "activity_labels.txt"
if (file.exists(activity_labels_File ))  
  activity_labels <- read.table(activity_labels_File ,  header = FALSE, sep="")

##****************************##
## ANSWER Question 3          ##
##****************************##

data_w_activity_label <- merge(activity_labels,mean_std, by.x="V1" , by.y="Activity" , all=TRUE)


##*********************************************************************************************************##

##****************************##
## ANSWER Question 4          ##
##****************************##

## Clean up names replace names of coloums with periods
## read all the current coloumn names into a varable

## rename the coloumn V2 to Activity.Label
names(data_w_activity_label) <- gsub("V2","Activity.Label",names(data_w_activity_label))

## rename the coloumn V1 to Activity.Label
names(data_w_activity_label) <- gsub("V1","Activity.code",names(data_w_activity_label))

## Step  replace all - ( ) , ..  with periods
names(data_w_activity_label) <- gsub("-|/(|/)|,| |\\.\\.\\.|\\.\\.",".",names(data_w_activity_label))

## Step  remove all trailing periods
names(data_w_activity_label) <- gsub("\\.$","",names(data_w_activity_label))

##*********************************************************************************************************##


##****************************##
## ANSWER Question 5          ##
##****************************##

##rm(list = ls())
##source("run_analysis.R")
library(dplyr)
by_activities_Subjet <- data_w_activity_label %>% group_by(Activity.Label,Subject)
finaldata <- summarize_each(by_activities_Subjet,funs(mean))
##write.table(finaldata,'tidyData.txt',row.name=FALSE)