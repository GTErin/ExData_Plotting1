setwd("C:/Users/Erin Kennedy/Desktop/Data")

##Read the required data where na.strings=? shows the character vector of strings to be interpreted as NA values
Data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

#Get a subset of data that is needed
DataNeeded <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

DateTime <- strptime(paste(DataNeeded$Date, DataNeeded$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(DataNeeded$Global_active_power)

png("plot2.png", width=480, height=480)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off() 