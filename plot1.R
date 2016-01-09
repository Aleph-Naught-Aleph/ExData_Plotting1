## plot1.R
rawDataFile<-"household_power_consumption.txt"
rawData<-read.table(rawDataFile,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

## head(rawData) - knowing the data
## str(rawData) - knowing the data

## Subsetting the table
workingData <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007") ,]

## head(workingData)
## str(workingData)

## Global_active_pOwer was already read as numeric variable 
png("plot1.png", width=480, height=480)
hist(workingData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
## End of plot1.R

