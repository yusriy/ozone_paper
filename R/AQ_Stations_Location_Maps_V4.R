## Code to produce maps using ggmap ###

# Load libraries

library(ggmap)
library(plyr)
library(gridExtra)
library(maptools)
library(rgdal)
library(raster)

# Set working directory

setwd("Your Worknig Directory")

# Read in file with station coordinates

aqs <- read.csv("Data/PP_AQS_V3.csv")

names(aqs) <- tolower(names(aqs))

# Generate individual Site plots

s1 <- subset(aqs,station.id=="CA0003")

map = ggmap(get_openstreetmap(bbox = c(left =s1$longitude-0.005,bottom =s1$latitude-0.005,
                                       right =s1$longitude+0.005,top =s1$latitude+0.005),
                                       scale=9000,color="color"))

plot1 <- map +
         geom_point(aes_string(x = "longitude",y = "latitude"),size = 5,data = s1,shape=16,colour="black")+
         geom_text(data=s1,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=5,fontface="bold",hjust=1.00,vjust=-1.00)+
         xlab("") + ylab("") +
         ggtitle(paste(s1$location, "-", s1$station.id)) +
         theme(plot.title = element_text(lineheight=1, face="bold",size = 12, colour = "grey20"),
         axis.line=element_blank(),
         panel.border = element_rect(colour="grey20",fill=NA,size=0.5),
         axis.text.x=element_blank(),
         axis.text.y=element_blank(),
         axis.ticks=element_blank())

plot1 <- plot1 + scaleBar(lon = 100.3828, lat = 5.387, distanceLon = 0.2, distanceLat = 0.01, distanceLegend = 0.05, dist.unit = "km", orientation = FALSE)

plot1

s2 <- subset(aqs,station.id=="CA0009")

map = ggmap(get_openstreetmap(bbox = c(left =s2$longitude-0.005,bottom =s2$latitude-0.005,
                                       right =s2$longitude+0.005,top =s2$latitude+0.005),
                                      scale=9000,color="color"))

plot2 <- map +
         geom_point(aes_string(x = "longitude",y = "latitude"),size = 5,data = s2,shape=16,fill="black")+
         geom_text(data=s2,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=5,fontface="bold",hjust=1.25,vjust=1.25)+
         xlab("") + ylab("") +
         ggtitle(paste(s2$location, "-", s2$station.id)) +
         theme(plot.title = element_text(lineheight=1, face="bold",size = 12, colour = "grey20"),
         panel.border = element_rect(colour="grey20",fill=NA,size=0.5),
         axis.line=element_blank(),
         axis.text.x=element_blank(),
         axis.text.y=element_blank(),
         axis.ticks=element_blank())

plot2 <- plot2 + scaleBar(lon = 100.4, lat = 5.3942, distanceLon = 0.2, distanceLat = 0.01, distanceLegend = 0.05, dist.unit = "km", orientation = FALSE)

plot2



s3 <- subset(aqs,station.id=="CA0038")

map = ggmap(get_openstreetmap(bbox = c(left =s3$longitude-0.005,bottom =s3$latitude-0.005,
                                       right =s3$longitude+0.005,top =s3$latitude+0.005),
                              scale=9000,color="color"))

plot3 <- map +
         geom_point(aes_string(x = "longitude",y = "latitude"),size = 5,data = s3,shape=16,fill="black")+
         geom_text(data=s3,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=5,fontface="bold",hjust=1.25,vjust=0.5)+
         xlab("") + ylab("") +
         ggtitle(paste(s3$location, "-", s3$station.id)) +
         theme(plot.title = element_text(lineheight=1, face="bold",size = 12, colour = "grey20"),
         panel.border = element_rect(colour="grey20",fill=NA,size=0.5),
         axis.line=element_blank(),
         axis.text.x=element_blank(),
         axis.text.y=element_blank(),
         axis.ticks=element_blank())

