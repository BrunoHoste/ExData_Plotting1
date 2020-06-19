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

png(file="plot2.png")

plot(dataset$datetime,dataset$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "")

dev.off()
