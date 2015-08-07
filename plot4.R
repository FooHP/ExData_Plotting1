## Download the Dataset: Electric power consumption into your current working directory
## Read the dataset into R using read.table
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
## Extract  data from the dates 2007-02-01 to  2007-02-02
pdata <- powerdata[(powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007"),]

## Extract Sub_metering data
Energy1 <- pdata$Sub_metering_1
Energy2 <- pdata$Sub_metering_2
Energy3 <- pdata$Sub_metering_3

## convert the Date and Time variables to POsixlt
Dateinfo <- strptime(pdata$Date,"%d/%m/%Y")
Datetime <- as.POSIXlt(paste(Dateinfo,pdata$Time))

## Open PNG device; create "plot4.png" in the current working directory
png(filename="plot4.png",height=480,width=480) 

## Multiple Base Plots 

par(mfcol=c(2,2))
par(mar=c(4,4,2,2))
plot(Datetime,pdata$Global_active_power,xlab="",ylab="Global Active Power",pch=NA)
lines(Datetime,pdata$Global_active_power)

plot(Datetime,Energy1,xlab="",ylab="Energy sub metering",pch=NA,type = "n")
lines(Datetime,Energy1)
lines(Datetime,Energy2,col="red")
lines(Datetime,Energy3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(Datetime,pdata$Voltage,xlab="datetime",ylab="Voltage",pch=NA)
lines(Datetime,pdata$Voltage)

plot(Datetime,pdata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",pch=NA)
lines(Datetime,pdata$Global_reactive_power)

## Close the PNG file device 
dev.off()