plot3 <- plot3 + scaleBar(lon = 100.3040, lat = 5.352, distanceLon = 0.2, distanceLat = 0.01, distanceLegend = 0.05, dist.unit = "km", orientation = FALSE)

plot3

s4 <- subset(aqs,station.id=="WMKP486010")

map = ggmap(get_openstreetmap(bbox = c(left =s4$longitude-0.005,bottom =s4$latitude-0.005,
                                       right =s4$longitude+0.005,top =s4$latitude+0.005),
                              scale=9000,color="color"))

plot4 <- map +
  geom_point(aes_string(x = "longitude",y = "latitude"),size = 5,data = s4,shape=16,fill="black")+
  geom_text(data=s4,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=5,fontface="bold",hjust=1.00,vjust=-1.00)+
  xlab("") + ylab("") +
  ggtitle(paste(s4$location, "-", s4$station.id)) +
  theme(plot.title = element_text(lineheight=1, face="bold",size = 12, colour = "grey20"),
        panel.border = element_rect(colour="grey20",fill=NA,size=0.5),
        axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank())

plot4 <- plot4 + scaleBar(lon = 100.273, lat = 5.2928, distanceLon = 0.2, distanceLat = 0.01, distanceLegend = 0.05, dist.unit = "km", orientation = FALSE)

plot4

s5 <- subset(aqs,station.id=="WMKB486020")

map = ggmap(get_openstreetmap(bbox = c(left =s5$longitude-0.005,bottom =s5$latitude-0.005,
                                       right =s5$longitude+0.005,top =s5$latitude+0.005),
                              scale=9000,color="color"))

plot5 <- map +
  geom_point(aes_string(x = "longitude",y = "latitude"),size = 5,data = s5,shape=16,fill="black")+
  geom_text(data=s5,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=5,fontface="bold",hjust=1.00,vjust=-1.00)+
  xlab("") + ylab("") +
  ggtitle(paste(s5$location, "-", s5$station.id)) +
  theme(plot.title = element_text(lineheight=1, face="bold",size = 12, colour = "grey20"),
        panel.border = element_rect(colour="grey20",fill=NA,size=0.5),
        axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank())

plot5 <- plot5 + scaleBar(lon = 100.3875, lat = 5.462, distanceLon = 0.2, distanceLat = 0.01, distanceLegend = 0.05, dist.unit = "km", orientation = FALSE)

plot5


png(filename = "D:/Site_Locations_1.png",height=4,width=16,
    bg = "white",units='in', res = 400, family = "",  type = "cairo-png")

grid.arrange(plot1,plot2,plot3, ncol=3)

dev.off()

png(filename = "D:/Site_Locations_2.png",height=4,width=16,
    bg = "white",units='in', res = 400, family = "",  type = "cairo-png")

grid.arrange(plot4,plot5, ncol=2)

dev.off()


# Main Map

map = ggmap(get_googlemap(center=c(100.30, 5.35),
      zoom=11,maptype='terrain',scale = 2,color='color'),
      extent='panel',darken=0)



map1= map + geom_point (data = aqs,aes(x = longitude,y = latitude),
      shape = 21, colour = "black", fill="black", size = 4) +  
      geom_text(data=s1,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=7,fontface="bold",hjust=1.1,vjust=0.3)+
      labs(x = "Longitude", y = "Latitude") +
      geom_text(data=s2,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=7,fontface="bold",hjust=1.1,vjust=-0.4)+
      labs(x = "Longitude", y = "Latitude") +
      geom_text(data=s3,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=7,fontface="bold",hjust=1.1,vjust=0.3)+
      labs(x = "Longitude", y = "Latitude") +
      geom_text(data=s4,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=7,fontface="bold",hjust=1.1,vjust=0.3)+
      labs(x = "Longitude", y = "Latitude") +
      geom_text(data=s5,aes_string(x="longitude",y="latitude",label="station.id"),colour="black",family="serif",size=7,fontface="bold",hjust=1.1,vjust=0.3)+
      labs(x = "Longitude", y = "Latitude") +
      theme ( 
      legend.position = c(0.03, 0.06), # put the legend INSIDE the plot area
      legend.justification = c(0, 0),
      legend.background = element_rect(colour = F, fill = "white"),
      legend.key = element_rect (fill = F, colour = F),
      axis.title=element_text(family="serif",size=20,face="bold",colour="grey19"),
      axis.text.x=element_text(family="serif",size=20,face="bold",colour="grey19"),
      axis.text.y=element_text(family="serif",size=20,face="bold",colour="grey19"),
      panel.border = element_rect(colour = "grey19",fill=F,size=1.2)
      ) 


