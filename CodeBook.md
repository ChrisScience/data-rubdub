---
title: "Class Project - Code Book"
author: "CJ Bury"
date: "February 18, 2015"
output: html_document
---
       
### data.all scheme:  
The data table contains the average and standard deviation of a series of observations of volunteers performing various physical activities.  Thirty (30) volunteers ("Subject") performed 6 different activities ("Activity").  The data are observations of measurements taken with a Samsung Galaxy S II smartphone that incorporates two sensors (linear acceleration and rotation).  

The underlying data source is:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A subset of the underlying data was processed to pull out the means and standard deviations.  As for the underlying data, this data set includes two categories of data:  time domain data that directly reflects the measurements taken, and frequency domain data that used FFT analysis to evaluate the cyclic nature of the measurements.

The acceleration and rotation variables use the following nomenclature: dMMMMSSSSPPPP-stat-D  

Parameter | Meaning
--------- | -------------------------------------------
d         | Domain ( t = time, f = frequency)
MMMM      | What is being measured (BODY or GRAVITY)
SSSS      | Sensor used (ACC = accelerometer, GYRO = gyroscope)
PPPP      | Additional parameter (Jerk, MAG)
-stat     | Statistical parameter (mean = mean() or standard deviation = std())
-D        | Directional vector (X, Y, Z)

### A description of each variable follows:

* [1] Activity: Description of the activity taking place as the measurement is taken.  Activity is CHARACTER.  The 6 activities are: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

* [2] Subject: Index identifies the subject (volunteer) that performed the activity.  Subject is INTEGER, 1 to 30.

All following data is NUMERIC.

### The first series is the mean of variables

#### Time domain data.

Resolved average accelerations of the subject.  The units are: normalized (-1 to +1) g (standard gravity).

* [3] tBodyAcc-mean()-X
* [4] tBodyAcc-mean()-Y
* [5] tBodyAcc-mean()-Z

Resolved average acceleration of gravity.  The units are: normalized (-1 to +1) g (standard gravity).

* [6] tGravityAcc-mean()-X 
* [7] tGravityAcc-mean()-Y 
* [8] tGravityAcc-mean()-Z 

The rate of change in the subject's average acceleration (Jerk = first 
derivative).  The units are: normalized (-1 to +1) delta g per second.  

* [9] tBodyAccJerk-mean()-X  
* [10] tBodyAccJerk-mean()-Y   
* [11] tBodyAccJerk-mean()-Z  



The average rate of rotation (angular velocity) of the subject resolved 
in X, Y, Z directions.  The units are: normalized (-1 to +1) radians per second.

* [12] tBodyGyro-mean()-X  
* [13] tBodyGyro-mean()-Y  
* [14] tBodyGyro-mean()-Z  

The rate of change in the subjects average rate of rotation (first derivative).  The units are: normalized (-1 to +1) radians per second^2^   

* [15] tBodyGyroJerk-mean()-X
* [16] tBodyGyroJerk-mean()-Y
* [17] tBodyGyroJerk-mean()-Z

The total magnitude of the average of the above variables (vector addition).  The units are: normalized (-1 to +1) g (standard gravity).

* [18] tBodyAccMag-mean()
* [19] tGravityAccMag-mean()
* [20] tBodyAccJerkMag-mean()
* [21] tBodyGyroMag-mean()
* [22] tBodyGyroJerkMag-mean() 

#### Frequency domain data.  



Resolved accelerations of the subject.  The units are: normalized (-1 to +1) g (standard gravity).  

* [23] fBodyAcc-mean()-X             
* [24] fBodyAcc-mean()-Y           
* [25] fBodyAcc-mean()-Z            

The rate of change in the subject's acceleration (Jerk = first derivative).  The units are: normalized (-1 to +1) delta g per second  

* [26] fBodyAccJerk-mean()-X         
* [27] fBodyAccJerk-mean()-Y       
* [28] fBodyAccJerk-mean()-Z        

The rate of rotation (angular velocity) of the subject resolved in X, Y, Z directions.  The units are: normalized (-1 to +1) radians per second.  

* [29] fBodyGyro-mean()-X            
* [30] fBodyGyro-mean()-Y          
* [31] fBodyGyro-mean()-Z           

The total magnitude of the above variables (vector addition).  

* [32] fBodyAccMag-mean()            
* [33] fBodyBodyAccJerkMag-mean()  
* [34] fBodyBodyGyroMag-mean()       
* [35] fBodyBodyGyroJerkMag-mean() 


### The second series is the standard deviations of the variables.

#### Time domain variables.

Resolved standard deviations of the accelerations of the subject.  The units are: normalized (-1 to +1) g (standard gravity).  

* [36] tBodyAcc-std()-X            
* [37] tBodyAcc-std()-Y              
* [38] tBodyAcc-std()-Z  

Resolved standard deviations of the acceleration of gravity.  The units are: normalized (-1 to +1) g (standard gravity).  

* [39] tGravityAcc-std()-X         
* [40] tGravityAcc-std()-Y           
* [41] tGravityAcc-std()-Z          

The standard deviation of the rate of change in the subject's acceleration 
(Jerk = first derivative).  The units are: normalized (-1 to +1) delta g per second.  

* [42] tBodyAccJerk-std()-X        
* [43] tBodyAccJerk-std()-Y          
* [44] tBodyAccJerk-std()-Z         

The standard deviation of the rate of rotation (angular velocity) of the 
subject resolved in X, Y, Z directions.  

* [45] tBodyGyro-std()-X           
* [46] tBodyGyro-std()-Y             
* [47] tBodyGyro-std()-Z            



The standard deviation of the rate of change in the subject's acceleration (Jerk = first derivative).  The units are: normalized (-1 to +1) delta g per second.  

* [48] tBodyGyroJerk-std()-X       
* [49] tBodyGyroJerk-std()-Y         
* [50] tBodyGyroJerk-std()-Z        

The total magnitude of the standard deviation of the above variables (vector addition).  The units are: normalized (-1 to +1) delta g per second.  

* [51] tBodyAccMag-std()           
* [52] tGravityAccMag-std()          
* [53] tBodyAccJerkMag-std()         
* [54] tBodyGyroMag-std()          
* [55] tBodyGyroJerkMag-std() 

#### Frequency domain data.

Resolved accelerations of the subject.  The units are: normalized (-1 to +1) g (standard gravity).  

* [56] fBodyAcc-std()-X              
* [57] fBodyAcc-std()-Y            
* [58] fBodyAcc-std()-Z             

The standard deviation of the rate of change in the subject's acceleration 
(Jerk = first derivative).  The units are: normalized (-1 to +1) delta g per second.

* [59] fBodyAccJerk-std()-X          
* [60] fBodyAccJerk-std()-Y        
* [61] fBodyAccJerk-std()-Z         

The standard deviation of the rate of rotation (angular velocity) of the subject.  The units are: normalized (-1 to +1) radians per second.  

* [62] fBodyGyro-std()-X             
* [63] fBodyGyro-std()-Y           
* [64] fBodyGyro-std()-Z           

The total magnitude of the above variables (vector addition).  

* [65] fBodyAccMag-std()             
* [66] fBodyBodyAccJerkMag-std()   
* [67] fBodyBodyGyroMag-std()        
* [68] fBodyBodyGyroJerkMag-std() 


