
# Code Book — Human Activity Recognition Using Smartphones (Tidy Dataset)

## 1. Source Data
Original dataset: Human Activity Recognition Using Smartphones (Version 1.0)
Collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 2. Description
This dataset contains the average of mean and standard deviation measurements for each subject and each activity,
based on accelerometer and gyroscope data collected from a Samsung smartphone worn at the waist.

## 3. Transformations Performed
1. Downloaded and unzipped the raw dataset
2. Read train/test datasets and merged them
3. Extracted only mean() and std() measurements
4. Replaced activity IDs with descriptive names
5. Labeled columns with descriptive variable names:
   - t → Time
   - f → Frequency
   - Acc → Accelerometer
   - Gyro → Gyroscope
   - Mag → Magnitude
   - BodyBody → Body
6. Created an independent tidy dataset with the average of each variable for each activity and subject
7. Saved tidy dataset as tidyData.txt

## 4. Variables
### Identifiers
- subject: ID of the test subject (1–30)
- activityName: Descriptive name of the activity performed

### Activities
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

### Measurements
Each variable represents the mean of normalized measurements from accelerometer and gyroscope signals.
All measurements are dimensionless and bounded within [-1, 1].

Examples:
- TimeBodyAccelerometerMeanX: Mean time-domain body acceleration in X direction
- TimeBodyAccelerometerSTDY: Standard deviation of body acceleration in Y direction
- FrequencyBodyGyroscopeMeanZ: Mean frequency-domain gyroscope signal in Z direction

## 5. Summary Variables
Each record in tidyData.txt represents the average of each measurement for one subject and one activity.
Dimensions: 180 rows × 68 columns

## 6. Output Files
- tidyData.txt: Tidy dataset with averaged variables
- CodeBook.md: This file, generated automatically


