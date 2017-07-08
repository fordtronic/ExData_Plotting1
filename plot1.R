fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "powerconsump.zip")
unzip("powerconsump.zip")
library(lubridate)
consump <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
consump$dateTime <- strptime(paste(consump$Date,consump$Time), "%d/%m/%Y %H:%M:%S")
consump$Date <- as.Date(consump$Date,"%d/%m/%Y")
consumpsub <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot #1
png(filename = "plot1.png", width=480, height=480)
hist(consumpsub$Global_active_power, freq = TRUE, col="red",xlim = range(0,8), xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()