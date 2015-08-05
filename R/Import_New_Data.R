##### Ozone and temperature study in Penang Island #####
# Authors: Yusri Yusup, Chia Yuin Ling
# Date created: 2015-05-22
# Version: 1.1
# NOTE: Only 2 years of NO and NOx data available for
# station ID: CA0038 USM 2000 and 2001 in the original
# dataset.
#########################################################

library(plyr)
library(openair)

#### 1. Import data #####################################

#### 1a. Import data Station ID: CA0003, Seberang Perai #### 
## From year 1995 until 2013
## Data obtained from ASMA (Alam Sekitar Malaysia) and NOAA (National Oceanic
## and Atmospheric Administration). The original data is in the 'data/csv_format' 
## folder


CA0003_1995 <- read.csv("data/csv_format/CA0003_1995.csv")
CA0003_1996 <- read.csv("data/csv_format/CA0003_1996.csv")
CA0003_1997 <- read.csv("data/csv_format/CA0003_1997.csv")
CA0003_1998 <- read.csv("data/csv_format/CA0003_1998.csv")
CA0003_1999 <- read.csv("data/csv_format/CA0003_1999.csv")
CA0003_2000 <- read.csv("data/csv_format/CA0003_2000.csv")
CA0003_2001 <- read.csv("data/csv_format/CA0003_2001.csv")
CA0003_2002 <- read.csv("data/csv_format/CA0003_2002.csv")
CA0003_2003 <- read.csv("data/csv_format/CA0003_2003.csv")
CA0003_2004 <- read.csv("data/csv_format/CA0003_2004.csv")
CA0003_2005 <- read.csv("data/csv_format/CA0003_2005.csv")
CA0003_2006 <- read.csv("data/csv_format/CA0003_2006.csv")
CA0003_2007 <- read.csv("data/csv_format/CA0003_2007.csv")
CA0003_2008 <- read.csv("data/csv_format/CA0003_2008.csv")
CA0003_2009 <- read.csv("data/csv_format/CA0003_2009.csv")
CA0003_2010 <- read.csv("data/csv_format/CA0003_2010.csv")
CA0003_2011 <- read.csv("data/csv_format/CA0003_2011.csv")
CA0003_2012 <- read.csv("data/csv_format/CA0003_2012.csv")
CA0003_2013 <- read.csv("data/csv_format/CA0003_2013.csv")

# Remove unwanted column
CA0003_1995 <- CA0003_1995[,-1]
CA0003_1996 <- CA0003_1996[,-1]
CA0003_1997 <- CA0003_1997[,-1]
CA0003_1998 <- CA0003_1998[,-1]
CA0003_1999 <- CA0003_1999[,-1]
CA0003_2000 <- CA0003_2000[,-1]
CA0003_2011 <- CA0003_2011[,-1]

# rbind data to one data frame
CA0003 <- rbind(CA0003_1995,CA0003_1996,CA0003_1997,CA0003_1998,CA0003_1999,CA0003_2000,CA0003_2001,CA0003_2002,CA0003_2003,CA0003_2004,CA0003_2005,CA0003_2006,CA0003_2007,CA0003_2008,CA0003_2009,CA0003_2010,CA0003_2011,CA0003_2012,CA0003_2013)

#### 1b. Import data Station ID: CA0009, Seberang Jaya II #### 
## From year 1996 until 2013

