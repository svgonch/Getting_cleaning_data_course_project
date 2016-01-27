## Datasets used in the R script
### Initial datasets
* 'features': List of all features.
* 'act_lab': Links the class labels with their activity name.
* 'train_dat': Training set.
* 'train_lab': Training labels.
* 'test_dat': Test set.
* 'test_lab': Test labels.
* 'train_sub': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test_sub': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
<<<<<<< HEAD

## Modified datasets and variables

=======
## Modified datasets and variables
>>>>>>> ff99f15928f93f7d586c30bb819bf25df43d07f9
* 'dat': binded rows 'test_dat' and 'train_dat'
* 'sub': binded rows 'test_sub' and 'train_sub'
* 'lab': binded rows 'test_lab' and 'train_lab'
* 'dat_comb': binded columns of dat, sub, lab
* 'melted': dataframe converted into a castable melted data frame by reshaping the data
* 'tidy_data': tabulated data by subject and activity_labels in rows and mean and standard deviation in columns. Summarized by providing mean values.
* 'mean_std_in', integer vector: Extracted INDICES of mean and standard deviation variables from 'features'
* 'mean_std_names', character vector: Extracted and cleaned NAMES of mean and standard deviation variables from 'features'

## Steps of R script implementation

* Training and test data were loaded into R and combined by rows. 
* Features with variable names and activity labels were loaded into R. Then from feature dataset mean and std dev variable labels were extracted.
* From data were extracted columns corresponding to mean and std dev variables.
* On the next step subject idintifiers, activity labels and data were binded by columns in 'dat_comb'. Columns were named according to 'mean_std_names'. Activities were named according to activity names dataset.
* The data was reshaped through melting and dcasting to calculate mean of each variable for each activity and each subject.
* 'tidy_data' was written to 'tidy_data.txt' file.
