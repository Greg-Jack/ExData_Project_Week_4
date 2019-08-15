
#Step 1
test_set = read.table("UCI HAR Dataset/test/X_test.txt")
test_labels = read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects = read.table("UCI HAR Dataset/test/subject_test.txt")
test_data = cbind(test_subjects,test_labels,test_set)

train_set = read.table("UCI HAR Dataset/train/X_train.txt")
train_labels = read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects = read.table("UCI HAR Dataset/train/subject_train.txt")
train_data = cbind(train_subjects,train_labels,train_set)

data = rbind(test_data,train_data)

#Step 2
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
column_labels = read.table("UCI HAR Dataset/features.txt")
data = data[,append(c(TRUE,TRUE),grepl("*std\\(\\)",column_labels$V2)|grepl("mean\\(\\)",column_labels$V2))]

#Step 3
for(i in 1:6) {
  data$V1.1[data$V1.1 == paste(activity_labels[i,1])] = paste(activity_labels[i,2])
}

#Step 4
names(data) = append(c("Subject-ID","Activity"),as.character(column_labels$V2[grepl("*std\\(\\)",column_labels$V2)|grepl("mean\\(\\)",column_labels$V2)]))

#Step 5
tidy_data = aggregate(. ~ `Subject-ID` + Activity,data=data,max)

#writes tidy data table to file
write.table(tidy_data,"tidy_data.txt",row.names = FALSE)