CA0009_1996 <- read.csv("data/csv_format/CA0009_1996.csv")
CA0009_1997 <- read.csv("data/csv_format/CA0009_1997.csv")
CA0009_1998 <- read.csv("data/csv_format/CA0009_1998.csv")
CA0009_1999 <- read.csv("data/csv_format/CA0009_1999.csv")
CA0009_2000 <- read.csv("data/csv_format/CA0009_2000.csv")
CA0009_2001 <- read.csv("data/csv_format/CA0009_2001.csv")
CA0009_2002 <- read.csv("data/csv_format/CA0009_2002.csv")
CA0009_2003 <- read.csv("data/csv_format/CA0009_2003.csv")
CA0009_2004 <- read.csv("data/csv_format/CA0009_2004.csv")
CA0009_2005 <- read.csv("data/csv_format/CA0009_2005.csv")
CA0009_2006 <- read.csv("data/csv_format/CA0009_2006.csv")
CA0009_2007 <- read.csv("data/csv_format/CA0009_2007.csv")
CA0009_2008 <- read.csv("data/csv_format/CA0009_2008.csv")
CA0009_2009 <- read.csv("data/csv_format/CA0009_2009.csv")
CA0009_2010 <- read.csv("data/csv_format/CA0009_2010.csv")
CA0009_2011 <- read.csv("data/csv_format/CA0009_2011.csv")
CA0009_2012 <- read.csv("data/csv_format/CA0009_2012.csv")
CA0009_2013 <- read.csv("data/csv_format/CA0009_2013.csv")

# Remove unwanted column
# Only the years below does not have 'Site ID'
CA0009_1996 <- CA0009_1996[,-1]
CA0009_1997 <- CA0009_1997[,-1]
CA0009_1998 <- CA0009_1998[,-1]
CA0009_1999 <- CA0009_1999[,-1]
CA0009_2000 <- CA0009_2000[,-1]
CA0009_2011 <- CA0009_2011[,-1]

#### rbind data
CA0009 <- rbind(CA0009_1996,CA0009_1997,CA0009_1998,CA0009_1999,CA0009_2000,CA0009_2001,CA0009_2002,CA0009_2003,CA0009_2004,CA0009_2005,CA0009_2006,CA0009_2007,CA0009_2008,CA0009_2009,CA0009_2010,CA0009_2011,CA0009_2012,CA0009_2013)

#### 1c. Import data Station ID: CA0038, USM #### 
## From year 1998 until 2013

CA0038_1998 <- read.csv("data/csv_format/CA0038_1998.csv")
CA0038_1999 <- read.csv("data/csv_format/CA0038_1999.csv")
CA0038_2000 <- read.csv("data/csv_format/CA0038_2000.csv")
CA0038_2001 <- read.csv("data/csv_format/CA0038_2001.csv")
CA0038_2002 <- read.csv("data/csv_format/CA0038_2002.csv")
CA0038_2003 <- read.csv("data/csv_format/CA0038_2003.csv")
CA0038_2004 <- read.csv("data/csv_format/CA0038_2004.csv")
CA0038_2005 <- read.csv("data/csv_format/CA0038_2005.csv")
CA0038_2006 <- read.csv("data/csv_format/CA0038_2006.csv")
CA0038_2007 <- read.csv("data/csv_format/CA0038_2007.csv")
CA0038_2008 <- read.csv("data/csv_format/CA0038_2008.csv")
CA0038_2009 <- read.csv("data/csv_format/CA0038_2009.csv")
CA0038_2010 <- read.csv("data/csv_format/CA0038_2010.csv")
CA0038_2011 <- read.csv("data/csv_format/CA0038_2011.csv")
CA0038_2012 <- read.csv("data/csv_format/CA0038_2012.csv")
CA0038_2013 <- read.csv("data/csv_format/CA0038_2013.csv")

# Remove unwanted column; there are some extra columns for the years below
# Year 1998
CA0038_1998 <- CA0038_1998[,-c(1,16,17)]

# Year 1999
CA0038_1999 <- CA0038_1999[,-c(1,16,17)]

# Year 2000, need to remove NO and NOx column
CA0038_2000 <- CA0038_2000[,-c(1,10,11)]
API_Main <- rep(NA,nrow(CA0038_2000))
CA0038_2000 <- cbind(CA0038_2000,API_Main)
rm(API_Main)

# Year 2001
CA0038_2001 <- CA0038_2001[,-c(9,10)]
API_Main <- rep(NA,nrow(CA0038_2001))
CA0038_2001 <- cbind(CA0038_2001,API_Main)
rm(API_Main)

#### rbind data
CA0038 <- rbind(CA0038_1998,CA0038_1999,CA0038_2000,
                CA0038_2001,CA0038_2002,CA0038_2003,CA0038_2004,CA0038_2005,
                CA0038_2006,CA0038_2007,CA0038_2008,CA0038_2009,CA0038_2010,
                CA0038_2011,CA0038_2012,CA0038_2013)

