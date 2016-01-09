## plot4.R
rawDataFile<-"household_power_consumption.txt"
rawData<-read.table(rawDataFile,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

## head(rawData) - knowing the data
## str(rawData) - knowing the data

## Subsetting the table
workingData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

## head(workingData)
## str(workingData)

date_plus_time <- strptime(paste(workingData$Date, workingData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workingData$Global_active_power)
globalReactivePower <- as.numeric(workingData$Global_reactive_power)
voltage <- as.numeric(workingData$Voltage)

subMetering1 <- as.numeric(workingData$Sub_metering_1)
subMetering2 <- as.numeric(workingData$Sub_metering_2)
subMetering3 <- as.numeric(workingData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## First Plot of the panel
plot(date_plus_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Second plot of the panel
plot(date_plus_time, voltage, type="l", xlab="datetime", ylab="Voltage")

## Third plot of the panel
plot(date_plus_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_plus_time, subMetering2, type="l", col="red")
lines(date_plus_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Fourth plot of the panel
plot(date_plus_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
## End of plot4.R

