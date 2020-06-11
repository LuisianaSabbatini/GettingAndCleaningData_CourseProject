
## Script functioning

By executing all the lines of the "run_analysis.R" script you will get a tidy dataset in the file named "MeanOfSubjectsByActivity.txt". This dataset has been developed starting from sparse and not tidy files inside the "UCI HAR Dataset" folder, that should be present in the current working directory, as downloaded from the web. 


## CODEBOOK

Starting from 8 files present inside the "UCI HAR Dataset" folder, namely "activity_labels.txt", "features.txt", "subject_test.txt", "X_test.txt", "Y_test.txt", "subject_train.txt", "X_train.txt", "Y_train.txt". 

Firstly, a complete test dataframe is developed by putting the 561 variables in X_test together with Y_test variable and subject_test variable.

Secondly, a complete train dataframe is developed by iterating what has been done for the testing files on the train files.

The two data frames have been putted together into a comprehensive dataframe, where the variables have been correclty named, using the content of "features.txt" for what it concerns naming the X variables, and adding the two names for Y and subject variables.

The y (named activity) has been switched into a factor, showing detailed labels instead of levels.

Among the 561 variables of the X columns, only those related to mean or standard deviation have been selected.

Starting from this tidy data set, the group_by function has been exploited in order to make easy the computation of the last step of the assignement. In this way, tha final dataset, available inside the file "MeanOfSubjectsByActivity.txt", shows the mean of each previously selected X variable based on groups developed merging by subject id and activity label. 
