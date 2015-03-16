Code book for Getting and Cleaning Data course project

Data prepare process:
1. Read in all raw data.
2. Combine the observation data (X_test.txt or X_train.txt) with their activity labels (Y_test.txt or Y_train.txt) as well as the SubjectId list (subject_test.txt or subject_train.txt), so that test dataset or training dataset is restored with full information.
3. Combine the training and test dataset by stacking them up.
4. Select the variables that contains mean and standard deviation measures only.
5. Rename the columns of these variables according to the feature list (features.txt).
6. Substitute activity label by activity name through merging the activity lookup table (activity_labels.txt).
7. Calculate the mean of each variable grouped by Subject and Activity.
8. Rename the columns of final output data, and write to a tab delimited text file.

================================================

Output file dictionary

SubjectId - An identifier of the subject who carried out the experiment. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

Activity - Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

[feature]-mean/std(-X/Y/Z) - The mean of the target measure (mean or standard deviation) on a perticular feature on a Subject and their activities. There are 33 features selected by the experiment, which adds up to 66 target measures. More details of features are listed below.
================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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