#Inset

mys0<-getData("GADM", country="MYS", level=0) # download MYS level 0 map for ucdavis site

  oc <- readOGR(dsn="countries_shp", layer="countries")

pol<-data.frame(xmin=100.09,xmax=100.50 ,ymin=5.18 ,ymax=5.55)

p2<- ggplot()+geom_polygon(data=oc,aes(long,lat,group=group),fill="grey60")+
     geom_polygon(data=mys0, aes(long,lat,group=group),colour="grey10",fill="grey90",size=0.2)+
     theme_bw()+labs(x=NULL,y=NULL)+
     annotate("text", x = 102.4, y = 3.75, label = "PENINSULAR\nMALAYSIA",family="serif",size=3.5,fontface="bold")+
     annotate("text", x = 99.8, y = 2, label = "SUMATERA,\nINDONESIA",family="serif",size=3.5,fontface="bold")+
     ggtitle("LOCALITY MAP\n")+ coord_equal(xlim=c(96, 107), ylim=c(0.5, 7))+
     geom_rect(data = pol, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), alpha=0, colour="black",size = 1, linetype=1)+
     theme(axis.text.x =element_blank(),axis.text.y= element_blank(), axis.ticks=element_blank(),axis.title.x =element_blank(),
     axis.title.y= element_blank(),panel.border = element_rect(colour="white",fill=FALSE),
     plot.title = element_text(lineheight=0.5, face="bold",family="serif",size =15, colour = "grey20"),
     plot.background = element_rect(colour="black",fill="white",size=1),
     panel.grid.major=element_blank(),panel.grid.minor=element_blank(),
     plot.margin=unit(c(0.0,1,0.1,0.1),"mm")) 

p2

map2 = ggmap(
       get_map(
       location=c(100.242, 5.38), 
       zoom=6,source="stamen",
       maptype='toner',crop=T), 
       extent='device', 
       darken = 0.25) +
       geom_text(aes(x=103.5,y=3.75),label="MALAYSIA",colour="black",size=3,fontface="bold.italic",hjust=1.1,vjust=0.25)+
       geom_rect(aes(xmin = 99.75, xmax = 100.75, ymin = 4.9, ymax = 5.8), alpha=0, colour="white", size = 1, linetype=1)

fullMap <- map1 + inset(grob = ggplotGrob(p2+theme( 
           legend.position = c(0.03, 0.06), # put the legend INSIDE the plot area
           legend.justification = c(0, 0),
           legend.background = element_rect(colour = F, fill = "white"),
           legend.key = element_rect (fill = F, colour = F),
           panel.grid.major = element_blank (), # remove major grid
           panel.grid.minor = element_blank (),  # remove minor grid
           axis.text = element_blank (), 
           axis.title.x=element_blank(),
           axis.title.y=element_blank(),
           axis.ticks = element_blank (),
           panel.border = element_rect(colour = "grey19",fill=F,size=1.2),
           panel.background = element_rect(fill = "white",colour = "black"))), 
           xmin = 100.1,  xmax = 100.25, ymin = 5.13, ymax = 5.28) +
           theme(plot.title = element_text(face = "bold",size = 14,colour="grey19"))

