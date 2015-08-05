## This script runs Hysplit after downloading met data and looks for the data
## in certain folders specified within the function
## 
## Author: Yusri Yusup
## Date modified: 2015-08-05

# Load packages
library(openair)

# Download the data, commented out so that the data is not downloaded again
#getMet(year=2013,month=1:12)

# Run Hysplit, this function changes the working directory.
for(i in 2013){
  procTraj(lat=5.356249,lon=100.307905,year=i,
           name='penang',hours=24,
           met='/Users/Yusri/Documents/Work/Data analysis/ozone_paper/TrajData/',
           out='/Users/Yusri/Documents/Work/Data analysis/ozone_paper/TrajProc/')
}

# Reset working directory
setwd('/Users/Yusri/Documents/Work/Data analysis/ozone_paper/')

# Import data
trajPenang<-importTraj(site='penang',year=2013,local='./TrajProc/')

# Trajectory plots
trajPlot(selectByDate(trajPenang,start='1/5/2013',end='2/5/2013'),
         orientation=c(90,90,0),plot.type='l',projection='mercator',
         parameters=NULL)

trajLevel(trajPenang,statistic='frequency',col='increment',projection='mercator',
          parameters=NULL)

trajLevel(subset(trajPenang,lat > 5 & lat < 10 & lon > 95 & lon < 105),
          col='increment',orientation=c(90,90,0),method='hexbin',
          projection='mercator',parameters=NULL)
