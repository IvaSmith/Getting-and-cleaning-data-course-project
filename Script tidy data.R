if(!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./data/UCI_HAR_Dataset.zip"

download.file(fileUrl, destfile = destfile, method = "curl")

unzip(destfile, exdir = "./data")
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
X_test  <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
y_test  <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

X_all <- rbind(X_train, X_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
colnames(X_all) <- features$feature
colnames(y_all) <- "activity"
colnames(subject_all) <- "subject"

mergedData <- cbind(subject_all, y_all, X_all)

mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature)

# Subset the merged dataset
selectedData <- mergedData[, c(1, 2, mean_std_features + 2)]  # +2 shifts because of subject & activity columns

activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                             col.names = c("activity", "activityName"))

mergedData <- merge(selectedData, activityLabels, by = "activity")

mergedData <- mergedData[, c("subject", "activityName", setdiff(names(mergedData), c("subject", "activityName")))]

names(mergedData) <- gsub("^t", "Time", names(mergedData))
names(mergedData) <- gsub("^f", "Frequency", names(mergedData))
names(mergedData) <- gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData) <- gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData) <- gsub("Mag", "Magnitude", names(mergedData))
names(mergedData) <- gsub("BodyBody", "Body", names(mergedData))
names(mergedData) <- gsub("-mean\\(\\)", "Mean", names(mergedData))
names(mergedData) <- gsub("-std\\(\\)", "STD", names(mergedData))
names(mergedData) <- gsub("-", "", names(mergedData))

library(dplyr)

tidyData <- mergedData %>%
  group_by(subject, activityName) %>%
  summarise_all(mean)

write.table(tidyData, "tidyData.txt", row.name = FALSE)

head(tidyData)
dim(tidyData)