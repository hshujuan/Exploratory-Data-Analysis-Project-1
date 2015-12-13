
#step 1: Download the data to the local file
setwd("C:/Users/shujuan/Desktop/coursera/Exploratory analysis/week 1")
AllDat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date<-as.Date(AllDat$Date, format="%d/%m/%Y")
id<-(as.numeric(date)==13546 )|(as.numeric(date)==13545 )  #select the data from 1/2/2007,2/2/2007
subData<-AllDat[id,]

#Step 2: Draw the graph
par(mfrow=c(1,1))
GAP<-as.numeric(as.character(subData$Global_active_power))
hist(GAP, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png",width = 480, height = 480)
dev.off()