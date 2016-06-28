# Getting-and-Cleaning-Data-Course-Project
project answer for Coursera course. 
author: "Jun Wang"  njekin@gmail.com
date: "Tuesday, June 28, 2016"

---
This document describes how the code file analysis.R works with the UCI HAR datset.

Analysis.R code imports and combine all the training and test data sets, properly labels the subject and activity, and descriptive name for each measured signals. The mean() and std() value for each variable were extracted, then the average value for the extracted value for each subject on each activity were calculated and exported as the final tidy dataset. 


To run the analysis.R code, place it inside the UCI Har Dataset folder (the place where the /test and /train folders are located).The code will generate the tidy data set as a "tidy_set.csv" file in the same working directory. 
