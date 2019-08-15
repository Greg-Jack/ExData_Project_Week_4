Variables in Tidy Data Set 
=================

Subject-ID: numeric value identifying the volunteer for the observation
Activity: either WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING, and LAYING



The features selected for this database for each Subject-ID and Activity come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

mean(): Mean value for each Subject-ID and Activity
std(): Standard deviation for each Subject-ID and Activity

Data in Tidy Data Set 
=================

For each Subject-ID and Activity, the mean and standard deviation of the variables of the feature vector are contained within the tidy data set from the UCI HAR Data Set


Transformations
=================
5 steps of transformations was done to create the tidy data set (and these transformations are done in the run_analysis.R file)

1. Merges the training and the test sets from the UCI HAR Data set to create one data set through cbind and rbind function calls.
2. Extracts only the measurements on the mean and standard deviation for each measurement using the grepl function to extract columns from the data set that contain mean() or std() in the variable name
3. Uses descriptive activity names to name the activities in the data set - transforms the Activity column of data from 1-6 numeric value to the applicable descriptive activity name using the activity_labels.txt file to look up the descriptive activity name
4. Appropriately labels the data set with descriptive variable names using the features.txt file and the grepl function to look up the descriptive variable name for the specific column of data
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject using the aggregate function.

See the run_analysis.R file to see the specific code that performed these transformation steps.
