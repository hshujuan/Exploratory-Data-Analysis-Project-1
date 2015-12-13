#step 1: Download the data to the local file
setwd("C:/Users/shujuan/Desktop/coursera/Exploratory analysis/week 1")
AllDat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date<-as.Date(AllDat$Date, format="%d/%m/%Y")
id<-(as.numeric(date)==13546 )|(as.numeric(date)==13545 )  #select the data from 1/2/2007,2/2/2007
subData<-AllDat[id,]

#Step 2: Draw the graph
#plot 4
par(mfrow=c(2,2))

# Number 1

plot(GAP, type="n",axes=FALSE, ylab="Global Active Power",xlab="")
axis(side=1, at=c(0,N/2,N),c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6,8))
lines(GAP)
box(lty="solid", col="black")


# Number 2

voltage<-as.numeric(as.character(subData$Voltage))
plot(voltage , type="n",axes=FALSE, ylab="Voltage",xlab="datetime")
axis(side=1, at=c(0,N/2,N),c("Thu","Fri","Sat"))
axis(side=2, at=c(234,238,242,246))
lines(voltage)
box(lty="solid", col="black")

# Number 3

Sub_metering_1<-as.numeric(as.character(subData$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(subData$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(subData$Sub_metering_3))
plot(Sub_metering_1, type="n",axes=FALSE,ylab="Energy Sub Metering",xlab="")
lines(Sub_metering_1,col="black")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(side=1, at=c(0,N/2,N),c("Thu","Fri","Sat"))
axis(side=2, at=c(0,10,20,30,40))
legend(1800,40, lty=1 ,col=c("black","red","blue"), cex=0.5,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
box(lty="solid", col="black")

# Number 4

val4<-as.numeric(as.character(subData$Global_reactive_power))
plot(val4 , type="n",axes=FALSE, ylab="Global_reactive_power",xlab="datetime")
axis(side=1, at=c(0,N/2,N),c("Thu","Fri","Sat"))
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5,0.6))
lines(val4)
box(lty="solid", col="black")

# generate the png graph
dev.copy(png, file="plot4.png",width = 480, height = 480)
dev.off()