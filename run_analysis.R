library(dplyr)

## Reading in test, train, and features data
## Note that both the test and train data have x, y, and subject associated data tables
xtest<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/X_test.txt")
ytest<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/y_test.txt")
subjecttest<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/subject_test.txt")
xtrain<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/X_train.txt")
ytrain<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/y_train.txt")
subjecttrain<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/subject_train.txt")
features<-read.table("C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/features.txt")

## First, select only the column V2 from features, as these are the elements which will be used for column headings
featuresonly<-select(features, V2)

#Next, transpose the features data for V2 only (features_only) to be used to create column headings
featurestrans <- t(featuresonly[,1:ncol(featuresonly)])

# Set the column headings
colnames(xtest) <- featuresonly[,1]
colnames(xtrain) <- featuresonly[,1]
colnames(ytest) <- "activitylabels"
colnames(ytrain) <- "activitylabels"
colnames(subjecttest) <- "subject"
colnames(subjecttrain) <- "subject"

## Including only the mean, std columns in training and test data
meanstd<-rbind(xtest, xtrain)

## Using grepl to only obtain the mean and standard deviation columns
meancols<-meanstd[,grepl("[Mm]ean", colnames(meanstd))]
stdcols<-meanstd[,grepl("[Ss]td", colnames(meanstd))]

## Also, row binding the y_train and y_test and subject_train and subject_test variables
yset<-rbind(ytest, ytrain)
subjectset<-rbind(subjecttest, subjecttrain)

## Binding the mean and std columns to the y_set and subject_set data sets
activityset<-cbind(meancols, stdcols, yset, subjectset)

## Changing the class type for activitylabels and subject in activity_set to "factor"
activityset$subject<-factor(activityset$subject)
activityset$activitylabels<-factor(activityset$activitylabels)

## Creating factor levels for the activity labels
levels(activityset$activitylabels) <-c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")

## Converting each of the variable (column) names to lower cases
activityset.l<-tolower(colnames(activityset))
colnames(activityset) <- activityset.l

## Getting rid of parentheses from column names in data set
activityset.p<-sub("\\()","",names(activityset))
colnames(activityset)<-activityset.p

## Changing dashes to underscores
activityset.d<-sub("-","_",names(activityset))
colnames(activityset)<-activityset.d

## Aggregating the data by subject and then by activity labels
aggdata<-aggregate(. ~ activitylabels + subject, activityset, mean)

## Arranging the activityset by activity label and then by subject
tidydata<-arrange(aggdata, activitylabels, subject)

## Writing the tidy data set into a new file
write.table(tidydata,"C:/Users/Mooney/Desktop/Coursera/Getting_Cleaning_Data/tidydata.txt", row.name = FALSE)
