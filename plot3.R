## Download the Dataset: Electric power consumption into your current working directory
## Read the dataset into R using read.table
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
## Extract  data from the dates 2007-02-01 to 2007-02-02
pdata <- powerdata[(powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007"),]

## Extract Sub_metering data 
Energy1 <- pdata$Sub_metering_1
Energy2 <- pdata$Sub_metering_2
Energy3 <- pdata$Sub_metering_3

## convert the Date and Time variables to POSIXlt 
Dateinfo <- strptime(pdata$Date,"%d/%m/%Y")
Datetime <- as.POSIXlt(paste(Dateinfo,pdata$Time))
## Open PNG device; create "plot3.png" in the current working directory
png(filename="plot3.png",height=480,width=480)  

## Use the base plotting system to plot Sub_metering vs Datetime  in one chart 
plot(Datetime,Energy1,xlab="",ylab="Energy sub metering",pch=NA,type = "n")
lines(Datetime,Energy1,col="black")
lines(Datetime,Energy2,col="red")
lines(Datetime,Energy3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Close the PNG file device 
dev.off()