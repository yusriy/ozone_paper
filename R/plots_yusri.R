## Plotting scripts for ozone analyses
##
## Author: Yusri Yusup
## Date created: 2015-08-05

#### Load packages/libraries ####
library(openair)
library(mapdata) # To use hi-res map data

### Fig. 2 Monthly averaging met time-series (Mainland) ##### 
## Plot of temperature, RH, wind speed, wind direction
jpeg(file="figs/paper_figs/F2_WMKB_temp_RH.jpg",width=1800,height=3060,res=360, quality=50)
## Mainland
timePlot(selectByDate(CA0003, start = "1/1/1999", end = "1/1/2013"),
         pollutant = c("T_met",'RH_met','ws','wd'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c(expression(paste("T (",degree,'C)')),'RH (%)',
                              expression(paste('WS (m s'^'-1',')')),
                              expression(paste('WD (',degree,')'))),
         ylim=list(c(26,30),c(60,90),c(0,3),c(0,360)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = "WMKB (mainland)",
         smooth=F,lwd = 1,col = c("grey30",'grey30','grey30','grey30'),
         lty = c(1,1,1,1),fontsize=16) 

dev.off()

### Fig. 2 Monthly averaging met time-series (Island) ##### 
## Plot of temperature, RH, wind speed, wind direction
jpeg(file="figs/paper_figs/F2_WMKP_temp_RH.jpg",width=1800,height=3060,res=360, quality=50)
## Island
timePlot(selectByDate(CA0038, start = "1/1/1999", end = "1/1/2013"),
         pollutant = c("T_met",'RH_met','ws','wd'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c(expression(paste("T (",degree,'C)')),'RH (%)',
                              expression(paste('WS (m s'^'-1',')')),
                              expression(paste('WD (',degree,')'))),
         ylim=list(c(26,30),c(60,90),c(0,3),c(0,360)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = 'WMKP (island)',
         smooth=F,lwd = 1,col = c("grey30",'grey30','grey30','grey30'),
         lty = c(1,1,1,1),fontsize=16) 
dev.off()
# Just in case i want to use it later
#ylab = expression(paste( "WMKP: WD (",degree,'), WS (m s'^'-1',"), RH (%), ","T (",degree,"C)"))

### Fig. 3 Monthly averaging o3 and NOx time-series (Mainland) ##### 

jpeg(file="figs/paper_figs/F3_CA0003.jpg",width=1800,height=2000,res=360, quality=50)
## Mainland 1
# Temperature and RH (station)
timePlot(selectByDate(CA0003, start = "1/1/1999", end = "1/1/2013"),
         pollutant = c('o3','no2'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c('O3 (ppm)','NO2 (ppm)'),ylim=list(c(0.005,0.035),c(0,0.020)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = "CA0003 (mainland)",
         smooth=T,lwd = 1,col = c("grey30",'grey30'),
         lty = c(1,1),fontsize=16) 

dev.off()

jpeg(file="figs/paper_figs/F3_CA0009.jpg",width=1800,height=2000,res=360, quality=50)
## Mainland 2
# Temperature and RH (station)
timePlot(selectByDate(CA0009, start = "1/1/1999", end = "1/1/2013"),
         pollutant = c('o3','no2'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c('O3 (ppm)','NO2 (ppm)'),ylim=list(c(0.005,0.035),c(0,0.020)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = "CA0009 (mainland)",
         smooth=T,lwd = 1,col = c("grey30",'grey30'),
         lty = c(1,1),fontsize=16) 

dev.off()

### Fig. 3 Monthly averaging o3 and NOx time-series (Island) ##### 
jpeg(file="figs/paper_figs/F3_CA0038.jpg",width=1800,height=2000,res=360, quality=50)
## Island
# Temperature and RH (station)
timePlot(selectByDate(CA0038, start = "1/1/1999", end = "1/1/2013"),
         pollutant = c("o3",'no2'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c("O3 (ppm)",'NO2 (ppm)'),ylim=list(c(0.005,0.035),c(0,0.020)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = 'CA0038 (island)',
         smooth=T,lwd = 1,col = c("grey30",'grey30'),
         lty = c(1,1),fontsize=16) 
dev.off()

### Fig. 3a Wind rose (WMKB) ####
jpeg(file="figs/paper_figs/F3a_CA0003windrose.jpg",width=1800,height=2400,
     res=360, quality=50)
par(mar=c(1,1,1,1))
windRose(CA0003,ws='ws',wd='wd',paddle=FALSE,type='monsoon',fontsize=16,key=TRUE,
         grid.line=10,breaks=c(0,2,4,6,8,10), key.footer = expression('WS, m s'^'-1'),
         annotate=FALSE,angle.scale=135,main='WMKB (mainland)',
         par.settings=list(layout.heights=list(top.padding=-1, bottom.padding=-1)))
dev.off()

### Fig. 3b Wind rose ####
jpeg(file="figs/paper_figs/F3b_CA0038windrose.jpg",width=1800,height=2400,
     res=360, quality=50)
windRose(CA0038,ws='ws',wd='wd',paddle=FALSE,type='monsoon',fontsize=16,key=TRUE,
         grid.line=10,breaks=c(0,2,4,6,8,10), key.footer = expression('WS, m s'^'-1'),
         annotate=FALSE,angle.scale=135,main='WMKP (island)',
         par.settings=list(layout.heights=list(top.padding=-1, bottom.padding=-1)))
dev.off()

#### Trajectory analysis ####
# 24-hour hourly back trajectory analysis from Jan-Dec 2013
# Import data first
# Import data, need to run run_hysplit first.

#trajPenang<-importTraj(site='penang',year=2013,local='./TrajProc/')

jpeg(file="figs/paper_figs/F4_trajA.jpg",width=3600,height=3600,
     res=360, quality=50)
# Plot frequency of sources
trajLevel(subset(trajPenang,lat > 0 & lat < 10 & lon > 95 & lon < 105),
          col='increment',orientation=c(90,90,0),method='hexbin',type='monsoon',
          projection='mercator',parameters=NULL,map.res='hires',grid.col='black',
          fontsize=16)
dev.off()
