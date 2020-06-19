## Read the dataset

data <- read.table("../assignment/household_power_consumption.txt",header = T, 
                   sep = ";",na.strings = '?')

## Add a column with a time+date in POSIXct format
library(dplyr)
data2 <- mutate (data, datetime = as.POSIXct(paste(data$Date, data$Time), 
                                                format="%d/%m/%Y %H:%M:%S"))
##Subset the right data

dataset <- subset(data2, grepl('2007-02-01|2007-02-02',datetime))

## Open a png, make plot, and close it again

png(file="plot3.png")

plot(dataset$datetime,dataset$Sub_metering_1,type="l",ylab="Engergy sub metering",xlab="")
lines(dataset$datetime,dataset$Sub_metering_2,col="Red")
lines(dataset$datetime,dataset$Sub_metering_3,col="Blue")
legend("topright", col=c("black","blue","red"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

dev.off()
