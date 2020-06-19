## Read the dataset

data <- read.table("../assignment/household_power_consumption.txt",header = T, 
                   sep = ";",na.strings = '?')

## Set the Date as 'date' and the Time as 'time' (for time, use the lubridate package)
data$Date <- with(data,as.Date(Date,"%d/%m/%Y"))

library(lubridate)
data$Time <- with(data,hms(Time))

## Subset the two dates
dataset <- subset(data, grepl('2007-02-01|2007-02-02',Date))

## Open a png, make plot, and close it again

png(file="plot1.png")

hist(dataset$Global_active_power, main="Global Active Power", col="Red",
     xlab="Global Active Power (kilowatts)")

dev.off()
