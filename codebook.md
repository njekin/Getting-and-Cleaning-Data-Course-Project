#Codebook for the UCI HAR dataset (coursera getting and clearning data course project)
#codebook created by Jun Wang    njekin@gmail.com

The generated tidy_set.csv file is the tidy dataset after cleaning and transforming. The numeric value of each variable represents the mean value of measured signal for each subject on each activity. 

The subject variable (total of 30) represents the 30 person joined the Human Activity Recognition research program (www.smartlab.ws). The activity variable represents the 6 activities that were studied.

A total of 66 variables (signals) recorded in the experiment are included in the data set. 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
