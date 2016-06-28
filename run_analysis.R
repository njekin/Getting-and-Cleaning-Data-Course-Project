#run_analysis.R  
#code by Jun Wang   njekin@gmail.com
#place the file in the same direcotry of the test and train data set folders.
library(dplyr)
library(tidyr)
rm(list=ls())

#readin files
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

y_test <- read.table("./test/y_test.txt")
x_test <- read.table("./test/x_test.txt")
subject_test <- read.table("./test/subject_test.txt")

y_train <- read.table("./train/y_train.txt")
x_train <- read.table("./train/x_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#adding col names to both test and train datasets
names(x_test) <- features[,2]
names(x_train) <- features[,2]

#add activity and subject labels for test dataset. 
y_test_label <- merge(y_test, activity_labels, by="V1")
y_test_label <- bind_cols(subject_test, y_test_label)
names(y_test_label) <- c("subject","activity_code", "activity")
test_labeled <- bind_cols(y_test_label, x_test)

#add activity and subject labels for training dataset. 
y_train_label <- merge(y_train, activity_labels, by="V1")
y_train_label <- bind_cols(subject_train, y_train_label)
names(y_train_label) <- c("subject","activity_code", "activity")
train_labeled <- bind_cols(y_train_label, x_train)

#at this point, "test_labeled" and "train_labeled" are the fully labeled datasets.
#following operations will be based on these two dataframe.

#test how many unique features, this shows there are duplicates!
#length(unique(features[,2]))

#merge test and trainig data set. the resulted dataframe has less features due to duplicates.
combined <- bind_rows(test_labeled, train_labeled) 

#get columns with mean and std of each measurement.
sel_mean <- select(combined, contains("mean()"))
sel_std <- select(combined, contains("std()"))
mean_std <- bind_cols(sel_mean, sel_std)
ordered_mean_std <- mean_std[, order(colnames(mean_std))]
#final labeled dataset
final_df <- bind_cols(combined[,c(1,3)], ordered_mean_std)
#write.csv(final_df, "final_df.csv")
#generate tidy dataset with average of each variable for each activity and each subject. 
tidy_set <- final_df %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.csv(tidy_set,"tidy_set.csv")
