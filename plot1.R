## Download the Dataset: Electric power consumption into your current working directory
## Read the dataset into R using read.table
powerdata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")


## Extract  data from the dates 2007-02-01 to  2007-02-02
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
pdata <- powerdata[(powerdata$Date <= "2007-02-02" & powerdata$Date >= "2007-02-01"),]

## Open PNG device; create "plot1.png" in the current working directory
png(filename="plot1.png",height=480,width=480)    

## Use the base plotting system to draw a histogram of Global_active_power
hist(pdata$Global_active_power,main = "Global Active Power",xlab="Global Active Power (kilowatts)",col="red")   

## Close the PNG file device 
dev.off()
  



     
            
     