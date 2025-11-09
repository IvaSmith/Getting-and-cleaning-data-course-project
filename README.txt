
GETTING AND CLEANING DATA - COURSE PROJECT
==========================================

OVERVIEW
--------
This project demonstrates how to collect, clean, and prepare data for analysis in R.
It uses the Human Activity Recognition Using Smartphones dataset, which includes
accelerometer and gyroscope signals from smartphones worn by 30 participants performing
six activities.

The goal is to produce one tidy dataset that contains the average of each variable
for each activity and each subject.

FILES IN THIS REPOSITORY
------------------------
run_analysis.R     - The R script that performs all steps of the analysis.
tidyData.txt       - The resulting tidy dataset.
CodeBook.md        - Describes variables, transformations, and summary calculations.
README.txt         - This document explaining the workflow and outputs.

ANALYSIS STEPS
--------------
1. Download and unzip the dataset into a 'data/' folder.
2. Load the training and test datasets (X, y, and subject files).
3. Merge the training and test sets into one dataset.
4. Extract only the measurements on the mean and standard deviation.
5. Replace numeric activity codes with descriptive activity names.
6. Rename variables for clarity:
   - t → Time
   - f → Frequency
   - Acc → Accelerometer
   - Gyro → Gyroscope
   - Mag → Magnitude
   - mean() → Mean
   - std() → STD
7. Create a tidy dataset with the average of each variable for each activity and subject.
8. Write the final tidy dataset to tidyData.txt.

HOW TO REPRODUCE
----------------
1. Set your working directory to the project folder.
2. Run the following command in R:
   source('run_analysis.R')
3. The script will process the data and produce the tidyData.txt file.

DEPENDENCIES
------------
R version 4.0 or later
Required packages: dplyr, utils, curl

AUTHOR
-------
This work was completed as part of the Getting and Cleaning Data Coursera course project.

