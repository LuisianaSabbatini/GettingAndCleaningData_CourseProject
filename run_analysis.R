## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis.

#read relevant data: activity labels,features detailed names, test set, train set. 
setwd("~/Desktop/R_Coursera")
actlab<-read.table("./UCI HAR Dataset/activity_labels.txt")
feat<-read.table("./UCI HAR Dataset/features.txt")

tetssub<-read.table("./UCI HAR Dataset/test/subject_test.txt")
tetsx<-read.table("./UCI HAR Dataset/test/X_test.txt")
tetsy<-read.table("./UCI HAR Dataset/test/Y_test.txt")

trainsub<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainx<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainy<-read.table("./UCI HAR Dataset/train/Y_train.txt")

# unify the three test-related and train-related data frames into one for test and one for train
testset<-cbind(tetssub, tetsy, tetsx)

trainset<-cbind(trainsub, trainy, trainx)

## (POINT 1 of course project)
# unify test and train df into one 
dataset<-rbind(trainset, testset)

## (POINT 2 to 4 of course project)
# make the variable names descriptive, 
varnames<-c("subject","activity", feat[,2])
varnames<-tolower(varnames)
varnames<-gsub("-","",x=varnames)
varnames<-gsub(",","_",x=varnames)
varnames<-gsub("\\(","",x=varnames)
varnames<-gsub("\\)","",x=varnames)
names(dataset)<-varnames
# select only mean and std related variables 
idmeanstd<-grepl("mean|std", x=varnames)
dmeanstd<-select(dataset, c("subject", "activity", varnames[idmeanstd==TRUE]))

# make the activities descriptive 
dmeanstd$activity<-factor(dmeanstd$activity, levels=actlab[,1], labels = actlab[,2])
write.table(dmeanstd, "SubjectsActivity_MeanAndStdDev.txt")

## POINT 5 
#From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

groupedset <- group_by(dmeanstd,activity,subject)
## Get the average of each variable
summarisedset <- summarise_each(groupedset, funs(mean))

write.table(summarisedset, "MeanOfSubjectsByActivity.txt", row.name=FALSE)
