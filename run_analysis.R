if (!file.exists('data')) {
        dir.create('data')
}
fileUrl <- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
download.file(fileUrl,destfile="./data/dataset.zip",method="curl")
dateDownloaded <- date()
setwd('./dropbox/class/03-cleaning data/project')
library(tools)
unzip('./data/dataset.zip', exdir = './data/')
activity.labels <- read.table('./uci har dataset/activity_labels.txt', sep=' ',
                            col.names=c('index', 'activity'))
features <- read.table('./uci har dataset/features.txt', sep=' ', 
                       col.names=c('index', 'feature'))

test.files <- list_files_with_type('./uci har dataset/test', type='data')
test.files <- c(test.files, list_files_with_type('./uci har dataset/test/Inertial Signals',
                                                 type='data'))
test.cols <- c(file_path_sans_ext(basename(test.files)))
train.files <- list_files_with_type('./uci har dataset/train', type='data')
train.files <- c(train.files, list_files_with_type('./uci har dataset/train/Inertial Signals',
                                                 type='data'))
train.cols <- c(file_path_sans_ext(basename(train.files)))

for(i in 1:length(test.files)){
        oname = test.cols[i]
        assign(oname, read.table(test.files[i]))
}
for(i in 1:length(train.files)){
        oname = train.cols[i]
        assign(oname, read.table(train.files[i]))
}
m.X <- rbind(X_train, X_test)
names(m.X) <- tolower(features$feature)
m.subject <- rbind(subject_train, subject_test)
m.labels <- rbind(y_train, y_test)
m.X$activity <- as.factor(tolower(activity.labels[m.labels[,],2]))
m.X$subject <- as.factor(m.subject[,1])
m.X2 <- m.X[,grepl('*mean*|*std()*|subject|activity', names(m.X))]
m.X2 <- m.X2[,!grepl('Freq', names(m.X2))]

tidy <- aggregate(m.X2[,1:66], by=list(subject=m.X2$subject, activty=m.X2$activity), 
                  FUN=mean, na.rm=TRUE)
