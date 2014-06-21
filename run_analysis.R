run_anlysis <- function(directory) 

{
  ##You should create one R script called run_analysis.R that does the following. 

##Merges the training and the test sets to create one data set.

  directory <- as.character(directory)

##setwd("C:/Users/madinam/Documents/Coursera/R-Datafiles")  
  setwd(directory)

# Create Column Names Vector
  
  Datacolnames <- read.table("features.txt")

  Datacolnames <- Datacolnames[,c("V2")]

  colnamevect <- Datacolnames

  colnamevect <- as.vector(colnamevect)


##print('1')

## Read Train data (Count # 7352)


subject_train <- read.csv ("subject_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(subject_train) <- "Subject_Id"

y_train  <- read.csv ("y_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(y_train) <- "Activity_Id"


x_train <- read.csv ("X_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(x_train) <- colnamevect

traindata <- cbind(subject_train,y_train,x_train)

# Read Test Data (Count # 2947)
##print('2')
subject_test <- read.csv ("subject_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(subject_test) <- "Subject_Id"

y_test  <- read.csv ("y_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(y_test) <- "Activity_Id"

##print('3')
x_test <- read.csv ("X_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(x_test) <- colnamevect 
##print('4')
testdata <- cbind(subject_test,y_test,x_test)


## Merges the training(x_train) and the test(x_test) sets to create one data set.
## Number of rows (10,299)
##print('5')
meregedata <-  rbind(traindata,testdata)

## For Excat Match on mean columns
meandata<- meregedata[,grepl('std()|mean\\(\\)|Activity_Id|Subject_Id', names(meregedata))]

##Uses descriptive activity names to name the activities in the data set

## Read activty_lables file to a dataframe

activity_labels <- read.table("activity_labels.txt")

colnames(activity_labels)  <- c("Activity_Id","activity_name")

for(i in 1:length(activity_labels$Activity_Id))

{ 
  
  meandata$Activity_Id[meandata$Activity_Id==i] <- as.character(activity_labels[activity_labels$Activity_Id==i,c("activity_name")])
}

##meandata$Activity_Id[meandata$Activity_Id==1] <- "WALKING"

#meandata$Activity_Id[meandata$Activity_Id==2] <- "WALKING_UPSTAIRS"

#meandata$Activity_Id[meandata$Activity_Id==3] <- "WALKING_DOWNSTAIRS"

#meandata$Activity_Id[meandata$Activity_Id==4] <- "SITTING"

#meandata$Activity_Id[meandata$Activity_Id==5] <- "STANDING"

#meandata$Activity_Id[meandata$Activity_Id==6] <- "LAYING"


##Appropriately labels the data set with descriptive variable names. 

meandatatest <- meandata

#print('1')

colnames(meandatatest) <- sub("tBodyAcc","acclmtr_time_domain_body_signal_",names(meandatatest))
colnames(meandatatest) <- sub("tGravityAcc","acclmtr_time_domain_gravity_signal_",names(meandatatest))
colnames(meandatatest) <- sub("tBodyGyro","gyroscope_time_domain_body_signal_",names(meandatatest))
colnames(meandatatest) <- sub('fBodyAcc|fBodyBodyAcc',"acclmtr_frqncy_domain_body_signal_",names(meandatatest))
colnames(meandatatest) <- sub('fBodyGyro|fBodyBodyGyro',"gyroscope_frqncy_domain_body_signal_",names(meandatatest))

colnames(meandatatest) <- sub("\\-mean\\(\\)\\-X","x_axis_mean",names(meandatatest))
colnames(meandatatest) <- sub("\\-mean\\(\\)\\-Y","y_axis_mean",names(meandatatest))
colnames(meandatatest) <- sub("\\-mean\\(\\)\\-Z","z_axis_mean",names(meandatatest))

colnames(meandatatest) <- sub("\\-std\\(\\)\\-X","x_axis_stddev",names(meandatatest))
colnames(meandatatest) <- sub("\\-std\\(\\)\\-Y","y_axis_stddev",names(meandatatest))
colnames(meandatatest) <- sub("\\-std\\(\\)\\-Z","z_axis_stddev",names(meandatatest))

colnames(meandatatest)  <- sub("\\(\\)","",names(meandatatest))

colnames(meandatatest) <- sub("body_signal_Jerkx_axis_stddev","jerk_signal_x_axis_stddev",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_Jerky_axis_stddev","jerk_signal_y_axis_stddev",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_Jerkz_axis_stddev","jerk_signal_z_axis_stddev",names(meandatatest))

colnames(meandatatest) <- sub("body_signal_Jerkx_axis_mean","jerk_signal_x_axis_mean",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_Jerky_axis_mean","jerk_signal_y_axis_mean",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_Jerkz_axis_mean","jerk_signal_z_axis_mean",names(meandatatest))

colnames(meandatatest) <- sub("body_signal_Mag-mean","body_signal_magnitude_mean",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_Mag-std","body_signal_magnitude_stddev",names(meandatatest))

colnames(meandatatest) <- sub("gravity_signal_Mag-mean","gravity_signal_magnitude_mean",names(meandatatest))
colnames(meandatatest) <- sub("gravity_signal_Mag-std","gravity_signal_magnitude_stddev",names(meandatatest))

colnames(meandatatest) <- sub("body_signal_JerkMag-mean","jerk_signal_magnitude_mean",names(meandatatest))
colnames(meandatatest) <- sub("body_signal_JerkMag-std","jerk_signal_magnitude_stddev",names(meandatatest))


##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(reshape2)

datamelt <- melt(meandatatest, id=c("Subject_Id","Activity_Id"))

avgvariabledata <- dcast(datamelt, Subject_Id+Activity_Id ~ variable , function(x) {
  as.numeric(format(mean(x), digits=5))})

write.table(avgvariabledata, file = "TidyData.csv", sep = "|",eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = TRUE)

print(nrow(avgvariabledata))

}