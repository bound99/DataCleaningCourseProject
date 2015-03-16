### read in raw data, with labels and subject index
testRaw <- read.table("E:/R/3.Cleaning/HW/UCIHAR/test/X_test.txt")
testLabel <- read.table("E:/R/3.Cleaning/HW/UCIHAR/test/Y_test.txt")
testSubject <- read.table("E:/R/3.Cleaning/HW/UCIHAR/test/subject_test.txt")
trainRaw <- read.table("E:/R/3.Cleaning/HW/UCIHAR/train/X_train.txt")
trainLabel <- read.table("E:/R/3.Cleaning/HW/UCIHAR/train/Y_train.txt")
trainSubject <- read.table("E:/R/3.Cleaning/HW/UCIHAR/train/subject_train.txt")

features <- read.table("E:/R/3.Cleaning/HW/UCIHAR/features.txt")
labels <- read.table("E:/R/3.Cleaning/HW/UCIHAR/activity_labels.txt")
colnames(labels) <- c("Labels","Activity")

### combine test data and training data, together with their activities and subjectId
test <- cbind(testRaw, testSubject, testLabel)
train <- cbind(trainRaw, trainSubject, trainLabel)
meanStd <- c(grep("mean[(][)]|std",features$V2))
selection <- c(meanStd, 562, 563)
combined <- rbind(train[,selection], test[,selection])

#### rename columns to their feature names, getting rid of "()" in the names
colnames(combined) <- c(gsub("[(][)]","",features$V2[meanStd]), "SubjectId","Labels")

#### transfer lables to activity names
combined <- merge(combined, labels)
combined <- combined[,-1]

### calculate mean for each subject and activity
aggdata <- aggregate(combined, by=list(combined$SubjectId,combined$Activity), FUN=mean, na.rm=TRUE)
aggdata <- aggdata[,1:(dim(aggdata)[2]-2)]
colnames(aggdata)[1:2] <- c("SubjectId", "Activity")

### output to a text file, as by default, space delimited
write.table(aggdata, file="E:/R/3.Cleaning/HW/DataCleaningCourseProject/combined_output.txt", row.names = F, sep = "\t")

### test on reading in the output file
#a <- read.table("E:/R/3.Cleaning/HW/UCIHAR/combined_output.txt", header=T, sep = "\t")
