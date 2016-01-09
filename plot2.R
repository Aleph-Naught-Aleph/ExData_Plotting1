## plot2.R
rawDataFile<-"household_power_consumption.txt"
rawData<-read.table(rawDataFile,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

## head(rawData) - knowing the data
## str(rawData) - knowing the data

## Subsetting the table
workingData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

## head(workingData)
## str(workingData)

## Combining Date and Time variables 
date_plus_time <- strptime(paste(workingData$Date, workingData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Preparing the variable to plot
globalActivePower <- as.numeric(workingData$Global_active_power)

## Plotting adnd saving 
png("plot2.png", width=480, height=480)
plot(date_plus_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
## End of plot2.R

