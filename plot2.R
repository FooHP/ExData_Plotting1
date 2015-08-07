## Download the Dataset: Electric power consumption into your current working directory
## Read the dataset into R using read.table
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

## Extract  data from the dates 2007-02-01 to 2007-02-02
pdata <- powerdata[(powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007"),]


## Convert Date and time variables to POSIXlt
Dateinfo <- strptime(pdata$Date,"%d/%m/%Y")
Datetime <- as.POSIXlt(paste(Dateinfo,pdata$Time))

## Open PNG device; create "plot2.png" in the current working directory
png(filename="plot2.png",height=480,width=480)    
 
## Use the base plotting system to plot Global_active_power vs Datetime
plot(Datetime,pdata$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",pch=NA)
lines(Datetime,pdata$Global_active_power)
## Close the PNG file device 
dev.off()