fullMap <- fullMap + scaleBar(lon = 100.27, lat = 5.16, distanceLon = 5, distanceLat = 0.5, distanceLegend = 1.25, dist.unit = "km", orientation = FALSE)


print(fullMap)

ggsave ("D:/AQ_Station_Map_Colour.png", dpi = 400,w=10,h=10)


#### Functions to create map elements #########

# Result #
#--------#
# Return a list whose elements are :
#   - rectangle : a data.frame containing the coordinates to draw the first rectangle ;
#   - rectangle2 : a data.frame containing the coordinates to draw the second rectangle ;
#   - legend : a data.frame containing the coordinates of the legend texts, and the texts as well.
#
# Arguments : #
#-------------#
# lon, lat : longitude and latitude of the bottom left point of the first rectangle to draw ;
# distanceLon : length of each rectangle ;
# distanceLat : width of each rectangle ;
# distanceLegend : distance between rectangles and legend texts ;
# dist.units : units of distance "km" (kilometers) (default), "nm" (nautical miles), "mi" (statute miles).
createScaleBar <- function(lon,lat,distanceLon,distanceLat,distanceLegend, dist.units = "km"){
  # First rectangle
  bottomRight <- gcDestination(lon = lon, lat = lat, bearing = 90, dist = distanceLon, dist.units = dist.units, model = "WGS84")
  
  topLeft <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distanceLat, dist.units = dist.units, model = "WGS84")
  rectangle <- cbind(lon=c(lon, lon, bottomRight[1,"long"], bottomRight[1,"long"], lon),
                     lat = c(lat, topLeft[1,"lat"], topLeft[1,"lat"],lat, lat))
  rectangle <- data.frame(rectangle, stringsAsFactors = FALSE)
  
  # Second rectangle t right of the first rectangle
  bottomRight2 <- gcDestination(lon = lon, lat = lat, bearing = 90, dist = distanceLon*2, dist.units = dist.units, model = "WGS84")
  rectangle2 <- cbind(lon = c(bottomRight[1,"long"], bottomRight[1,"long"], bottomRight2[1,"long"], bottomRight2[1,"long"], bottomRight[1,"long"]),
                      lat=c(lat, topLeft[1,"lat"], topLeft[1,"lat"], lat, lat))
  rectangle2 <- data.frame(rectangle2, stringsAsFactors = FALSE)
  
  # Now let's deal with the text
  onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distanceLegend, dist.units = dist.units, model = "WGS84")
  onTop2 <- onTop3 <- onTop
  onTop2[1,"long"] <- bottomRight[1,"long"]
  onTop3[1,"long"] <- bottomRight2[1,"long"]
  
  legend <- rbind(onTop, onTop2, onTop3)
  legend <- data.frame(cbind(legend, text = c(0, distanceLon, distanceLon*2)), stringsAsFactors = FALSE, row.names = NULL)
  return(list(rectangle = rectangle, rectangle2 = rectangle2, legend = legend))
}


#
# Result #
#--------#
# Returns a list containing :
#   - res : coordinates to draw an arrow ;
#   - coordinates of the middle of the arrow (where the "N" will be plotted).
#
# Arguments : #
#-------------#
# scaleBar : result of createScaleBar() ;
# length : desired length of the arrow ;
# distance : distance between legend rectangles and the bottom of the arrow ;
# dist.units : units of distance "km" (kilometers) (default), "nm" (nautical miles), "mi" (statute miles).
createOrientationArrow <- function(scaleBar, length, distance = 1, dist.units = "km"){
  lon <- scaleBar$rectangle2[1,1]
  lat <- scaleBar$rectangle2[1,2]
  
  # Bottom point of the arrow
  begPoint <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distance, dist.units = dist.units, model = "WGS84")
  lon <- begPoint[1,"long"]
  lat <- begPoint[1,"lat"]
  
  # Let us create the endpoint
  onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = length, dist.units = dist.units, model = "WGS84")
  
  leftArrow <- gcDestination(lon = onTop[1,"long"], lat = onTop[1,"lat"], bearing = 225, dist = length/5, dist.units = dist.units, model = "WGS84")
  
  rightArrow <- gcDestination(lon = onTop[1,"long"], lat = onTop[1,"lat"], bearing = 135, dist = length/5, dist.units = dist.units, model = "WGS84")
  
  res <- rbind(
    cbind(x = lon, y = lat, xend = onTop[1,"long"], yend = onTop[1,"lat"]),
    cbind(x = leftArrow[1,"long"], y = leftArrow[1,"lat"], xend = onTop[1,"long"], yend = onTop[1,"lat"]),
    cbind(x = rightArrow[1,"long"], y = rightArrow[1,"lat"], xend = onTop[1,"long"], yend = onTop[1,"lat"]))
  
  res <- as.data.frame(res, stringsAsFactors = FALSE)
  
  # Coordinates from which "N" will be plotted
  coordsN <- cbind(x = lon, y = (lat + onTop[1,"lat"])/2)
  
  return(list(res = res, coordsN = coordsN))
}


