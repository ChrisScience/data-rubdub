## Setting up the framework for the class project
## Merge the training and test data
##    This requires merging three files between the two directories
##    (total of six files merged to three)
##          1. Measurements - the X_"directory".txt files
##          2. Subjects - the subject_"directory".txt files
##          3. Acitivites - the y_"directory".txt files
##
##
## Read in the needed libraries
library(data.table)
library(dplyr)
## Read in the data into dataframes using data.table
data.test <- data.table(read.table("X_test.txt", stringsAsFactors = FALSE))
data.train <- data.table(read.table("X_train.txt", stringsAsFactors = FALSE))
subj.test <- data.table(read.table("subject_test.txt", stringsAsFactors = FALSE))
subj.train <- data.table(read.table("subject_train.txt", stringsAsFactors = FALSE))
act.test <- data.table(read.table("y_test.txt", stringsAsFactors = FALSE))
act.train <- data.table(read.table("y_train.txt", stringsAsFactors = FALSE))
##
## Merge the train and test data into a single dataframe for each of the data type
data.all <- rbind(data.train, data.test)
subj.all <- rbind(subj.train, subj.test)
act.all <- rbind(act.train, act.test)
##
## Do not want the last column
#data.all <- select(data.all, 1:561)
#subj.all <- subj.all$V1
## Assign new column names using the features.txt list of variable names.
## The names are in the second column
var.names <- data.table(read.table("features.txt", stringsAsFactors = FALSE))
var.names <- var.names$V2
setnames(data.all, var.names)
##
## Reduce the variables (columns) to only those having to do with the mean or standard
## deviation.  Use the dplyr "select" function combined with the "contains" argument
data.mean <- select(data.all, contains("mean()"))
data.std <- select(data.all, contains("std()"))
##
## Use cbind to combine to one dataframe.  Reuse the data.all name to save space.
data.all <- cbind(data.mean, data.std)
##
## Add the volunteers index number. The volunteers index is in the subj.all vector.
data.all <- cbind(subj.all, data.all)
##
## Again, add the descriptive column name
data.all <- rename(data.all, Subject = V1)
##
## Now add the descriptive activity name to the act.all file.  The file uses numeric
## numeric indexes.  The descriptive names are in the activity_labels.txt file.  Again,
## the names are in the second column
act.names <- data.table(read.table("activity_labels.txt", stringsAsFactors = FALSE))
act.names <- act.names$V2
##
## Use the "replace" function to substitue the activity name for the index
for (i in seq_along(act.names)){
      act.all <- replace(act.all, act.all == i, act.names[i])
}
##
## Add the act.names vector to the front of the dataframe
data.all <- cbind(act.all, data.all)
##
## Add new descriptive column name
data.all <- rename(data.all, Activity = V1)
##
##
## Give some structure to the rows, sort the data by Subject and then by Activity
data.all <- arrange(data.all, Activity, Subject)

##
## Summarizing the data to group the averages for each subject performing each
## activity.  Using the character vector containing the names of the activities
## setup a function to sequentually filter out the data for each activity.  The
## activity subset then uses "lapply" to group the means for each subject 
## participating.  The activity name is then added back into the dataframe.
## Row binding is used to build the whole dataframe as each activity is
## sequentually evaluated.
for (i in seq_along(act.names)) {
      data.filter <- filter(data.all, Activity == act.names[i])
      data.filter$Activity <- NULL
      data.activity <- data.filter[, lapply(.SD, mean), by = Subject]
      data.activity <- arrange(data.activity, Subject)
      data.activity <- mutate(data.activity, Activity = act.names[i])
      ifelse ((i == 1), data.summary <- data.activity, 
              data.summary <- rbind(data.summary, data.activity))
}
##
## After the dataframe is assembled, the column with the activity 
## name (Activity) added above with the "mutate" is moved from the end of 
## of the dataframe to the first column position.
data.summary <- cbind(select(data.summary, Activity), 
                      select(data.summary, -Activity))
##
## Write the data.summary fill out to the working directory.
write.table(data.summary, file = "data_summary.csv", sep = ",", row.name = FALSE)