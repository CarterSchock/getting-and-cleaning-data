## CodeBook for Variables in Full_Tidy.txt <a name="CodeBook for Variables in Full_Tidy.txt"></a>

Each observation in "Full_Tidy.txt" is an average of each of the variables described below in "Variables" by subject and activity. 
The raw files containing each individual measurement can be found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Identifying Variables <a name="Identifying Variables"></a>

- `subject`

	Subject ID

- `activity`

	Activity performed by the subject
	- `WALKING`
	- `WALKING_UPSTAIRS`
	- `WALKING_DOWNSTAIRS`
	- `SITTING`
	- `STANDING`
	- `LAYING`
  
## Variables <a name="Variables"></a>

Variables in this dataset fall into two categories: Time domain and Frequency Domain. Each measurement was recorded in terms of time and freqency. 
Those in the time domain contain the prefix "time_domain" and those in the frequency domain contain the prefix "freq_domain."
Mean and Standard Deviation was captured for each 
measurement in three dimensions: X, Y and Z.

- Body Accelerometer:

  - `time_domainBodyAccelerometermeanX`
  - `time_domainBodyAccelerometermeanY`	
  - `time_domainBodyAccelerometermeanZ`	
  - `time_domainBodyAccelerometerStandardDevX`	
  - `time_domainBodyAccelerometerStandardDevY`
  - `time_domainBodyAccelerometerStandardDevZ`
    
- Gravity Accelerometer:   
    
  - `time_domainGravityAccelerometermeanX`	
  - `time_domainGravityAccelerometermeanY`
  - `time_domainGravityAccelerometermeanZ`
  - `time_domainGravityAccelerometerStandardDevX`	
  - `time_domainGravityAccelerometerStandardDevY`	
  - `time_domainGravityAccelerometerStandardDevZ`	
  
- Body Accelerometer Jerk Mean

  - `time_domainBodyAccelerometerJerkmeanX`	
  - `time_domainBodyAccelerometerJerkmeanY`	
  - `time_domainBodyAccelerometerJerkmeanZ`
  - `time_domainBodyAccelerometerJerkStandardDevX`
  - `time_domainBodyAccelerometerJerkStandardDevY`
  - `time_domainBodyAccelerometerJerkStandardDevZ`	
  
- Body Gyroscope
  - `time_domainBodyGyroscopemeanX`	
  - `time_domainBodyGyroscopemeanY`
  - `time_domainBodyGyroscopemeanZ`
  - `time_domainBodyGyroscopeStandardDevX`	
  - `time_domainBodyGyroscopeStandardDevY`
  - `time_domainBodyGyroscopeStandardDevZ`	
  
- Body Gyroscope Jerk
  - `time_domainBodyGyroscopeJerkmeanX`	
  - `time_domainBodyGyroscopeJerkmeanY`	
  - `time_domainBodyGyroscopeJerkmeanZ`	
  - `time_domainBodyGyroscopeJerkStandardDevX`	
  - `time_domainBodyGyroscopeJerkStandardDevY`	
  - `time_domainBodyGyroscopeJerkStandardDevZ`	
  
- Body Accelerometer Magnitude
  - `time_domainBodyAccelerometerMagnitudemean`	
  - `time_domainBodyAccelerometerMagnitudeStandardDev`
  
- Gravity Accelerometer Magnitude
  - `time_domainGravityAccelerometerMagnitudemean`	
  - `time_domainGravityAccelerometerMagnitudeStandardDev`	
  
- Body Accelerometer Jerk Magnitude 
  - `time_domainBodyAccelerometerJerkMagnitudemean`
  - `time_domainBodyAccelerometerJerkMagnitudeStandardDev`
  
- Body Gyroscope Magnitude
  - `time_domainBodyGyroscopeMagnitudemean`	
  - `time_domainBodyGyroscopeMagnitudeStandardDev`	
  
- Body Gyroscope Jerk Magnitude
  - `time_domainBodyGyroscopeJerkMagnitudemean`	
  - `time_domainBodyGyroscopeJerkMagnitudeStandardDev`
  
 ## Data Transformations <a name="Data Transformations"></a>

The following is a summary of the steps taken to transform the raw data located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20H 
into Full_Tidy.txt. These steps are executed in the run_analysis.r file :

- Data was read in from the url and unzipped.
- Activity and subject labels were renamed to be more descriptive.
- The test and training sets were merged into one dataframe.
- Only columns with the mean and standard deviations for each measurement were selected; all other measurement columns were excluded.
- The Activity column was renamed to have descriptive level names.
- The columns containing measurement variables were renamed to have more descriptive and readable names. 
- A tidy dataset was created with the average of each measurement grouped by Activity and Subject, 
e.g. each participant has an average for each measurement in each activity for a total of 180 observations. 
 
