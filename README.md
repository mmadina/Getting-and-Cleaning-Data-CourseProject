Getting-and-Cleaning-Data-CourseProject
=======================================

This Repository contains the files related to the Coursera's Project of Coursera's Getting and Cleaning Data Course.

##Introduction

* This Repository contains the files related to the Getting and Cleaning Data Course Project
* The goal of the course project is to prepare tidy data that can be used for later analysis. 
* Following files will be submitted as part of the Course Project to the GITHUB Repository
* 1) a tidy data set as described below 
* 2) a link to a Github repository with the script for performing analysis  
* 3) a code book "CodeBook.md " that describes the variables and the data.


## Raw Data
* Raw data files are provided by the instructor and can be downloaded from the below URL
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The Raw data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
* A full description is available at the site where the data was obtained
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Course Project Requirements

* From the raw data files following steps have to be performed 

   1.) Merge the training and the test sets to create one data set.
   2.) Extract only the measurements on the mean and standard deviation for each measurement. 
   3.) Uses descriptive activity names to name the activities in the data set
   4.) Appropriately labels the data set with descriptive variable names. 
   5.) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Summary of steps Performed
* Downloaded the data files to the R working directory on the local machine
* created  "run_analysis.R"  which reads the raw data files and creates a Tidy data set , steps performed by the script are detailed below in section
* Finally Created the Tidy data set and Code Book for the Project, For Code nook check Cobebook.MD file in the GITHUB repository.

## Raw Data Files Download

* Download the files to a directory on your computer from the above webiste Unzip the folder and extract the following   files to the directory "X_test","X_train","subject_test","subject_train","y_test","y_train","features","activity_labels" all these files have to exist in the same directory and note down the directory name, for more information related to these files read the "README.txt" in the unzipped folder.

## Summary of R-Script used for the Project

* "run_analysis.R" is used to create the final dataset which is uploaded to the Repository
* Anyone can use this script to create Tidy data set, following have to be performed in order to execute the script.
*     1.) Source "run_analysis.R" function 
*     2.) "run_analysis.R"  accepts directory name as the parameter, after sourcing "run_analysis.R" file into R, pass              the directory name to which files where downloaded in the above step
*         For Ex: run_anlysis("C:/Users/madinam/Documents/Coursera/R-Datafiles")
### run_analysis.R Steps

* Reads the directory name passed  and sets it as working firectory
* Reads "features.txt" and creates a column Vector which will be later used to assign to the test and train data
* Read test data and train data including the subject_***.txt files and create final traindata and testdata
* traindata and testdata datasets are assigned the Variable names and merged to form a single dataset 
* Dataset is then subsetted to include only the variables realted to mean and standrad deviation
* Names of the variables are then modified to be more descriptive which can be refrenced in "CODEBOOK.md" file
* Finally tidy data set with the average of each variable for each activity and each subject is created.
* Pipe delimited file with the name "TidyData.csv" will be created in the directory which was passed to the function 

##Conclusion
* This script can be run by peer reviwer by downloading and sourcing it in R and executing the above steps mentioned 
* If you sucessfully execute the script there will be CSV file created in the directory which was passed to the script, als0 there will 6 records which will be displayed on the R Prompt, the Variable names have been named very descriptive    for clear understanding. 
* There are 68 variables and 180 observations in the final tidy data set.