#### 1d. Cleaning up ####################################

rm(list=ls(pattern='CA0003_'))
rm(list=ls(pattern='CA0009_'))
rm(list=ls(pattern='CA0038_'))

#### 1e. Reformat data from factors to numerics ##########

# Change hourly wind speed
CA0003$Ws_hourly_avg <- as.character(CA0003$Ws_hourly_avg)
CA0009$Ws_hourly_avg <- as.character(CA0009$Ws_hourly_avg)
CA0038$Ws_hourly_avg <- as.character(CA0038$Ws_hourly_avg)
CA0003$Ws_hourly_avg <- as.numeric(CA0003$Ws_hourly_avg)
CA0009$Ws_hourly_avg <- as.numeric(CA0009$Ws_hourly_avg)
CA0038$Ws_hourly_avg <- as.numeric(CA0038$Ws_hourly_avg)

# Change hourly wind direction
CA0003$Wd_hourly_avg <- as.character(CA0003$Wd_hourly_avg)
CA0009$Wd_hourly_avg <- as.character(CA0009$Wd_hourly_avg)
CA0038$Wd_hourly_avg <- as.character(CA0038$Wd_hourly_avg)
CA0003$Wd_hourly_avg <- as.numeric(CA0003$Wd_hourly_avg)
CA0009$Wd_hourly_avg <- as.numeric(CA0009$Wd_hourly_avg)
CA0038$Wd_hourly_avg <- as.numeric(CA0038$Wd_hourly_avg)

# Change ambient temperature
CA0003$Amb_temp_hourly_avg <- as.character(CA0003$Amb_temp_hourly_avg)
CA0009$Amb_temp_hourly_avg <- as.character(CA0009$Amb_temp_hourly_avg)
CA0038$Amb_temp_hourly_avg <- as.character(CA0038$Amb_temp_hourly_avg)
CA0003$Amb_temp_hourly_avg <- as.numeric(CA0003$Amb_temp_hourly_avg)
CA0009$Amb_temp_hourly_avg <- as.numeric(CA0009$Amb_temp_hourly_avg)
CA0038$Amb_temp_hourly_avg <- as.numeric(CA0038$Amb_temp_hourly_avg)

# Change humidity
CA0003$Humidity_hourly_avg <- as.character(CA0003$Humidity_hourly_avg)
CA0009$Humidity_hourly_avg <- as.character(CA0009$Humidity_hourly_avg)
CA0038$Humidity_hourly_avg <- as.character(CA0038$Humidity_hourly_avg)
CA0003$Humidity_hourly_avg <- as.numeric(CA0003$Humidity_hourly_avg)
CA0009$Humidity_hourly_avg <- as.numeric(CA0009$Humidity_hourly_avg)
CA0038$Humidity_hourly_avg <- as.numeric(CA0038$Humidity_hourly_avg)

# Change SO2
CA0003$So2_hourly_avg <- as.character(CA0003$So2_hourly_avg)
CA0009$So2_hourly_avg <- as.character(CA0009$So2_hourly_avg)
CA0038$So2_hourly_avg <- as.character(CA0038$So2_hourly_avg)
CA0003$So2_hourly_avg <- as.numeric(CA0003$So2_hourly_avg)
CA0009$So2_hourly_avg <- as.numeric(CA0009$So2_hourly_avg)
CA0038$So2_hourly_avg <- as.numeric(CA0038$So2_hourly_avg)

# Change NO2
CA0003$No2_hourly_avg <- as.character(CA0003$No2_hourly_avg)
CA0009$No2_hourly_avg <- as.character(CA0009$No2_hourly_avg)
CA0038$No2_hourly_avg <- as.character(CA0038$No2_hourly_avg)
CA0003$No2_hourly_avg <- as.numeric(CA0003$No2_hourly_avg)
CA0009$No2_hourly_avg <- as.numeric(CA0009$No2_hourly_avg)
CA0038$No2_hourly_avg <- as.numeric(CA0038$No2_hourly_avg)

