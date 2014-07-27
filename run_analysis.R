if (!file.exists('data')) {dir.create('data')}
if (!'tools' %in% installed.packages()) install.packages('tools') #check for library dependency
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile="./data/dataset.zip",method="curl")
dateDownloaded <- date()
library(tools) #for life_files_with_type and file_path functions to extract titles
unzip('./data/dataset.zip', exdir = './data/')
activity.labels <- read.table('./data/uci har dataset/activity_labels.txt', sep=' ',
                            col.names=c('index', 'activity'))
features <- read.table('./data/uci har dataset/features.txt', sep=' ', 
                       col.names=c('index', 'feature'))

#extract full names of files to be used. Excludes Inertial Signal folders as they
#are not relevant to the project
test.files <- list_files_with_type('./data/uci har dataset/test', type='data')
test.cols <- c(file_path_sans_ext(basename(test.files)))
train.files <- list_files_with_type('./data/uci har dataset/train', type='data')
train.cols <- c(file_path_sans_ext(basename(train.files)))

#loop over file names to read into data frames
for(i in 1:length(test.files)){
        oname = test.cols[i]
        assign(oname, read.table(test.files[i]))
}
for(i in 1:length(train.files)){
        oname = train.cols[i]
        assign(oname, read.table(train.files[i]))
}

#use rbind to combine rows of testing and training data
m.X <- rbind(X_train, X_test)
names(m.X) <- tolower(features$feature) #apply lower case feature names to col titles
m.subject <- rbind(subject_train, subject_test) #merge subject row
m.labels <- rbind(y_train, y_test) #merge and add labels of variables
#add factored variables
m.X$activity <- as.factor(tolower(activity.labels[m.labels[,],2]))
m.X$subject <- as.factor(m.subject[,1]) 

#get only mean and std
m.X2 <- m.X[,grepl('*mean*|*std()*|subject|activity', names(m.X))]
m.X2 <- m.X2[,!grepl('Freq', names(m.X2))] #remove meanFreq variables

#view means by subject and activity
tidy <- aggregate(m.X2[,1:66], by=list(subject=m.X2$subject, activty=m.X2$activity), 
                  FUN=mean, na.rm=TRUE)
#export file as txt
write.table(tidy, file='tidy.txt', sep='\t')
cat('The tidy data set is now saved in tab-delimited format in the working directory as tidy.txt. 
    \nYou can view the combined data frame in the ojbect m.X. m.X2 contains only mean std measurements')
