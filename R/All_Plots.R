#### install.packages("dplyr")
#### install.packages("Hmisc")
library(dplyr)
library(Hmisc)

#### Diurnal Plots
#### CA0003
data_group <- CA0003 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0003_daily.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour,data_group$mean_o3, lwd=2,
     type='l', xlab="", ylab="", ylim=range(0,0.04), axes=FALSE, frame.plot=TRUE)
polygon(c(data_group$hour, 
          rev(data_group$hour)),         
        c(data_group$pos_std_o3,
          rev(data_group$neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

#### CA0009
data_group <- CA0009 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0009_daily.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour,data_group$mean_o3, lwd=2,
     type='l', xlab="", ylab="", ylim=range(0,0.04), axes=FALSE, frame.plot=TRUE)
polygon(c(data_group$hour, 
          rev(data_group$hour)),         
        c(data_group$pos_std_o3,
          rev(data_group$neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

#### CA0038
data_group <- CA0038 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0038_daily.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour,data_group$mean_o3, lwd=2,
     type='l', xlab="", ylab="", ylim=range(0,0.04), axes=FALSE, frame.plot=TRUE)
polygon(c(data_group$hour, 
          rev(data_group$hour)),         
        c(data_group$pos_std_o3,
          rev(data_group$neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()


#### Weekend Ozone Effect
#### http://www.r-bloggers.com/box-plot-with-r-tutorial/

#### CA0003
data_group <- CA0003 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(day=format(as.POSIXlt(cut(date,breaks='day')),'%u'), #%u Weekday as a decimal number (1-7, Monday is 1)
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0003_weekly.png", width = 3060, height = 3060, res = 360)

layout(matrix(c(1,2,3,4,5,0,6,7,0),3,byrow=TRUE))
par(oma = c(4, 4, 0, 0))
par(mar = c(1, 2, 3.5, 0))

plot(data_group$hour[which(data_group$day=='1')],
     data_group$mean_o3[which(data_group$day=='1')],
     lwd=2,type='l',xlab='',ylab='',xaxs="i",ylim=range(-0.005,0.052),axes=FALSE,frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"a)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='1')], 
          rev(data_group$hour[which(data_group$day=='1')])),         
        c(data_group$pos_std_o3[which(data_group$day=='1')],
          rev(data_group$neg_std_o3[which(data_group$day=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='2')],
     data_group$mean_o3[which(data_group$day=='2')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"b)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='2')], 
          rev(data_group$hour[which(data_group$day=='2')])),         
        c(data_group$pos_std_o3[which(data_group$day=='2')],
          rev(data_group$neg_std_o3[which(data_group$day=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 1))
plot(data_group$hour[which(data_group$day=='3')],
     data_group$mean_o3[which(data_group$day=='3')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"c)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='3')], 
          rev(data_group$hour[which(data_group$day=='3')])),         
        c(data_group$pos_std_o3[which(data_group$day=='3')],
          rev(data_group$neg_std_o3[which(data_group$day=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='4')],
     data_group$mean_o3[which(data_group$day=='4')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"d)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='4')], 
          rev(data_group$hour[which(data_group$day=='4')])),         
        c(data_group$pos_std_o3[which(data_group$day=='4')],
          rev(data_group$neg_std_o3[which(data_group$day=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='5')],
     data_group$mean_o3[which(data_group$day=='5')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"e)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='5')], 
          rev(data_group$hour[which(data_group$day=='5')])),         
        c(data_group$pos_std_o3[which(data_group$day=='5')],
          rev(data_group$neg_std_o3[which(data_group$day=='5')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='6')],
     data_group$mean_o3[which(data_group$day=='6')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"f)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='6')], 
          rev(data_group$hour[which(data_group$day=='6')])),         
        c(data_group$pos_std_o3[which(data_group$day=='6')],
          rev(data_group$neg_std_o3[which(data_group$day=='6')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='7')],
     data_group$mean_o3[which(data_group$day=='7')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.004,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"g)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='7')], 
          rev(data_group$hour[which(data_group$day=='7')])),         
        c(data_group$pos_std_o3[which(data_group$day=='7')],
          rev(data_group$neg_std_o3[which(data_group$day=='7')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()

#### CA0009
data_group <- CA0009 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(day=format(as.POSIXlt(cut(date,breaks='day')),'%u'), #%u Weekday as a decimal number (1-7, Monday is 1)
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0009_weekly.png", width = 3060, height = 3060, res = 360)

layout(matrix(c(1,2,3,4,5,0,6,7,0),3,byrow=TRUE))
par(oma = c(4, 4, 0, 0))
par(mar = c(1, 2, 3.5, 0))

plot(data_group$hour[which(data_group$day=='1')],
     data_group$mean_o3[which(data_group$day=='1')],
     lwd=2,type='l',xlab='',ylab='',xaxs="i",ylim=range(-0.005,0.052),axes=FALSE,frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"a)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='1')], 
          rev(data_group$hour[which(data_group$day=='1')])),         
        c(data_group$pos_std_o3[which(data_group$day=='1')],
          rev(data_group$neg_std_o3[which(data_group$day=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='2')],
     data_group$mean_o3[which(data_group$day=='2')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"b)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='2')], 
          rev(data_group$hour[which(data_group$day=='2')])),         
        c(data_group$pos_std_o3[which(data_group$day=='2')],
          rev(data_group$neg_std_o3[which(data_group$day=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 1))
plot(data_group$hour[which(data_group$day=='3')],
     data_group$mean_o3[which(data_group$day=='3')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"c)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='3')], 
          rev(data_group$hour[which(data_group$day=='3')])),         
        c(data_group$pos_std_o3[which(data_group$day=='3')],
          rev(data_group$neg_std_o3[which(data_group$day=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='4')],
     data_group$mean_o3[which(data_group$day=='4')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"d)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='4')], 
          rev(data_group$hour[which(data_group$day=='4')])),         
        c(data_group$pos_std_o3[which(data_group$day=='4')],
          rev(data_group$neg_std_o3[which(data_group$day=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='5')],
     data_group$mean_o3[which(data_group$day=='5')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"e)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='5')], 
          rev(data_group$hour[which(data_group$day=='5')])),         
        c(data_group$pos_std_o3[which(data_group$day=='5')],
          rev(data_group$neg_std_o3[which(data_group$day=='5')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='6')],
     data_group$mean_o3[which(data_group$day=='6')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"f)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='6')], 
          rev(data_group$hour[which(data_group$day=='6')])),         
        c(data_group$pos_std_o3[which(data_group$day=='6')],
          rev(data_group$neg_std_o3[which(data_group$day=='6')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='7')],
     data_group$mean_o3[which(data_group$day=='7')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0021,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"g)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='7')], 
          rev(data_group$hour[which(data_group$day=='7')])),         
        c(data_group$pos_std_o3[which(data_group$day=='7')],
          rev(data_group$neg_std_o3[which(data_group$day=='7')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()

#### CA0038
data_group <- CA0038 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(day=format(as.POSIXlt(cut(date,breaks='day')),'%u'), #%u Weekday as a decimal number (1-7, Monday is 1)
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0038_weekly.png", width = 3060, height = 3060, res = 360)

layout(matrix(c(1,2,3,4,5,0,6,7,0),3,byrow=TRUE))
par(oma = c(4, 4, 0, 0))
par(mar = c(1, 2, 3.5, 0))

plot(data_group$hour[which(data_group$day=='1')],
     data_group$mean_o3[which(data_group$day=='1')],
     lwd=2,type='l',xlab='',ylab='',xaxs="i",ylim=range(-0.005,0.052),axes=FALSE,frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"a)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='1')], 
          rev(data_group$hour[which(data_group$day=='1')])),         
        c(data_group$pos_std_o3[which(data_group$day=='1')],
          rev(data_group$neg_std_o3[which(data_group$day=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='2')],
     data_group$mean_o3[which(data_group$day=='2')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"b)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='2')], 
          rev(data_group$hour[which(data_group$day=='2')])),         
        c(data_group$pos_std_o3[which(data_group$day=='2')],
          rev(data_group$neg_std_o3[which(data_group$day=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 1))
plot(data_group$hour[which(data_group$day=='3')],
     data_group$mean_o3[which(data_group$day=='3')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"c)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='3')], 
          rev(data_group$hour[which(data_group$day=='3')])),         
        c(data_group$pos_std_o3[which(data_group$day=='3')],
          rev(data_group$neg_std_o3[which(data_group$day=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='4')],
     data_group$mean_o3[which(data_group$day=='4')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"d)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='4')], 
          rev(data_group$hour[which(data_group$day=='4')])),         
        c(data_group$pos_std_o3[which(data_group$day=='4')],
          rev(data_group$neg_std_o3[which(data_group$day=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='5')],
     data_group$mean_o3[which(data_group$day=='5')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"e)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='5')], 
          rev(data_group$hour[which(data_group$day=='5')])),         
        c(data_group$pos_std_o3[which(data_group$day=='5')],
          rev(data_group$neg_std_o3[which(data_group$day=='5')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 2, 3.5, 0))
plot(data_group$hour[which(data_group$day=='6')],
     data_group$mean_o3[which(data_group$day=='6')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=1,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2,at=c(0,0.01,0.02,0.03,0.04,0.05),las=1, labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"f)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='6')], 
          rev(data_group$hour[which(data_group$day=='6')])),         
        c(data_group$pos_std_o3[which(data_group$day=='6')],
          rev(data_group$neg_std_o3[which(data_group$day=='6')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

par(mar = c(1, 0, 3.5, 0))
plot(data_group$hour[which(data_group$day=='7')],
     data_group$mean_o3[which(data_group$day=='7')],
     lwd=2,type='l',xlab='',ylab='',xaxs = "i",ylim=range(-0.005,0.052),axes=FALSE, frame.plot=TRUE)

abline(h=0.0062,lty=2)
axis(side=3,at=c(0,4,8,12,16,20,23), labels=TRUE,family="serif",cex.axis=1.6)
text(0.8,0.051,"g)",family="serif",cex=1.8)

polygon(c(data_group$hour[which(data_group$day=='7')], 
          rev(data_group$hour[which(data_group$day=='7')])),         
        c(data_group$pos_std_o3[which(data_group$day=='7')],
          rev(data_group$neg_std_o3[which(data_group$day=='7')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()


#### Monthly Plots

#### CA0003
data_group <- CA0003 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)


tiff("figs/CA0003_monthly.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(4,3))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='01')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='01')], 
          rev(data_group$hour[which(data_group$month=='01')])),         
        c(data_group$pos_std_o3[which(data_group$month=='01')],
          rev(data_group$neg_std_o3[which(data_group$month=='01')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"a)",family="serif",cex=1.8)


plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='02')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='02')], 
          rev(data_group$hour[which(data_group$month=='02')])),         
        c(data_group$pos_std_o3[which(data_group$month=='02')],
          rev(data_group$neg_std_o3[which(data_group$month=='02')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='03')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='03')], 
          rev(data_group$hour[which(data_group$month=='03')])),         
        c(data_group$pos_std_o3[which(data_group$month=='03')],
          rev(data_group$neg_std_o3[which(data_group$month=='03')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='04')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='04')], 
          rev(data_group$hour[which(data_group$month=='04')])),         
        c(data_group$pos_std_o3[which(data_group$month=='04')],
          rev(data_group$neg_std_o3[which(data_group$month=='04')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"d)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='05')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='05')], 
          rev(data_group$hour[which(data_group$month=='05')])),         
        c(data_group$pos_std_o3[which(data_group$month=='05')],
          rev(data_group$neg_std_o3[which(data_group$month=='05')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"e)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='06')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='06')], 
          rev(data_group$hour[which(data_group$month=='06')])),         
        c(data_group$pos_std_o3[which(data_group$month=='06')],
          rev(data_group$neg_std_o3[which(data_group$month=='06')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"f)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='07')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='07')], 
          rev(data_group$hour[which(data_group$month=='07')])),         
        c(data_group$pos_std_o3[which(data_group$month=='07')],
          rev(data_group$neg_std_o3[which(data_group$month=='07')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"g)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='08')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='08')], 
          rev(data_group$hour[which(data_group$month=='08')])),         
        c(data_group$pos_std_o3[which(data_group$month=='08')],
          rev(data_group$neg_std_o3[which(data_group$month=='08')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"h)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='09')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='09')], 
          rev(data_group$hour[which(data_group$month=='09')])),         
        c(data_group$pos_std_o3[which(data_group$month=='09')],
          rev(data_group$neg_std_o3[which(data_group$month=='09')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"i)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='10')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='10')], 
          rev(data_group$hour[which(data_group$month=='10')])),         
        c(data_group$pos_std_o3[which(data_group$month=='10')],
          rev(data_group$neg_std_o3[which(data_group$month=='10')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"j)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='11')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='11')], 
          rev(data_group$hour[which(data_group$month=='11')])),         
        c(data_group$pos_std_o3[which(data_group$month=='11')],
          rev(data_group$neg_std_o3[which(data_group$month=='11')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"k)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='12')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0456,lty=2)
polygon(c(data_group$hour[which(data_group$month=='12')], 
          rev(data_group$hour[which(data_group$month=='12')])),         
        c(data_group$pos_std_o3[which(data_group$month=='12')],
          rev(data_group$neg_std_o3[which(data_group$month=='12')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"l)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

#### CA0009
data_group <- CA0009 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0009_monthly.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(4,3))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='01')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='01')], 
          rev(data_group$hour[which(data_group$month=='01')])),         
        c(data_group$pos_std_o3[which(data_group$month=='01')],
          rev(data_group$neg_std_o3[which(data_group$month=='01')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"a)",family="serif",cex=1.8)


plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='02')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='02')], 
          rev(data_group$hour[which(data_group$month=='02')])),         
        c(data_group$pos_std_o3[which(data_group$month=='02')],
          rev(data_group$neg_std_o3[which(data_group$month=='02')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='03')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='03')], 
          rev(data_group$hour[which(data_group$month=='03')])),         
        c(data_group$pos_std_o3[which(data_group$month=='03')],
          rev(data_group$neg_std_o3[which(data_group$month=='03')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='04')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='04')], 
          rev(data_group$hour[which(data_group$month=='04')])),         
        c(data_group$pos_std_o3[which(data_group$month=='04')],
          rev(data_group$neg_std_o3[which(data_group$month=='04')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"d)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='05')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='05')], 
          rev(data_group$hour[which(data_group$month=='05')])),         
        c(data_group$pos_std_o3[which(data_group$month=='05')],
          rev(data_group$neg_std_o3[which(data_group$month=='05')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"e)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='06')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='06')], 
          rev(data_group$hour[which(data_group$month=='06')])),         
        c(data_group$pos_std_o3[which(data_group$month=='06')],
          rev(data_group$neg_std_o3[which(data_group$month=='06')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"f)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='07')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='07')], 
          rev(data_group$hour[which(data_group$month=='07')])),         
        c(data_group$pos_std_o3[which(data_group$month=='07')],
          rev(data_group$neg_std_o3[which(data_group$month=='07')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"g)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='08')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='08')], 
          rev(data_group$hour[which(data_group$month=='08')])),         
        c(data_group$pos_std_o3[which(data_group$month=='08')],
          rev(data_group$neg_std_o3[which(data_group$month=='08')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"h)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='09')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='09')], 
          rev(data_group$hour[which(data_group$month=='09')])),         
        c(data_group$pos_std_o3[which(data_group$month=='09')],
          rev(data_group$neg_std_o3[which(data_group$month=='09')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"i)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='10')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='10')], 
          rev(data_group$hour[which(data_group$month=='10')])),         
        c(data_group$pos_std_o3[which(data_group$month=='10')],
          rev(data_group$neg_std_o3[which(data_group$month=='10')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"j)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='11')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='11')], 
          rev(data_group$hour[which(data_group$month=='11')])),         
        c(data_group$pos_std_o3[which(data_group$month=='11')],
          rev(data_group$neg_std_o3[which(data_group$month=='11')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"k)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='12')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0419,lty=2)
polygon(c(data_group$hour[which(data_group$month=='12')], 
          rev(data_group$hour[which(data_group$month=='12')])),         
        c(data_group$pos_std_o3[which(data_group$month=='12')],
          rev(data_group$neg_std_o3[which(data_group$month=='12')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"l)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

#### CA0038
data_group <- CA0038 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0038_monthly.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(4,3))
par(oma = c(4, 4, 1, 1))
par(mar = c(1, 1, 1, 1))

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='01')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='01')], 
          rev(data_group$hour[which(data_group$month=='01')])),         
        c(data_group$pos_std_o3[which(data_group$month=='01')],
          rev(data_group$neg_std_o3[which(data_group$month=='01')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"a)",family="serif",cex=1.8)


plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='02')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='02')], 
          rev(data_group$hour[which(data_group$month=='02')])),         
        c(data_group$pos_std_o3[which(data_group$month=='02')],
          rev(data_group$neg_std_o3[which(data_group$month=='02')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='03')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='03')], 
          rev(data_group$hour[which(data_group$month=='03')])),         
        c(data_group$pos_std_o3[which(data_group$month=='03')],
          rev(data_group$neg_std_o3[which(data_group$month=='03')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='04')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='04')], 
          rev(data_group$hour[which(data_group$month=='04')])),         
        c(data_group$pos_std_o3[which(data_group$month=='04')],
          rev(data_group$neg_std_o3[which(data_group$month=='04')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"d)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='05')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='05')], 
          rev(data_group$hour[which(data_group$month=='05')])),         
        c(data_group$pos_std_o3[which(data_group$month=='05')],
          rev(data_group$neg_std_o3[which(data_group$month=='05')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"e)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='06')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='06')], 
          rev(data_group$hour[which(data_group$month=='06')])),         
        c(data_group$pos_std_o3[which(data_group$month=='06')],
          rev(data_group$neg_std_o3[which(data_group$month=='06')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"f)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='07')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='07')], 
          rev(data_group$hour[which(data_group$month=='07')])),         
        c(data_group$pos_std_o3[which(data_group$month=='07')],
          rev(data_group$neg_std_o3[which(data_group$month=='07')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"g)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='08')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='08')], 
          rev(data_group$hour[which(data_group$month=='08')])),         
        c(data_group$pos_std_o3[which(data_group$month=='08')],
          rev(data_group$neg_std_o3[which(data_group$month=='08')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"h)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='09')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='09')], 
          rev(data_group$hour[which(data_group$month=='09')])),         
        c(data_group$pos_std_o3[which(data_group$month=='09')],
          rev(data_group$neg_std_o3[which(data_group$month=='09')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(1,0.045,"i)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='10')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='10')], 
          rev(data_group$hour[which(data_group$month=='10')])),         
        c(data_group$pos_std_o3[which(data_group$month=='10')],
          rev(data_group$neg_std_o3[which(data_group$month=='10')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.7)
text(1,0.045,"j)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='11')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='11')], 
          rev(data_group$hour[which(data_group$month=='11')])),         
        c(data_group$pos_std_o3[which(data_group$month=='11')],
          rev(data_group$neg_std_o3[which(data_group$month=='11')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"k)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$month=='01')],data_group$mean_o3[which(data_group$month=='12')],lwd=2,
     type='l', ylim=range(0,0.05),family="serif",axes=FALSE, frame.plot=TRUE)
abline(h=0.0493,lty=2)
polygon(c(data_group$hour[which(data_group$month=='12')], 
          rev(data_group$hour[which(data_group$month=='12')])),         
        c(data_group$pos_std_o3[which(data_group$month=='12')],
          rev(data_group$neg_std_o3[which(data_group$month=='12')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.7)
axis(side=2, labels=FALSE)
text(1,0.045,"l)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()


#### Seasonal Plots

#### CA0003
data_group <- CA0003 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(o3=mean(o3,na.rm=TRUE))  


df1 <- matrix(rep(1,72),nrow=72,ncol=1)
df1 <- as.data.frame(df1)
df2 <- matrix(rep(2,48),nrow=48,ncol=1)
df2 <- as.data.frame(df2)
df3 <- matrix(rep(3,96),nrow=96,ncol=1)
df3 <- as.data.frame(df3)
df4 <- matrix(rep(4,48),nrow=48,ncol=1)
df4 <- as.data.frame(df4)
df5 <- matrix(rep(1,24),nrow=24,ncol=1)
df5 <- as.data.frame(df5)

df <- rbind(df1,df2,df3,df4,df5)
data_group <- cbind(data_group,df)
names (data_group) [4] <- "Seasons"

data_group <- data_group %>%
  group_by(Seasons,hour) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0003_seasonal.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(2,2))
par(oma = c(4, 4, 1, 1))
par(mar = c(0.5, 0.5, 0.5, 0.5))


plot(data_group$hour[which(data_group$Seasons=='1')],data_group$mean_o3[which(data_group$Seasons=='1')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.04,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='1')], 
          rev(data_group$hour[which(data_group$Seasons=='1')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='1')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"a)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='2')],data_group$mean_o3[which(data_group$Seasons=='2')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.04,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='2')], 
          rev(data_group$hour[which(data_group$Seasons=='2')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='2')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(0.5,0.05,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='3')],data_group$mean_o3[which(data_group$Seasons=='3')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.04,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='3')], 
          rev(data_group$hour[which(data_group$Seasons=='3')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='3')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='4')],data_group$mean_o3[which(data_group$Seasons=='4')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.04,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='4')], 
          rev(data_group$hour[which(data_group$Seasons=='4')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='4')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=FALSE)
text(0.5,0.05,"d)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()

#### CA0009
data_group <- CA0009 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(o3=mean(o3,na.rm=TRUE))  


df1 <- matrix(rep(1,72),nrow=72,ncol=1)
df1 <- as.data.frame(df1)
df2 <- matrix(rep(2,48),nrow=48,ncol=1)
df2 <- as.data.frame(df2)
df3 <- matrix(rep(3,96),nrow=96,ncol=1)
df3 <- as.data.frame(df3)
df4 <- matrix(rep(4,48),nrow=48,ncol=1)
df4 <- as.data.frame(df4)
df5 <- matrix(rep(1,24),nrow=24,ncol=1)
df5 <- as.data.frame(df5)

df <- rbind(df1,df2,df3,df4,df5)
data_group <- cbind(data_group,df)
names (data_group) [4] <- "Seasons"

data_group <- data_group %>%
  group_by(Seasons,hour) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0009_seasonal.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(2,2))
par(oma = c(4, 4, 1, 1))
par(mar = c(0.5, 0.5, 0.5, 0.5))


plot(data_group$hour[which(data_group$Seasons=='1')],data_group$mean_o3[which(data_group$Seasons=='1')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0379,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='1')], 
          rev(data_group$hour[which(data_group$Seasons=='1')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='1')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"a)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='2')],data_group$mean_o3[which(data_group$Seasons=='2')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0379,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='2')], 
          rev(data_group$hour[which(data_group$Seasons=='2')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='2')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(0.5,0.05,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='3')],data_group$mean_o3[which(data_group$Seasons=='3')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0379,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='3')], 
          rev(data_group$hour[which(data_group$Seasons=='3')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='3')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='4')],data_group$mean_o3[which(data_group$Seasons=='4')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0379,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='4')], 
          rev(data_group$hour[which(data_group$Seasons=='4')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='4')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=FALSE)
text(0.5,0.05,"d)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()

#### CA0038
data_group <- CA0038 %>%
  mutate(date=as.POSIXct(date)) %>%
  group_by(month=format(as.POSIXlt(cut(date,breaks='month')),'%m'),
           hour=format(as.POSIXlt(cut(date,breaks='hour')),'%H')) %>%
  summarise(o3=mean(o3,na.rm=TRUE))  


df1 <- matrix(rep(1,72),nrow=72,ncol=1)
df1 <- as.data.frame(df1)
df2 <- matrix(rep(2,48),nrow=48,ncol=1)
df2 <- as.data.frame(df2)
df3 <- matrix(rep(3,96),nrow=96,ncol=1)
df3 <- as.data.frame(df3)
df4 <- matrix(rep(4,48),nrow=48,ncol=1)
df4 <- as.data.frame(df4)
df5 <- matrix(rep(1,24),nrow=24,ncol=1)
df5 <- as.data.frame(df5)

df <- rbind(df1,df2,df3,df4,df5)
data_group <- cbind(data_group,df)
names (data_group) [4] <- "Seasons"

data_group <- data_group %>%
  group_by(Seasons,hour) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE))  

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)


data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

tiff("figs/CA0038_seasonal.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(2,2))
par(oma = c(4, 4, 1, 1))
par(mar = c(0.5, 0.5, 0.5, 0.5))


plot(data_group$hour[which(data_group$Seasons=='1')],data_group$mean_o3[which(data_group$Seasons=='1')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0457,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='1')], 
          rev(data_group$hour[which(data_group$Seasons=='1')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='1')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='1')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"a)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='2')],data_group$mean_o3[which(data_group$Seasons=='2')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0457,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='2')], 
          rev(data_group$hour[which(data_group$Seasons=='2')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='2')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='2')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=FALSE)
axis(side=2, labels=FALSE)
text(0.5,0.05,"b)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='3')],data_group$mean_o3[which(data_group$Seasons=='3')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0457,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='3')], 
          rev(data_group$hour[which(data_group$Seasons=='3')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='3')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='3')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,family="serif",cex.axis=1.6)
text(0.5,0.05,"c)",family="serif",cex=1.8)

plot(data_group$hour[which(data_group$Seasons=='4')],data_group$mean_o3[which(data_group$Seasons=='4')],lwd=2,
     type='l',xlab='',ylab='',ylim=range(0,0.05),axes=FALSE, frame.plot=TRUE)
abline(h=0.0457,lty=2)
polygon(c(data_group$hour[which(data_group$Seasons=='4')], 
          rev(data_group$hour[which(data_group$Seasons=='4')])),         
        c(data_group$pos_std_o3[which(data_group$Seasons=='4')],
          rev(data_group$neg_std_o3[which(data_group$Seasons=='4')])),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=FALSE)
text(0.5,0.05,"d)",family="serif",cex=1.8)

mtext('Hour (local time)', side = 1, outer = TRUE, line = 2,family="serif",cex=1.7)
mtext('Ozone hourly average (ppm)', side = 2, outer = TRUE, line = 2,family="serif",cex=1.7)

dev.off()


#### O3 against Temperature Plots #####
#### CA0003

data_group <- CA0003 %>%
  group_by(T_met) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE),
            log_mean_o3 = log(mean_o3))
is.na(data_group) <- sapply(data_group, is.infinite)

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)

data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

log_pos_std_o3 <- c(log(data_group$pos_std_o3))
log_pos_std_o3 <- as.data.frame(log_pos_std_o3)
log_neg_std_o3 <- c(log(data_group$neg_std_o3))
log_neg_std_o3 <- as.data.frame(log_neg_std_o3)

data_group <- cbind(data_group,log_pos_std_o3,log_neg_std_o3)
rm(log_pos_std_o3,log_neg_std_o3)

tiff("figs/CA0003_Temperature Effect.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1.5, 2, 0, 0))

plot(data_group$T_met,data_group$log_mean_o3,
     xlim=c(24,37),ylim=c(-5.2,-3.0),type="l",axes=FALSE, frame.plot=TRUE)

data_group <- subset(data_group, T_met > 22.8 & T_met < 38)
polygon(c(data_group$T_met, 
          rev(data_group$T_met)),         
        c(data_group$log_pos_std_o3,
          rev(data_group$log_neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

data_group <- subset(data_group, T_met > 25.4 & T_met < 29.6)
fit <- lm(data_group$log_mean_o3 ~ data_group$T_met)
segments(25.5,-5.5,25.5,data_group$log_mean_o3[which(data_group$T_met=="25.5")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="25.5")],
         25.5,data_group$log_mean_o3[which(data_group$T_met=="25.5")],lty=2)
segments(29.5,-5.5,29.5,data_group$log_mean_o3[which(data_group$T_met=="29.5")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="29.5")],
         29.5,data_group$log_mean_o3[which(data_group$T_met=="29.5")],lty=2)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,las=1,,family="serif",cex.axis=1.6)

mtext(expression(Temperature (degree*C)), side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Log ozone hourly average', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

anova(fit)
summary(fit)

#### CA0009

data_group <- CA0009 %>%
  group_by(T_met) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE),
            log_mean_o3 = log(mean_o3))
is.na(data_group) <- sapply(data_group, is.infinite)

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)

data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

log_pos_std_o3 <- c(log(data_group$pos_std_o3))
log_pos_std_o3 <- as.data.frame(log_pos_std_o3)
log_neg_std_o3 <- c(log(data_group$neg_std_o3))
log_neg_std_o3 <- as.data.frame(log_neg_std_o3)

data_group <- cbind(data_group,log_pos_std_o3,log_neg_std_o3)
rm(log_pos_std_o3,log_neg_std_o3)

tiff("figs/CA0009_Temperature Effect.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1.5, 2, 0, 0))

plot(data_group$T_met,data_group$log_mean_o3,
     xlim=c(24,37),ylim=c(-5.8,-2.8),type="l",axes=FALSE, frame.plot=TRUE)

data_group <- subset(data_group, T_met > 21.6 & T_met < 38)
polygon(c(data_group$T_met, 
          rev(data_group$T_met)),         
        c(data_group$log_pos_std_o3,
          rev(data_group$log_neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

data_group <- subset(data_group, T_met > 25.4 & T_met < 29.6)
fit <- lm(data_group$log_mean_o3 ~ data_group$T_met)
segments(25.5,-6,25.5,data_group$log_mean_o3[which(data_group$T_met=="25.5")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="25.5")],
         25.5,data_group$log_mean_o3[which(data_group$T_met=="25.5")],lty=2)
segments(29.5,-6,29.5,data_group$log_mean_o3[which(data_group$T_met=="29.5")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="29.5")],
         29.5,data_group$log_mean_o3[which(data_group$T_met=="29.5")],lty=2)


axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,las=1,,family="serif",cex.axis=1.6)

mtext(expression(Temperature (degree*C)), side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Log ozone hourly average', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

anova(fit)
summary(fit)

#### CA0038

data_group <- CA0038 %>%
  group_by(T_met) %>%
  summarise(mean_o3=mean(o3,na.rm=TRUE),
            std_o3=sd(o3,na.rm=TRUE),
            log_mean_o3 = log(mean_o3))
is.na(data_group) <- sapply(data_group, is.infinite)

pos_std_o3 <- c(data_group$mean_o3 + data_group$std_o3)
pos_std_o3 <- as.data.frame(pos_std_o3)
neg_std_o3 <- c(data_group$mean_o3 - data_group$std_o3)
neg_std_o3 <- as.data.frame(neg_std_o3)

data_group <- cbind(data_group,pos_std_o3,neg_std_o3)
rm(pos_std_o3,neg_std_o3)

log_pos_std_o3 <- c(log(data_group$pos_std_o3))
log_pos_std_o3 <- as.data.frame(log_pos_std_o3)
log_neg_std_o3 <- c(log(data_group$neg_std_o3))
log_neg_std_o3 <- as.data.frame(log_neg_std_o3)

data_group <- cbind(data_group,log_pos_std_o3,log_neg_std_o3)
rm(log_pos_std_o3,log_neg_std_o3)

tiff("figs/CA0038_Temperature Effect.png", width = 3060, height = 3060, res = 360)

par(mfrow=c(1,1))
par(oma = c(4, 4, 1, 1))
par(mar = c(1.5, 2, 0, 0))

plot(data_group$T_met,data_group$log_mean_o3,
     xlim=c(24,37),ylim=c(-5.2,-2.8),type="l",axes=FALSE, frame.plot=TRUE)

data_group <- subset(data_group, T_met > 23 & T_met < 38)
polygon(c(data_group$T_met, 
          rev(data_group$T_met)),         
        c(data_group$log_pos_std_o3,
          rev(data_group$log_neg_std_o3)),
        col=adjustcolor("grey",alpha.f=0.4), border = NA)

data_group <- subset(data_group, T_met > 24.9 & T_met < 29.1)
fit <- lm(data_group$log_mean_o3 ~ data_group$T_met)
segments(25,-5.5,25,data_group$log_mean_o3[which(data_group$T_met=="25")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="25")],
         25,data_group$log_mean_o3[which(data_group$T_met=="25")],lty=2)
segments(29,-5.5,29,data_group$log_mean_o3[which(data_group$T_met=="29")],lty=2)
segments(23,data_group$log_mean_o3[which(data_group$T_met=="29")],
         29,data_group$log_mean_o3[which(data_group$T_met=="29")],lty=2)

axis(side=1, labels=TRUE,family="serif",cex.axis=1.6)
axis(side=2, labels=TRUE,las=1,,family="serif",cex.axis=1.6)

mtext(expression(Temperature (degree*C)), side = 1, outer = TRUE, line = 2,family="serif",cex=1.8)
mtext('Log ozone hourly average', side = 2, outer = TRUE, line = 2,family="serif",cex=1.8)

dev.off()

anova(fit)
summary(fit)