#
# Result #
#--------#
# This function enables to draw a scale bar on a ggplot object, and optionally an orientation arrow #
# Arguments : #
#-------------#
# lon, lat : longitude and latitude of the bottom left point of the first rectangle to draw ;
# distanceLon : length of each rectangle ;
# distanceLat : width of each rectangle ;
# distanceLegend : distance between rectangles and legend texts ;
# dist.units : units of distance "km" (kilometers) (by default), "nm" (nautical miles), "mi" (statute miles) ;
# rec.fill, rec2.fill : filling colour of the rectangles (default to white, and black, resp.);
# rec.colour, rec2.colour : colour of the rectangles (default to black for both);
# legend.colour : legend colour (default to black);
# legend.size : legend size (default to 3);
# orientation : (boolean) if TRUE (default), adds an orientation arrow to the plot ;
# arrow.length : length of the arrow (default to 500 km) ;
# arrow.distance : distance between the scale bar and the bottom of the arrow (default to 300 km) ;
# arrow.North.size : size of the "N" letter (default to 6).
scaleBar <- function(lon, lat, distanceLon, distanceLat, distanceLegend, dist.unit = "km", rec.fill = "white", rec.colour = "black", rec2.fill = "black", rec2.colour = "black", legend.colour = "black", legend.size = 5, orientation = TRUE, arrow.length = 500, arrow.distance = 300, arrow.North.size = 6){
  laScaleBar <- createScaleBar(lon = lon, lat = lat, distanceLon = distanceLon, distanceLat = distanceLat, distanceLegend = distanceLegend, dist.unit = dist.unit)
  # First rectangle
  rectangle1 <- geom_polygon(data = laScaleBar$rectangle, aes(x = lon, y = lat), fill = rec.fill, colour = rec.colour)
  
  # Second rectangle
  rectangle2 <- geom_polygon(data = laScaleBar$rectangle2, aes(x = lon, y = lat), fill = rec2.fill, colour = rec2.colour)
  
  # Legend
  scaleBarLegend <- annotate("text", label = paste(laScaleBar$legend[,"text"], dist.unit, sep=""), x = laScaleBar$legend[,"long"], y = laScaleBar$legend[,"lat"], size = legend.size, colour = legend.colour)
  
  res <- list(rectangle1, rectangle2, scaleBarLegend)
  
  if(orientation){# Add an arrow pointing North
    coordsArrow <- createOrientationArrow(scaleBar = laScaleBar, length = arrow.length, distance = arrow.distance, dist.unit = dist.unit)
    arrow <- list(geom_segment(data = coordsArrow$res, aes(x = x, y = y, xend = xend, yend = yend)), annotate("text", label = "N", x = coordsArrow$coordsN[1,"x"], y = coordsArrow$coordsN[1,"y"], size = arrow.North.size, colour = "black"))
    res <- c(res, arrow)
  }
  return(res)
}
