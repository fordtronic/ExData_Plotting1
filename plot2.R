fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "powerconsump.zip")
unzip("powerconsump.zip")
library(lubridate)
consump <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
consump$dateTime <- strptime(paste(consump$Date,consump$Time), "%d/%m/%Y %H:%M:%S")
consump$Date <- as.Date(consump$Date,"%d/%m/%Y")
consumpsub <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot #2
png(filename = "plot2.png", width=480, height=480)
plot(consumpsub$dateTime, consumpsub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()