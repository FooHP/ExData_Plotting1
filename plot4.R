## Download the Dataset: Electric power consumption into your current working directory
## Read the dataset into R using read.table
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")


## Extract  data from the dates 2007-02-01 to  2007-02-02
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
pdata <- powerdata[(powerdata$Date <= "2007-02-02" & powerdata$Date >= "2007-02-01"),]

## convert the Date and Time variables to POSIXlt
## %F   Equivalent to %Y-%m-%d (the ISO 8601 date format)
## %T   Equivalent to %H:%M:%S
## For more information issue ?strptime

datetime <- strptime(paste(pdata$Date,pdata$Time),"%F %T")


## Extract Sub_metering data
Energy1 <- pdata$Sub_metering_1
Energy2 <- pdata$Sub_metering_2
Energy3 <- pdata$Sub_metering_3



## Open PNG device; create "plot4.png" in the current working directory
png(filename="plot4.png",height=480,width=480) 

## Multiple Base Plots 

par(mfcol=c(2,2))
par(mar=c(4,4,2,2))
plot(datetime,pdata$Global_active_power,xlab="",ylab="Global Active Power",type="l")


plot(datetime,Energy1,xlab="",ylab="Energy sub metering",type = "n")
lines(datetime,Energy1)
lines(datetime,Energy2,col="red")
lines(datetime,Energy3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime,pdata$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(datetime,pdata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")


## Close the PNG file device 
dev.off()
