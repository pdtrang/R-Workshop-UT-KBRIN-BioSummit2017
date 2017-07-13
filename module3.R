#################################################################
## UT-KBRIN Bioinformatics Summit 2017
## Module 3: Some Statistical Analyses
## The R Team
## Department of Statistics, University of Kentucky
## April 21, 2017
#################################################################

##########################################
## Summary Statistics
##########################################
## Find group means for response variable
aggregate((practicedata$respvar)~practicedata$groupvar*practicedata$groupvar2,
          FUN=mean)

## Find group standard deviations for response variable
aggregate((practicedata$respvar)~practicedata$groupvar*practicedata$groupvar2,
          FUN=sd)

##########################################
## Two-sample t-tests
##########################################

## Perform a t-test
t.test(respvar~groupvar,data=practicedata,
       var.equal=TRUE)
t.test(respvar~groupvar2,data=practicedata,
       var.equal=TRUE)

##########################################
## Perform an ANOVA
##########################################
anova.results=lm(respvar~groupvar+groupvar2+groupvar*groupvar2,data=practicedata)

anova.results
anova(anova.results)
summary(anova.results)


###################################################
### Linear Regression
###################################################

## Scatter plot of the data
plot(practicedata$expvar,practicedata$respvar,xlab='Explanatory Variable',
      ylab='Response Variable',pch=20)

## Fit a linear model to the Data
fitted.model = lm(respvar~expvar,
                      data=practicedata) # Fit a linear model with
                      # y-variable respvar and x-variable expvar
summary(fitted.model) #Summarize the linear model


## Check to make sure that the model looks appropriate
 plot(fitted.model)


#Plot the data with the fitted regression line
plot(practicedata$expvar,practicedata$respvar,pch=20)
abline(fitted.model)

##Plotting the data and the fitted model
plot(practicedata$expvar,practicedata$respvar,pch=20)
points(practicedata$expvar[practicedata$groupvar=='Treatment'],
        practicedata$respvar[practicedata$groupvar=='Treatment'],
        col='blue',pch=20)


##You can also fit a linear model with more than one variable
fitted.group.model = lm(respvar~expvar + groupvar,
                      data=practicedata) # Fit a linear model with
                      # y-variable respvar and x-variables expvar and groupvar
summary(fitted.group.model) #Summarize the linear model
plot(fitted.group.model)

##You can also fit a linear model with both variables and their interaction
fitted.int.model = lm(respvar~expvar + groupvar + expvar*groupvar,
                      data=practicedata) # Fit a linear model with
                      # y-variable respvar and 
                      # x-variables expvar, groupvar and their interaction
summary(fitted.int.model) #Summarize the linear model
