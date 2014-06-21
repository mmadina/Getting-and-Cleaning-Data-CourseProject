## Code Book for the Tidy Data set

* Raw Data has been modifed using the "run_analysis.R" script and Tidy data has been genreated
* Variable Names in the Raw data set has been modifed to descriptive variable names ,as per the project requirement there * only the columns with mean and standard deviation has been considered and total of 68 variables have been identifed
* below table gives the transaltion of variables from raw data set to the tidy data set.
* In the tidy data file Mean has been rounded to 5 decimal places.
* There are 68 variables and 180 observations


|	Raw Data Set Variable Names	|	Tidy Dat Set Variable Names	|
|	----------------------------|:-------------------:|
|	From "subject_xxxx" file	|	Subject_Id	|
|	From "activity_labels" file	|	Activity_Id	|
|	tBodyAcc-mean()-X	|	acclmtr_time_domain_body_signal_x_axis_mean	|
|	tBodyAcc-mean()-Y	|	acclmtr_time_domain_body_signal_y_axis_mean	|
|	tBodyAcc-mean()-Z	|	acclmtr_time_domain_body_signal_z_axis_mean	|
|	tBodyAcc-std()-X	|	acclmtr_time_domain_body_signal_x_axis_stddev	|
|	tBodyAcc-std()-Y	|	acclmtr_time_domain_body_signal_y_axis_stddev	|
|	tBodyAcc-std()-Z	|	acclmtr_time_domain_body_signal_z_axis_stddev	|
|	tGravityAcc-mean()-X	|	acclmtr_time_domain_gravity_signal_x_axis_mean	|
|	tGravityAcc-mean()-Y	|	acclmtr_time_domain_gravity_signal_y_axis_mean	|
|	tGravityAcc-mean()-Z	|	acclmtr_time_domain_gravity_signal_z_axis_mean	|
|	tGravityAcc-std()-X	|	acclmtr_time_domain_gravity_signal_x_axis_stddev	|
|	tGravityAcc-std()-Y	|	acclmtr_time_domain_gravity_signal_y_axis_stddev	|
|	tGravityAcc-std()-Z	|	acclmtr_time_domain_gravity_signal_z_axis_stddev	|
|	tBodyAccJerk-mean()-X	|	acclmtr_time_domain_jerk_signal_x_axis_mean	|
|	tBodyAccJerk-mean()-Y	|	acclmtr_time_domain_jerk_signal_y_axis_mean	|
|	tBodyAccJerk-mean()-Z	|	acclmtr_time_domain_jerk_signal_z_axis_mean	|
|	tBodyAccJerk-std()-X	|	acclmtr_time_domain_jerk_signal_x_axis_stddev	|
|	tBodyAccJerk-std()-Y	|	acclmtr_time_domain_jerk_signal_y_axis_stddev	|
|	tBodyAccJerk-std()-Z	|	acclmtr_time_domain_jerk_signal_z_axis_stddev	|
|	tBodyGyro-mean()-X	|	gyroscope_time_domain_body_signal_x_axis_mean	|
|	tBodyGyro-mean()-Y	|	gyroscope_time_domain_body_signal_y_axis_mean	|
|	tBodyGyro-mean()-Z	|	gyroscope_time_domain_body_signal_z_axis_mean	|
|	tBodyGyro-std()-X	|	gyroscope_time_domain_body_signal_x_axis_stddev	|
|	tBodyGyro-std()-Y	|	gyroscope_time_domain_body_signal_y_axis_stddev	|
|	tBodyGyro-std()-Z	|	gyroscope_time_domain_body_signal_z_axis_stddev	|
|	tBodyGyroJerk-mean()-X	|	gyroscope_time_domain_jerk_signal_x_axis_mean	|
|	tBodyGyroJerk-mean()-Y	|	gyroscope_time_domain_jerk_signal_y_axis_mean	|
|	tBodyGyroJerk-mean()-Z	|	gyroscope_time_domain_jerk_signal_z_axis_mean	|
|	tBodyGyroJerk-std()-X	|	gyroscope_time_domain_jerk_signal_x_axis_stddev	|
|	tBodyGyroJerk-std()-Y	|	gyroscope_time_domain_jerk_signal_y_axis_stddev	|
|	tBodyGyroJerk-std()-Z	|	gyroscope_time_domain_jerk_signal_z_axis_stddev	|
|	tBodyAccMag-mean()	|	acclmtr_time_domain_body_signal_magnitude_mean	|
|	tBodyAccMag-std()	|	acclmtr_time_domain_body_signal_magnitude_stddev	|
|	tGravityAccMag-mean()	|	acclmtr_time_domain_gravity_signal_magnitude_mean	|
|	tGravityAccMag-std()	|	acclmtr_time_domain_gravity_signal_magnitude_stddev	|
|	tBodyAccJerkMag-mean()	|	acclmtr_time_domain_jerk_signal_magnitude_mean	|
|	tBodyAccJerkMag-std()	|	acclmtr_time_domain_jerk_signal_magnitude_stddev	|
|	tBodyGyroMag-mean()	|	gyroscope_time_domain_body_signal_magnitude_mean	|
|	tBodyGyroMag-std()	|	gyroscope_time_domain_body_signal_magnitude_stddev	|
|	tBodyGyroJerkMag-mean()	|	gyroscope_time_domain_jerk_signal_magnitude_mean	|
|	tBodyGyroJerkMag-std()	|	gyroscope_time_domain_jerk_signal_magnitude_stddev	|
|	fBodyAcc-mean()-X	|	acclmtr_frqncy_domain_body_signal_x_axis_mean	|
|	fBodyAcc-mean()-Y	|	acclmtr_frqncy_domain_body_signal_y_axis_mean	|
|	fBodyAcc-mean()-Z	|	acclmtr_frqncy_domain_body_signal_z_axis_mean	|
|	fBodyAcc-std()-X	|	acclmtr_frqncy_domain_body_signal_x_axis_stddev	|
|	fBodyAcc-std()-Y	|	acclmtr_frqncy_domain_body_signal_y_axis_stddev	|
|	fBodyAcc-std()-Z	|	acclmtr_frqncy_domain_body_signal_z_axis_stddev	|
|	fBodyAccJerk-mean()-X	|	acclmtr_frqncy_domain_jerk_signal_x_axis_mean	|
|	fBodyAccJerk-mean()-Y	|	acclmtr_frqncy_domain_jerk_signal_y_axis_mean	|
|	fBodyAccJerk-mean()-Z	|	acclmtr_frqncy_domain_jerk_signal_z_axis_mean	|
|	fBodyAccJerk-std()-X	|	acclmtr_frqncy_domain_jerk_signal_x_axis_stddev	|
|	fBodyAccJerk-std()-Y	|	acclmtr_frqncy_domain_jerk_signal_y_axis_stddev	|
|	fBodyAccJerk-std()-Z	|	acclmtr_frqncy_domain_jerk_signal_z_axis_stddev	|
|	fBodyGyro-mean()-X	|	gyroscope_frqncy_domain_body_signal_x_axis_mean	|
|	fBodyGyro-mean()-Y	|	gyroscope_frqncy_domain_body_signal_y_axis_mean	|
|	fBodyGyro-mean()-Z	|	gyroscope_frqncy_domain_body_signal_z_axis_mean	|
|	fBodyGyro-std()-X	|	gyroscope_frqncy_domain_body_signal_x_axis_stddev	|
|	fBodyGyro-std()-Y	|	gyroscope_frqncy_domain_body_signal_y_axis_stddev	|
|	fBodyGyro-std()-Z	|	gyroscope_frqncy_domain_body_signal_z_axis_stddev	|
|	fBodyAccMag-mean()	|	acclmtr_frqncy_domain_body_signal_magnitude_mean	|
|	fBodyAccMag-std()	|	acclmtr_frqncy_domain_body_signal_magnitude_stddev	|
|	fBodyBodyAccJerkMag-mean()	|	acclmtr_frqncy_domain_jerk_signal_magnitude_mean	|
|	fBodyBodyAccJerkMag-std()	|	acclmtr_frqncy_domain_jerk_signal_magnitude_stddev	|
|	fBodyBodyGyroMag-mean()	|	gyroscope_frqncy_domain_body_signal_magnitude_mean	|
|	fBodyBodyGyroMag-std()	|	gyroscope_frqncy_domain_body_signal_magnitude_stddev	|
|	fBodyBodyGyroJerkMag-mean()	|	gyroscope_frqncy_domain_jerk_signal_magnitude_mean	|
|	fBodyBodyGyroJerkMag-std()	|	gyroscope_frqncy_domain_jerk_signal_magnitude_stddev	|

