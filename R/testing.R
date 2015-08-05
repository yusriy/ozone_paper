timePlot(selectByDate(CA0003,start='1/1/1999',end='1/1/2013'),pollutant=c('o3','T_met'),
         avg.time='month',data.thresh=5,smooth=T,ylim=list(c(0.005,0.025),c(25,29)),key=F)
timePlot(selectByDate(CA0009,start='1/1/1999',end='1/1/2013'),pollutant=c('o3','T_met'),
         avg.time='month',data.thresh=5,smooth=T,ylim=list(c(0.005,0.025),c(25,29)),key=F)
timePlot(selectByDate(CA0038,start='1/1/1999',end='1/1/2013'),pollutant=c('o3','T_met'),
         avg.time='month',data.thresh=5,smooth=T,ylim=list(c(0.005,0.025),c(25,29)),key=F)


# Plot maps
load(url('http://www.erg.kcl.ac.uk/downloads/Policy_reports/AQdata/o3Measurements.RData'))
head(o3Measurements)
load(url('http://www.erg.kcl.ac.uk/downloads/Policy_reports/AQdata/siteDetails.RData'))

library(plyr)

o3Measurements<-cutData(o3Measurements,'season')
annual <- ddply(o3Measurements,.(site),numcolwise(mean),na.rm=TRUE)
means <- ddply(o3Measurements,.(site,season),numcolwise(mean),na.rm=TRUE)
peaks <- ddply(o3Measurements,.(site,season),numcolwise(max),na.rm=TRUE)
annual <- merge(annual,siteDetails,by='site')
means <- merge(means,siteDetails, by='site')
peaks<-merge(peaks,siteDetails,by='site')

GoogleMapsPlot(annual,lat='latitude',long='longitude',pollutant='o3',maptype='roadmap',
               col='jet')

# Example
timePlot(selectByDate(CA0003, start = "1/1/2003", end = "1/1/2007"),
         pollutant = c("T_met",'RH_met','ws','wd'),avg.time="month",data.thresh = 5,
         key=FALSE,name.pol=c(expression(paste("T (",degree,'C)')),'RH (%)',
                              expression(paste('WS (m s'^'-1',')')),
                              expression(paste('WD (',degree,')'))),
         ylim=list(c(26,30),c(60,90),c(0,3),c(0,360)),
         date.format="%Y",date.breaks=6,y.relation="free",
         ylab = "WMKB",
         smooth=F,lwd = 1,col = c("grey30",'grey30','grey30','grey30'),
         lty = c(1,1,1,1),fontsize=16) 