# Change O3
CA0003$O3_hourly_avg <- as.character(CA0003$O3_hourly_avg)
CA0009$O3_hourly_avg <- as.character(CA0009$O3_hourly_avg)
CA0038$O3_hourly_avg <- as.character(CA0038$O3_hourly_avg)
CA0003$O3_hourly_avg <- as.numeric(CA0003$O3_hourly_avg)
CA0009$O3_hourly_avg <- as.numeric(CA0009$O3_hourly_avg)
CA0038$O3_hourly_avg <- as.numeric(CA0038$O3_hourly_avg)

# Change CO
CA0003$Co_hourly_avg <- as.character(CA0003$Co_hourly_avg)
CA0009$Co_hourly_avg <- as.character(CA0009$Co_hourly_avg)
CA0038$Co_hourly_avg <- as.character(CA0038$Co_hourly_avg)
CA0003$Co_hourly_avg <- as.numeric(CA0003$Co_hourly_avg)
CA0009$Co_hourly_avg <- as.numeric(CA0009$Co_hourly_avg)
CA0038$Co_hourly_avg <- as.numeric(CA0038$Co_hourly_avg)

# Change PM10
CA0003$Pm10_hourly_avg <- as.character(CA0003$Pm10_hourly_avg)
CA0009$Pm10_hourly_avg <- as.character(CA0009$Pm10_hourly_avg)
CA0038$Pm10_hourly_avg <- as.character(CA0038$Pm10_hourly_avg)
CA0003$Pm10_hourly_avg <- as.numeric(CA0003$Pm10_hourly_avg)
CA0009$Pm10_hourly_avg <- as.numeric(CA0009$Pm10_hourly_avg)
CA0038$Pm10_hourly_avg <- as.numeric(CA0038$Pm10_hourly_avg)

# Change API main
CA0003$API_Main <- as.character(CA0003$API_Main)
CA0009$API_Main <- as.character(CA0009$API_Main)
CA0038$API_Main <- as.character(CA0038$API_Main)
CA0003$API_Main <- as.numeric(CA0003$API_Main)
CA0009$API_Main <- as.numeric(CA0009$API_Main)
CA0038$API_Main <- as.numeric(CA0038$API_Main)

####
#CA0038$Nox_hourly_avg <- as.character(CA0038$Nox_hourly_avg)
#CA0038$Nox_hourly_avg <- as.numeric(CA0038$Nox_hourly_avg)
####
#CA0038$No_hourly_avg <- as.character(CA0038$No_hourly_avg)
#CA0038$No_hourly_avg <- as.numeric(CA0038$No_hourly_avg)

#### 1f. Reformat date and time ####################
# Change all Time data to 4 digit
# E.g., 100 to 0100
CA0003$Time <- formatC(CA0003$Time, width = 4, flag = '0')
CA0009$Time <- formatC(CA0009$Time, width = 4, flag = '0')
CA0038$Time <- formatC(CA0038$Time, width = 4, flag = '0')


# Add colons to all Time data
# E.g., 0100 to 01:00
CA0003$Time <- gsub("(..)\\B", "\\1:", CA0003$Time)
CA0009$Time <- gsub("(..)\\B", "\\1:", CA0009$Time)
CA0038$Time <- gsub("(..)\\B", "\\1:", CA0038$Time)

# Reformatting Date and Time data
CA0003 <- transform(CA0003, Date_Time=as.POSIXct(paste(Date, Time), format="%Y%m%d %H:%M"))
CA0009 <- transform(CA0009, Date_Time=as.POSIXct(paste(Date, Time), format="%Y%m%d %H:%M"))
CA0038 <- transform(CA0038, Date_Time=as.POSIXct(paste(Date, Time), format="%Y%m%d %H:%M"))

