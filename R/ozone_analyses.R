## Statistical tests and exploratory data analyses on the data
## 
## Author: Yusri Yusup
## Date created: 2015-08-05

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



