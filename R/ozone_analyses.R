## Statistical tests and exploratory data analyses on the data
## 
## Author: Yusri Yusup
## Date created: 2015-08-05

library(openair)
library(mapdata) # To use hi-res map data

#### Summary of met data ####
## Summary of data for stations WMKB (CA0003) and WMKP (CA0038) only for check
## columns with met data from NOAA
summary(CA0003[,15:22])
summary(CA0038[,15:22])

#### T-tests ####

# Air temperature between mainland and island
t.test(CA0003$T_met,CA0038$T_met)
# Relative humidity between mainland and island
t.test(CA0003$RH_met,CA0038$RH_met)
# Wind speed between mainland and island
t.test(CA0003$ws,CA0038$ws)

## Results: significant difference for T and RH between mainland and island.

#### Theil-Sen analysis ####
## Temperature mainland
CA0003T <- TheilSen(selectByDate(CA0003,year=2003:2013),statistic = 'median',
                    pollutant='T_met',main='WMKB',deseason=TRUE,dec.place=4,
                    shade='white',fontsize=14,ylab='T',type='monsoon')
## Temperature island
CA0038T <- TheilSen(selectByDate(CA0038,year=2003:2013),statistic = 'median',
                    pollutant='T_met',main='WMKP',deseason=TRUE,dec.place=4,
                    shade='white',fontsize=14,ylab='T',type='monsoon')

## Wind speed mainland
CA0003ws <- TheilSen(selectByDate(CA0003,year=2003:2013),statistic = 'median',
                    pollutant='ws',main='WMKB',deseason=TRUE,dec.place=4,
                    shade='white',fontsize=14,ylab='WS',type='monsoon')
## Wind speed island
CA0038ws <- TheilSen(selectByDate(CA0038,year=2003:2013),statistic = 'median',
                    pollutant='ws',main='WMKP',deseason=TRUE,dec.place=4,
                    shade='white',fontsize=14,ylab='WS',type='monsoon')

## RH mainland
CA0003RH <- TheilSen(selectByDate(CA0003,year=2003:2013),statistic = 'median',
                     pollutant='ws',main='WMKB',deseason=TRUE,dec.place=4,
                     shade='white',fontsize=14,ylab='RH',type='monsoon')
## RH island
CA0038RH <- TheilSen(selectByDate(CA0038,year=2003:2013),statistic = 'median',
                     pollutant='ws',main='WMKP',deseason=TRUE,dec.place=4,
                     shade='white',fontsize=14,ylab='RH',type='monsoon')

## WD mainland
CA0003wd <- TheilSen(selectByDate(CA0003,year=2003:2013),statistic = 'median',
                     pollutant='wd',main='WMKB',deseason=TRUE,dec.place=4,
                     shade='white',fontsize=14,ylab='WD',type='monsoon')
## WD island
CA0038wd <- TheilSen(selectByDate(CA0038,year=2003:2013),statistic = 'median',
                     pollutant='wd',main='WMKP',deseason=TRUE,dec.place=4,
                     shade='white',fontsize=14,ylab='WD',type='monsoon')

## Results: basically, there are no yearly changes in T, RH, WS, and WD from 2003-2013


