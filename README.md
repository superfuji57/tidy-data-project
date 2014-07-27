tidy-data-project
=================

This is the repository for the tidy data project for 'Cleaning Data' on Coursera. The result is a tab-delimited text file with the tidy data set.
Run the file run_analysis.R in the directory in which you want the tidy data set exported.

## run_analysis.R
What the code will do:

1. Create a data folder and install the 'tools' packed if non-existant
2. Download the zip file from the URL given in the project instructions and unqip them into the data folder
3. Read the necessary files (excludes Inertial Signals files) into data frames with proper labels
4. Merge testing and training data
5. Reshape the data into a data frame with only the mean and standard deviation of measurements (meanFreq not included) sorted by subject and activity
6. Export the tidy data set into a tab-delimited text file "tidy.txt" into the working directory


