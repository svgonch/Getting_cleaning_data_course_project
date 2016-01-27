library(plyr)
library(dplyr)
library(reshape2)
## Load datasets
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("D:/Research/")){dir.create("D:/Research/")}
setwd("D:/Research/")
download.file(URL, "dataset.zip", mode = "wb")
unzip("dataset.zip")
setwd("D:/Research/UCI HAR Dataset/")
## Reading data
test_dat <- read.table("./test/X_test.txt")
test_lab <- read.table("./test/y_test.txt")
test_sub <- read.table("./test/subject_test.txt")
train_dat <- read.table("./train/X_train.txt")
train_lab <- read.table("./train/y_train.txt")
train_sub <- read.table("./train/subject_train.txt")
## Binding rows of training and test datasets
dat <- rbind(test_dat, train_dat)
sub <- rbind(test_sub, train_sub)
lab <- rbind(test_lab, train_lab)
## Reading features and activity labels
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
act_lab <- read.table("activity_labels.txt")
act_lab[,2] <- as.character(act_lab[,2])
## Extracting mean and standard deviation from variables list
mean_std_in <- grep(".*mean\\(\\)|.*std\\(\\)", features[,2])
mean_std_names <- grep(".*mean\\(\\)|.*std\\(\\)", features[,2], value = TRUE)
mean_std_names <- gsub("[()]", "", mean_std_names)
## Extracting columns corresponding to extracted variables
dat <- dat[,mean_std_in]
## Binding mean and standard deviation columns with subjects and activities
dat_comb <- cbind(sub,lab,dat)
colnames(dat_comb) <- c("subject", "activity_labels", mean_std_names)
dat_comb$activity_labels <- factor(dat_comb$activity_labels, levels = act_lab[,1], labels = act_lab[,2])
## Reshaping data with the average of each variable for each activity and each subject
melted <- melt(dat_comb, id=c("subject", "activity_labels"))
tidy_data <- dcast(melted, subject + activity_labels ~ variable, mean)
## Writing data table to file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)