# Remove unwanted columns and rearrange columns: the time and date columns
# and moving the timestamps to the front
# CA0003
CA0003 <- CA0003[,-c(3,4)]
CA0003 <- CA0003[,c(1,2,13,3,4,5,6,7,8,9,10,11,12)]
# CA0009
CA0009 <- CA0009[,-c(3,4)]
CA0009 <- CA0009[,c(1,2,13,3,4,5,6,7,8,9,10,11,12)]
# CA0038
CA0038 <- CA0038[,-c(3,4)]
CA0038 <- CA0038[,c(1,2,13,3,4,5,6,7,8,9,10,11,12)]

#### 1g. Import Penang International Airport data WMKP (486010) ##############

df1995_1999 <- read.csv("data/csv_format/1995_1999_V2.csv")
df2000_2009 <- read.csv("data/csv_format/2000_2009_V2.csv")
df2010_2013 <- read.csv("data/csv_format/2010_2013_V2.csv")

#### Row bind data
dfNew <- rbind(df1995_1999,df2000_2009,df2010_2013)

#### Reformat date and time
a <- gsub("(........)\\B","\\1 ",dfNew$YR..MODAHRMN)
b <- strsplit(a," ")
c <- ldply(b)
d <- as.integer(c$V1)
e <- as.integer(c$V2)
f <- formatC(e, width = 4, flag = '0')
Time_Stamp <- as.POSIXct(paste(d,f),format="%Y%m%d %H%M")
dfNew$YR..MODAHRMN <- Time_Stamp

#### Reformat temperature and change the unit from deg F to deg C (TEMP)
dfNew$TEMP <- as.character(dfNew$TEMP)
dfNew$TEMP <- as.numeric(dfNew$TEMP)
dfNew$TEMP <- ((dfNew$TEMP) - 32) / 1.8

#### Reformat wind speed and change unit from ??? to m s-1 (SPD)
dfNew$SPD <- as.character(dfNew$SPD)
dfNew$SPD <- as.numeric(dfNew$SPD)
dfNew$SPD <- (dfNew$SPD) * 0.44704 # Factor to change from ??? to m s-1

#### Reformat wind direction data (DIR)
dfNew$DIR <- as.character(dfNew$DIR)
dfNew$DIR <- as.numeric(dfNew$DIR)

#### Reformat visibility data (VSB)
dfNew$VSB <- as.character(dfNew$VSB)
dfNew$VSB <- as.numeric(dfNew$VSB)

#### Reformat sea level pressure (SLP)
dfNew$SLP <- as.character(dfNew$SLP)
dfNew$SLP <- as.numeric(dfNew$SLP)

#### Reformat dew point temperature (DEWP)
dfNew$DEWP <- as.character(dfNew$DEWP)
dfNew$DEWP <- as.numeric(dfNew$DEWP)
dfNew$DEWP <- ((dfNew$DEWP) - 32) / 1.8

#### Calculate RH from T_met and Tdew_met
RH_met <- 100 * (exp((17.625 * dfNew$DEWP)/(243.04 + dfNew$DEWP))/
                   exp((17.625 * dfNew$TEMP)/(243.04 + dfNew$TEMP)))

#### Extract desired columns
df486010 <- data.frame(dfNew)
df486010 <- as.data.frame(dfNew[,1])
df486010 <- cbind(df486010,dfNew$YR..MODAHRMN,dfNew$SPD,dfNew$DIR,dfNew$TEMP,
                  dfNew$SKC,dfNew$VSB,dfNew$SLP,dfNew$DEWP,RH_met)

#### Rename headers
names(df486010)[1] <- "siteID"
names(df486010)[2] <- "Date_Time"
names(df486010)[3] <- "WS_met" # m s-1
names(df486010)[4] <- "WD_met" # deg
names(df486010)[5] <- "T_met" # deg C
names(df486010)[6] <- "Cloud_met" # Factor
names(df486010)[7] <- "visib_met" # km
names(df486010)[8] <- "press_met" # kPa
names(df486010)[9] <- "Tdew_met" # deg C

#### Merge data by time stamp and some data will be lost.
#CA0003 <- merge(CA0003, df486010, by=c("Date_Time","Date_Time")) # Should be combined with WMKB Butterworth station
#CA0009 <- merge(CA0009, df486010, by=c("Date_Time","Date_Time")) # Should be combined with WMKB Butterworth station
CA0038 <- merge(CA0038, df486010, by=c("Date_Time","Date_Time"))

