#step 1: Download the data to the local file
setwd("C:/Users/shujuan/Desktop/coursera/Exploratory analysis/week 1")
AllDat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date<-as.Date(AllDat$Date, format="%d/%m/%Y")
id<-(as.numeric(date)==13546 )|(as.numeric(date)==13545 )  #select the data from 1/2/2007,2/2/2007
subData<-AllDat[id,]

#Step 2: Draw the graph
#plot 2
par(mfrow=c(1,1))
plot(GAP, type="n",axes=FALSE, ylab="Global Active Power (kilowatts)",xlab="")
axis(side=1, at=c(0,N/2,N),c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6,8))
lines(GAP)
box(lty="solid", col="black")
dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()