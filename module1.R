#################################################################
## UT-KBRIN Bioinformatics Summit 2017
## Module 1: Introduction to R and RStudio, Reading Data into R
## The R Team
## Department of Statistics, University of Kentucky
## April 21, 2017
##################################################################################

#### Set Working Directory
setwd("C:/Users/ukystat/Dropbox/UT-KBRIN R Workshop/") # Command to set working directory
getwd() # Displays current working directory

#### Read in data
  practicedata = read.table('practicedata.csv', # Give filename first
      header=TRUE,  # If filename has variable names, set header to TRUE.
                    # Otherwise, use header=FALSE
      sep=",", # Symbol separating data values (comma here)
      na.strings=c("","NA") # Characters used to denote missing values
      #, comment.char='#', # Character used to indicate comments in your file
      #skip=0, # number of lines of data file to skip before reading in data
      #nrows=1000 # maximum number of lines of data file to read in
    )

  practicedata[1:5,] # Prints first 5 rows of the data 
  practicedata[,1:2] # Prints first 2 columns of the data 

  practicedata[,"expvar"] # One way to call the variable, expvar
  practicedata$expvar # Another way to call the variable, expvar
  practicedata$expvar

#### Subset data into data for control and treatment groups
  practicedata2=practicedata[order(practicedata$groupvar2),]
  k=50 # number of observations in each group
  n=100 # total number of observations
  trtmtdata = practicedata[(k+1):n, ] # Save the 51st through 100th rows of the data

#### Subset data into data for control and treatment groups using subset function
  trtmtdata = subset(practicedata , groupvar=='Treatment')
  controldata = subset(practicedata , groupvar=='Control')

### Check format of practice data
  class(practicedata)

#### Writing Data to Files
  getwd() #Check current working directory
  resp.log=log(practicedata$respvar) # take the natural log of the response variable
  # Put columns (variables) together in a new data frame
  data.to.write=data.frame(practicedata$expvar,practicedata$groupvar,resp.log)

  colnames(data.to.write) # print out column names of the new data
  colnames(data.to.write)<-c('expvar','groupvar','logrespvar') # rename the columns of 
                          # the new dataset
  colnames(data.to.write) # print out column names of the new data again
  
  ##To write data to a new .csv file:
  write.table(data.to.write, # data to write to a file
        file='logdata.csv', # name of file you want to save data in
        quote=FALSE, # whether or not to put quotations around data
        col.names=TRUE, # whether or not to write column names to file
        row.names=FALSE, # whether or not to write row names to file
        sep=',', # what you want to put between data entries (commas and spaces are common)
        append=FALSE, # whether or not to append existing data to the current file
        na='NA' # string to use for missing values
        )
  