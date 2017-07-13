#################################################################
## UT-KBRIN Bioinformatics Summit 2017
## Module 2: Visualizing Data in R
## The R Team
## Department of Statistics, University of Kentucky
## April 21, 2017
##################################################################################

#########################################
## Plotting One Quantitative Variable
#########################################
## Creating a histogram
hist(practicedata$respvar, # what the histogram is plotting
     main='Histogram of Response Variable', # change the main axis title
     xlab='Response Variable', # change the x-axis label
     #, freq=TRUE # histogram is of counts
     # breaks="Sturges", # this can be changed to specify a series of points
     # for the breaks in the histogram
      xlim=c(20,70), # sets the limits of the x-axis
     # ylim=c(0,25), # sets the limits of the y-axis
     col='blue' # change color of histogram
)

## Creating a boxplot:
boxplot(practicedata$respvar, # what the boxplot is plotting
        main='Default R Boxplot' # change the main title
)

## Creating a ''nicer'' boxplot
boxplot(practicedata$respvar, # what the boxplot is plotting
        main='Nicer R Boxplot', # change the main title
        ylab='Response Variable', # change the y-axis label
        names='All Data', # change the name under the boxplot
        col='blue', # change the color of the boxplot
        outline=TRUE # Draw outliers if there are any in the data
)


#########################################
## Plotting One Categorical Variable
#########################################

## Bar Chart
plot.group<-table(practicedata$groupvar) # Create table of counts
plot.group  # Look at the table
barplot(plot.group, # Bar chart of the variable
        main='Bar Chart of Groups', # change main title
        col=c('green','blue') # change color of each bar
)

## Pie Chart:
pie(plot.group, # Pie chart of the variable
    main='Pie Chart of Grouping Variable', # change main title
    col=c('green','blue')) # change the color of each slice of the pie


#########################################
## Plotting Two Variables
#########################################

#### Plotting One Quantitative and One Categorical Variable:

#### Side-by-side boxplots
boxplot(practicedata$respvar~practicedata$groupvar, main='Default R Boxplots')

boxplot(practicedata$respvar~practicedata$groupvar, 
        main='Nicer R Boxplots',
        names=c('Control Group', 'Treatment Group'),
        col=c('green','blue'), # change color of boxes
        ylab='Response Variable' # change y-axis label
        # horizontal=TRUE # change boxplots to horizontal
        )

#### Two Histograms:

## Histograms for each group
hist(controldata$respvar,
     main='Control Group', # change the main title
     xlab='Response Variable'
)
hist(trtmtdata$respvar,
     main='Treatment Group', # change the main title
     xlab='Response Variable'
)
box()

#### Plotting two quantitative variables using a scatterplot:
plot(practicedata$toyvar,practicedata$respvar, # x variable, y variable
     main="Default R Scatterplot")

plot(practicedata$toyvar,practicedata$respvar, # x variable, y variable
     main="Plot of Response Variable vs. Toy Variable", # change main label
     ylab='Response Variable', # change y-axis label
     xlab='Toy Variable', # change x-axis label
     pch=20 # change the plotting symbol
     #, type='l', # instead of pch, you can create a line plot
     # (make sure your x's are ordered if you do this.)
     # col='black' # change color of plotting symbol
)

#########################################
## Plots Showing More than Two Variables
#########################################

## Find the range of the variables we are plotting for BOTH groups
ydatarange=range(practicedata$respvar,na.rm=TRUE)
xdatarange=range(practicedata$toyvar,na.rm=TRUE)

## Create scatterplot with all data
plot(controldata$toyvar,controldata$respvar, # x variable, y variable
     main="Plot of Response Variable vs. Toy Variable", # change main label
     ylab='Response Variable', # change y-axis label
     xlab='Toy Variable', # change x-axis label
     pch=20, # change the plotting symbol
     col='green', # change color of plotting symbol
     xlim=xdatarange, # change the x-axis to cover the range
     # of both the treatment and control groups
     ylim=ydatarange, # change the y-axis to cover the range
     # of both the treatment and control groups
     type='n' # create the plotting window, but not the points
)

## Add observations for the control data to the plot
points(controldata$toyvar,controldata$respvar, # x variable, y variable
       pch=20, # change the plotting symbol
       col='green' # change color of plotting symbol
)
## Add observations for the treatment data to the plot
points(trtmtdata$toyvar,trtmtdata$respvar, # x variable, y variable
       pch=20, # change the plotting symbol
       col='blue' # change color of plotting symbol
)

## Adding a Legend to the Plot
legend('topleft', # location of legend
       legend=c('Control Group','Treatment Group'), # lines of text in the legend
       pch=20, # symbol used in the legend
       col=c('green','blue') # colors of the symbol in the same 
       # order as the lines of text in 'legend'
       # lty=1, lwd=1 # change the line type and width if lines are on the plot,
)



#########################################
## Using par()
#########################################

# Example: Using the par function to change the number of plots in the panel
par(mfrow=c(1,2))
#mfrow=c(1,2) creates a plotting window with 2 rows and 1 column of plots
#mfrow=c(2,1) creates a plotting window with 1 row and 2 columns of plots

#### Histograms for each group
hist(controldata$respvar,
     main='Control Group', # change the main title
     xlab='Response Variable'
)
hist(trtmtdata$respvar,
     main='Treatment Group', # change the main title
     xlab='Response Variable'
)

