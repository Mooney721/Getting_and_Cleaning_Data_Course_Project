===================
Project Description
===================
The purpose for this project was to showcase the downloand and subsequent cleaning of a data set to be used for further analysis.

================================
Study Design and Data Processing
================================

Collection of the Raw Data
==========================
The original data set was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto through Smartlab - Non Linear Complex Systems Laboratory [1]

The description for the experiments run to obtain the data were as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

===========================
Creating The Tidy Data File
===========================
For the purpose of this course, only the data specific to mean and standard deviation values were retained.

Thus, in order to obtain the data specific to the assignment, the following steps were performed using code via R version 3.3.0 on a Windows 64-bit platform:

- Read in the original X test and X training sets
- Read in the original y (numeric indictor labels) for test and training sets
- Read in subject data set, which identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- Read in features labels, which describe each variable measured during the study
- Select only column V2 from features, as these values were used for column headings
- Transpose the features data for V2 column only (features_only) to be used to create column headings
- Set the column headings
- Include only the mean, standard deviation columns in training and test data
- Obtaine only the mean and standard deviation columns for the X data set
- Row-bind the train and test y data sets to each other
- Bind the mean and standard deviation columns to the y data set and subjects data set
- Change class type for activity labels and subject labels to factorfor factor-based analysis
- Create factor levels for the activity labels, based on activity type (i.e., walking, walking upstairs, walking downstairs, sitting, standing, and laying)
- Converting each of the variable (column) names to lower case
- Get rid of parentheses in original data variables
- Change dashes to underscores in data variables
- Aggregate the data by subject and then by activity labels
- Arrange the data in acscending order by activity label and then by subject
- Write the tidy data set into a new file

===========================
Description of the Variables
============================

The original dataset includes the following files:
==================================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 

Variables Present in the Data
=============================
tbodyacc_mean: Mean time domain body acceleration signal (indicated by -X, -Y, -Z for signal in X, Y, or Z direction, respectively)
tbodyacc_std: Standard deviation of time domain body acceleration signal (indicated by -X, -Y, -Z for signal in X, Y, or Z direction, respectively)


Class of Variables
==================
Each of the variables above, with the exception of activitylabels and subject, are of class numeric
A
- Each feature vector is a row on the text file.


Sources and License:
===================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
