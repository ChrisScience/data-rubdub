---
title: "README"
author: "ChrisScience"
date: "February 22, 2015"
output: html_document
---


### The script **run_analysis.R** assumes all the necessary files are in your working directory.  This includes:
* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt
* subject_train.txt
* subject_test.txt
* features.txt
* activity_labels.txt


### Program description

Setting up the framework for the class project by merging the training and test data. This requires merging three files from each of the train and test groups (total of six files merged to three)

1. Measurements - the X_train/test.txt files
2. Subjects - the subject_train/test.txt files
3. Acitivites - the y_train/test.txt files

The data are read into dataframes using *read.table*.  The train and test data from the measured data, the subject data and the activity data are then merged into a single dataframe (data.all, subj.all, act.all) for each of the data type using rbind.  

Descriptine column names are read in using the *features.txt* list of variable names. The *feature.txt* data is read in using read.table, the names are in the second column.

The variables (columns) of **data.all** are reduced to only those having to do with the mean or standard  deviation.  Use the dplyr "select" function combined with the "contains" argument
```
data.mean <- select(data.all, contains("mean()"))
data.std <- select(data.all, contains("std()"))
```

Use cbind to combine mean columns and standard deviation columns into one dataframe.  Reuse the **data.all** name. 

Add the subjects/volunteers index number. The subjects/volunteers index is in the subj.all vector.  Use cbind to add to the front of the **data.all** dataframe.  Then add a descriptive column name "Subject" to the newly created column.

Add the descriptive activity name to the act.all file.  The file uses numeric indexes.  The descriptive names are in the *activity_labels.txt* file.  Again, the names are in the second column

The "replace" function used to substitue the activity name for the activity index.
```
for (i in seq_along(act.names)){
      act.all <- replace(act.all, act.all == i, act.names[i])
}
```

Add the act.names vector to the front of the **data.all** dataframe.  Again, add new descriptive column name ("Activity").

To give some structure to the rows, sort **data.all** by Subject and then by Activity

Summarizing the data to group the averages for each subject performing each activity. Using the character vector containing the names of the activities setup a function to sequentually filter out the data for each activity.  The activity subset then uses "lapply" to group the means for each subject participating.  The activity name is then added back into the dataframe.  Row binding is used to build the whole dataframe as each activity is sequentually evaluated.
```
for (i in seq_along(act.names)) {
      data.filter <- filter(data.all, Activity == act.names[i])
      data.filter$Activity <- NULL
      data.activity <- data.filter[, lapply(.SD, mean), by = Subject]
      data.activity <- arrange(data.activity, Subject)
      data.activity <- mutate(data.activity, Activity = act.names[i])
      ifelse ((i == 1), data.summary <- data.activity, 
              data.summary <- rbind(data.summary, data.activity))
}
```

After the dataframe is assembled, the column with the activity name (Activity) added to the above with "mutate" and is moved from the end of of the dataframe to the first column position.
```
data.summary <- cbind(select(data.summary, Activity), 
                      select(data.summary, -Activity))
```
                      
Finally, write the data.summary file out to the working directory.
