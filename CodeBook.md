Codebook for the UCI HAR Dataset

Full description from the source of the data here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Brief overview

These data are measurements recorded by smartphones during movement from the following activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Please see the readme.txt file in the zip for more details of the raw data set.

## Tidy data set
The tidy data set is a reshaped table containing the averages of the mean and standard deviation features for each subject and activity. There are 180 observations (30 subjects performing 6 activities) and 66 feature columns. For example: the tidy data set allows us to look at average tBodyAcc-X recorded during subject N's sitting activity.

Each measurement is a mean of the mean or standard deviation of the following measurements (3 for every XYZ variable):
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


NOTE: meanFreqs are exluded from the tidy data set as the requirments of the project state the mean of each mean measurement. I interpret a frequency mean as separate from the actual recorded data from the sensors.
