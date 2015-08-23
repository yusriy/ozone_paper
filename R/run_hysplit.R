## This script runs Hysplit after downloading met data and looks for the data
## in certain folders specified within the function
## 
## Author: Yusri Yusup
## Date modified: 2015-08-05

# Load packages
library(openair)
library(mapdata) # To use hi-res maps

source('R/procTraj.R')
source('R/read.files.R')
source('R/getMet.R')
source('R/add.met.R')

# Download the data, commented out so that the data is not downloaded again
getMet(year=1998:2012,month=1:12)

# Run Hysplit, this function changes the working directory.
for(i in 2013){
  procTraj(lat=5.356249,lon=100.307905,year=i,
           name='penang',hours=8,height=300,
           met='/Users/Yusri/Documents/Work/Data analysis/ozone_paper/TrajData/',
           out='/Users/Yusri/Documents/Work/Data analysis/ozone_paper/TrajProc/')
}

# Reset working directory
setwd('/Users/Yusri/Documents/Work/Data analysis/ozone_paper/')

# Import data
trajPenang<-importTraj(site='penang',year=2013,local='./TrajProc/')

# Need to define Monsoon seasons
## Note: Northeast monsoon: Dec-Jan-Feb-Mar (4 months) NEM
## Spring transitional inter-monsoon: Apr-May (2 months) STM
## Southwest monsoon: Jun-Jul-Aug-Sep (4 months) SWM
## Fall transitional inter-monsoon: Oct-Nov (2 months) FTM

monsoon <- ''
for (i in 1:nrow(trajPenang)){
  if (trajPenang$month[i] == 12 | trajPenang$month[i] == 1 |
      trajPenang$month[i] == 2 | trajPenang$month[i] == 3) {
    monsoon[i] <- 'NEM'
  } else if (trajPenang$month[i] == 4 | trajPenang$month[i] == 5) {
    monsoon[i] <- 'STM'
  } else if (trajPenang$month[i] == 6 | trajPenang$month[i] == 7 |
             trajPenang$month[i] == 8 | trajPenang$month[i] == 9){
    monsoon[i] <- 'SWM'
  } else {
    monsoon[i] <- 'FTM'
  }
}

monsoon<-factor(monsoon,levels=c('NEM','STM','SWM','FTM'),ordered=TRUE)
trajPenang <- cbind(trajPenang,monsoon)
rm(monsoon)


# Trajectory plots
trajPlot(selectByDate(trajPenang,start='1/5/2013',end='2/5/2013'),
         orientation=c(90,90,0),plot.type='l',projection='mercator',
         parameters=NULL)

trajLevel(trajPenang,statistic='frequency',col='increment',projection='mercator',
          parameters=NULL)

trajLevel(subset(trajPenang,lat > 0 & lat < 10 & lon > 95 & lon < 105),
          col='increment',orientation=c(90,90,0),method='hexbin',statistic='difference',
          projection='mercator',parameters=NULL,map.res='hires',grid.col='black')
