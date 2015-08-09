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

## Open PNG device; create "plot3.png" in the current working directory
png(filename="plot3.png",height=480,width=480)  

## Use the base plotting system to plot Sub_metering vs datetime  in one chart 
plot(datetime,Energy1,xlab="",ylab="Energy sub metering",type = "n")
lines(datetime,Energy1,col="black")
lines(datetime,Energy2,col="red")
lines(datetime,Energy3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Close the PNG file device 
dev.off()