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

## Open PNG device; create "plot2.png" in the current working directory
png(filename="plot2.png",height=480,width=480)    
 
## Use the base plotting system to plot Global_active_power vs datetime
plot(datetime,pdata$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## Close the PNG file device 
dev.off()

