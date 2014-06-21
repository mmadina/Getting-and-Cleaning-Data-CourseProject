run_anlysis <- function(directory) 

{
 

 ##Read the directory name into directory vector

  
  directory <- as.character(directory)

##set the directory as working directory
##setwd("C:/Users/madinam/Documents/Coursera/R-Datafiles")  
  setwd(directory)

## Create Column Names Vector from directory
  
  Datacolnames <- read.table("features.txt")

  Datacolnames <- Datacolnames[,c("V2")]

  colnamevect <- Datacolnames

## Create Column Names Vector 
  colnamevect <- as.vector(colnamevect)

## Read Train data and Assign the column names (Count # 7352)


subject_train <- read.csv ("subject_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(subject_train) <- "Subject_Id"

y_train  <- read.csv ("y_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(y_train) <- "Activity_Id"


x_train <- read.csv ("X_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(x_train) <- colnamevect

traindata <- cbind(subject_train,y_train,x_train)

# Read Test Data and assign the column names (Count # 2947)

subject_test <- read.csv ("subject_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(subject_test) <- "Subject_Id"

y_test  <- read.csv ("y_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(y_test) <- "Activity_Id"


x_test <- read.csv ("X_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
colnames(x_test) <- colnamevect 

testdata <- cbind(subject_test,y_test,x_test)


## Merges the train and the test(x_test) sets to create one data set.
## Number of obeservations (10,299)

meregedata <-  rbind(traindata,testdata)

## Exact match on mean and std dev columns
meandata<- meregedata[,grepl('std()|mean\\(\\)|Activity_Id|Subject_Id', names(meregedata))]

##Uses descriptive activity names to name the activities in the data set
## Read activty_lables file to a dataframe

activity_labels <- read.table("activity_labels.txt")

colnames(activity_labels)  <- c("Activity_Id","activity_name")

for(i in 1:length(activity_labels$Activity_Id))

{ 
  
  meandata$Activity_Id[meandata$Activity_Id==i] <- as.character(activity_labels[activity_labels$Activity_Id==i,c("activity_name")])
}


##Appropriately labels the data set with descriptive variable names. 

meandatatest <- meandata



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

print(head(avgvariabledata))

}
