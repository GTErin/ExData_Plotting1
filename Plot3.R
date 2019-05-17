setwd("C:/Users/Erin Kennedy/Desktop/Data")

##Read the required data where na.strings=? shows the character vector of strings to be interpreted as NA values
Data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")

#Get a subset of data that is needed
DataNeeded <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert the Date and Time variables to Date/Time classes
DateTime <- strptime(paste(DataNeeded$Date, DataNeeded$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Store the information needed as numeric values in a variable
GlobalActivePower <- as.numeric(DataNeeded$Global_active_power)
SubMetering1 <- as.numeric(DataNeeded$Sub_metering_1)
SubMetering2 <- as.numeric(DataNeeded$Sub_metering_2)
SubMetering3 <- as.numeric(DataNeeded$Sub_metering_3)

##Begin making the plot
png("plot3.png", width=480, height=480)

##Plot the Submetering 1 line, Submetering 2 line, Submetering 3 line approrpriate colors and label the axes
plot(DateTime, SubMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")

##Add the legend at the top right along with titles and lines of appropriate color
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

##Turn off the plot device
dev.off() 