library(dplyr)
library(reshape2)
library(stringr)
library(lubridate)

setwd("C:/Users/nip7672/Desktop/Coursera Data Sci/project")


zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

### Unzip Zip file###
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

### reading training data ###
train_Subject <- read.table(file.path(dataPath, "train", "subject_train.txt"))
colnames(train_Subject) <- c("subject")

train_Value <- read.table(file.path(dataPath, "train", "X_train.txt"))
train_Activity <- read.table(file.path(dataPath, "train", "y_train.txt"))
colnames(train_Activity) <- c("Activity")

### Exploring training sets###

train_Activity_Freq <- as.data.frame(table(train_Activity))
train_Subject_Freq <- as.data.frame(table(train_Subject))


### reading test data### 

test_Subject <- read.table(file.path(dataPath, "test", "subject_test.txt"))
colnames(test_Subject) <- c("subject")

test_Value <- read.table(file.path(dataPath, "test", "X_test.txt"))

test_Activity <- read.table(file.path(dataPath, "test", "y_test.txt"))
colnames(test_Activity) <- c("Activity")

###reading in features and activity labels##

features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
Activity_Label <- read.table(file.path(dataPath, "activity_labels.txt"))
Activity_Label <- Activity_Label %>%
  rename(Label = V1)%>%
  rename(Activity = V2)

###Step 1: merge training and test###

train <- cbind(train_Subject, train_Activity, train_Value)
test <- cbind(test_Subject, test_Activity, test_Value)
Full <- rbind(train, test)

###Assign colnames for features##
colnames(Full) <- c("subject", "Activity", features[, 2])

###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.###

Keep <- grepl("subject|Activity|mean|std", colnames(Full))

Full <- Full[, Keep]

###Step 3: Uses descriptive activity names to name the activities in the data set
Full$Activity <- ifelse(Full$Activity == '1', "WALKING", 
                        ifelse(Full$Activity =='2', "WALKING_UPSTAIRS", 
                               ifelse(Full$Activity == '3', "WALKING_DOWNSTAIRS", 
                                      ifelse(Full$Activity == '4', "SITTING", 
                                             ifelse(Full$Activity == '5', "STANDING", 
                                                    ifelse(Full$Activity == '6', "LAYING", "NONE"))))))
xx <- as.data.frame(table(Full$Activity))

### Step 4: Appropriately label the data set with descriptive variable names.###

Cols <- colnames(Full)
Cols <- gsub("^t", "time_domain", Cols)
Cols <- gsub("^f", "freq_domain", Cols)
Cols <- gsub("std", "StandardDev", Cols)
Cols <- gsub("Acc", "Accelerometer", Cols)
Cols <- gsub("Gyro", "Gyroscope", Cols)
Cols <- gsub("Mag", "Magnitude", Cols)
Cols <- gsub("Freq", "Frequency", Cols)

Cols <- gsub("[()-]", "", Cols)

colnames(Full) <- Cols

###Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.###
Full_Tidy <- Full%>%
  group_by(subject, Activity)

Full_Tidy <- Full_Tidy%>%
  summarise_all(funs(mean))

yy <- as.data.frame(table(Full_Tidy$subject, Full_Tidy$Activity))

write.csv(Full_Tidy, "Full_Tidy.csv", row.names = FALSE)
