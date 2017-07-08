fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "powerconsump.zip")
unzip("powerconsump.zip")
library(lubridate)
consump <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
consump$dateTime <- strptime(paste(consump$Date,consump$Time), "%d/%m/%Y %H:%M:%S")
consump$Date <- as.Date(consump$Date,"%d/%m/%Y")
consumpsub <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot #3
#Lay down the base plot
png(filename = "plot3.png", width=480, height=480)
plot(consumpsub$dateTime, consumpsub$Sub_metering_1, type = "l", ylim = range(0,40), ylab = "Energy sub metering",
     xlab = "")
#New overlay on previous
par(new=T)
plot(consumpsub$dateTime, consumpsub$Sub_metering_2, type = "l", ylim = range(0,40), ylab = "Energy sub metering",
     col = "red")
#New overlay on previous
par(new=T)
plot(consumpsub$dateTime, consumpsub$Sub_metering_3, type = "l", ylim = range(0,40), ylab = "Energy sub metering",
     col = "blue")
#New overlay on previous
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2",  "Sub_metering_3"),
       col = c("black", "red", "blue"))

dev.off()