### Delete temporary variables
#rm(a,b,c,d,e,f,Time_Stamp,dfNew,df486010,df1995_1999,df2000_2009,df2010_2013,RH_met)

#### 1h. Import Butterworth station WMKB (486020) ##############

df1995_1999 <- read.csv("data/Butterworth/CSV/1995-1999.csv")
df2000_2009 <- read.csv("data/Butterworth/CSV/2000-2009.csv")
df2010_2013 <- read.csv("data/Butterworth/CSV/2010-2013.csv")

#### Row bind data
dfNew <- rbind(df1995_1999,df2000_2009,df2010_2013)

#### Reformat date and time
a <- gsub("(........)\\B","\\1 ",dfNew$YR..MODAHRMN)
b <- strsplit(a," ")
c <- ldply(b)
d <- as.integer(c$V1)
e <- as.integer(c$V2)
f <- formatC(e, width = 4, flag = '0')
Time_Stamp <- as.POSIXct(paste(d,f),format="%Y%m%d %H%M")
dfNew$YR..MODAHRMN <- Time_Stamp

#### Reformat temperature and change the unit from deg F to deg C (TEMP)
dfNew$TEMP <- as.character(dfNew$TEMP)
dfNew$TEMP <- as.numeric(dfNew$TEMP)
dfNew$TEMP <- ((dfNew$TEMP) - 32) / 1.8

#### Reformat wind speed and change unit from ??? to m s-1 (SPD)
dfNew$SPD <- as.character(dfNew$SPD)
dfNew$SPD <- as.numeric(dfNew$SPD)
dfNew$SPD <- (dfNew$SPD) * 0.44704 # Factor to change from ??? to m s-1

#### Reformat wind direction data (DIR)
dfNew$DIR <- as.character(dfNew$DIR)
dfNew$DIR <- as.numeric(dfNew$DIR)

#### Reformat visibility data (VSB)
dfNew$VSB <- as.character(dfNew$VSB)
dfNew$VSB <- as.numeric(dfNew$VSB)

#### Reformat sea level pressure (SLP)
dfNew$SLP <- as.character(dfNew$SLP)
dfNew$SLP <- as.numeric(dfNew$SLP)

#### Reformat dew point temperature (DEWP)
dfNew$DEWP <- as.character(dfNew$DEWP)
dfNew$DEWP <- as.numeric(dfNew$DEWP)
dfNew$DEWP <- ((dfNew$DEWP) - 32) / 1.8

#### Calculate RH from T_met and Tdew_met
RH_met <- 100 * (exp((17.625 * dfNew$DEWP)/(243.04 + dfNew$DEWP))/
                   exp((17.625 * dfNew$TEMP)/(243.04 + dfNew$TEMP)))

#### Extract desired columns
df486020 <- data.frame(dfNew)
df486020 <- as.data.frame(dfNew[,1])
df486020 <- cbind(df486020,dfNew$YR..MODAHRMN,dfNew$SPD,dfNew$DIR,dfNew$TEMP,
                  dfNew$SKC,dfNew$VSB,dfNew$SLP,dfNew$DEWP,RH_met)

#### Rename headers
names(df486020)[1] <- "siteID"
names(df486020)[2] <- "Date_Time"
names(df486020)[3] <- "WS_met" # m s-1
names(df486020)[4] <- "WD_met" # deg
names(df486020)[5] <- "T_met" # deg C
names(df486020)[6] <- "Cloud_met" # Factor
names(df486020)[7] <- "visib_met" # km
names(df486020)[8] <- "press_met" # kPa
names(df486020)[9] <- "Tdew_met" # deg C

#### Merge data by time stamp and some data will be lost.
CA0003 <- merge(CA0003, df486020, by=c("Date_Time","Date_Time")) 
CA0009 <- merge(CA0009, df486020, by=c("Date_Time","Date_Time")) 
#CA0038 <- merge(CA0038, df486010, by=c("Date_Time","Date_Time"))

