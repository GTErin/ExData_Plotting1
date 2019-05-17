setwd("C:/Users/Erin Kennedy/Desktop/Data")

##Read the required data where na.strings=? shows the character vector of strings to be interpreted as NA values
Data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

#Get a subset of data that is needed
DataNeeded <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(DataNeeded$Global_active_power)

#Create the plot and required histrogram
png("Plot1.png", width=480, height=480)
hist(GlobalActivePower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")

##Turn off png device
dev.off()