### Delete temporary variables
rm(a,b,c,d,e,f,Time_Stamp,dfNew,df486010,df486020,
   df1995_1999,df2000_2009,df2010_2013,RH_met)

#### 2. Data filtering ##############################

#### Wind direction WD_met
# Cannot be more than 360 deg
CA0003$WD_met[which(CA0003$WD_met > 360)] <- NA
CA0009$WD_met[which(CA0009$WD_met > 360)] <- NA
CA0038$WD_met[which(CA0038$WD_met > 360)] <- NA

#### Wind speed WS_met
# A blanket condition to remove all wind speeds > 10 m/s, usually outliers
CA0003$WS_met[which(CA0003$WS_met > 10)] <- NA
CA0009$WS_met[which(CA0009$WS_met > 10)] <- NA
CA0038$WS_met[which(CA0038$WS_met > 10)] <- NA

#### Temperature T_met
# A blanket condition to remove all Temperature < 10 deg C, usually outliers
CA0003$T_met[which(CA0003$T_met < 10)] <- NA
CA0009$T_met[which(CA0009$T_met < 10)] <- NA
CA0038$T_met[which(CA0038$T_met < 10)] <- NA

#### Pressure press_met
# A blanket condition to remove all pressure > 1020 hPa, usually outliers
CA0003$press_met[which(CA0003$press_met > 1020)] <- NA
CA0009$press_met[which(CA0009$press_met > 1020)] <- NA
CA0038$press_met[which(CA0038$press_met > 1020)] <- NA

#### Dew point temperature Tdew_met
# A blanket condition to remove all pressure > 1020 hPa, usually outliers
CA0003$Tdew_met[which(CA0003$Tdew_met < 10)] <- NA
CA0009$Tdew_met[which(CA0009$Tdew_met < 10)] <- NA
CA0038$Tdew_met[which(CA0038$Tdew_met < 10)] <- NA

#### Rename headers to be used with the package 'openair'
names(CA0003)[1] <- 'date'
names(CA0009)[1] <- 'date'
names(CA0038)[1] <- 'date'

names(CA0003)[8] <- 'so2'
names(CA0009)[8] <- 'so2'
names(CA0038)[8] <- 'so2'

names(CA0003)[9] <- 'no2'
names(CA0009)[9] <- 'no2'
names(CA0038)[9] <- 'no2'

names(CA0003)[10] <- 'o3'
names(CA0009)[10] <- 'o3'
names(CA0038)[10] <- 'o3'

names(CA0003)[11] <- 'co'
names(CA0009)[11] <- 'co'
names(CA0038)[11] <- 'co'

names(CA0003)[12] <- 'pm10'
names(CA0009)[12] <- 'pm10'
names(CA0038)[12] <- 'pm10'

names(CA0003)[15] <- 'ws'
names(CA0009)[15] <- 'ws'
names(CA0038)[15] <- 'ws'

names(CA0003)[16] <- 'wd'
names(CA0009)[16] <- 'wd'
names(CA0038)[16] <- 'wd'

##### 3. Converting to 8 hour averages ###############

## Maximum 8 hour value, NOTE: date had been converted to GMT from local time.
## Need to convert back if necessary by adding 8 hours = 8 * 60 * 60 = 28800 s
## E.g., CA0038_8h$date <- CA0038_8h$date + 28800
CA0003_8h <- timeAverage(CA0003,avg.time='8 hour',statistic='max')
CA0009_8h <- timeAverage(CA0009,avg.time='8 hour',statistic='max')
CA0038_8h <- timeAverage(CA0038,avg.time='8 hour',statistic='max')

CA0003_8h$date <- CA0003_8h$date + 28800
CA0009_8h$date <- CA0009_8h$date + 28800
CA0038_8h$date <- CA0038_8h$date + 28800

## Yearly average for testing purposes
CA0003_1y <- timeAverage(CA0003,avg.time='1 year',statistic='mean')
CA0009_1y <- timeAverage(CA0009,avg.time='1 year',statistic='mean')
CA0038_1y <- timeAverage(CA0038,avg.time='1 year',statistic='mean')
##


