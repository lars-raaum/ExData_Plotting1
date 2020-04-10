#JHU Exploratory Data Analysis 
#Week 1 

setwd("/Users/larsraaum/code/datasciencecoursera/JHU - Exploratory Data Analysis/Week 1/")

fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "data.zip", method = "curl")
listoffiles <- c(unzip("data.zip", list = TRUE))
datafile <- listoffiles$Name[1]
unzip("data.zip")
df <- read.table(datafile, header = TRUE, sep =";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings ="?")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

library(chron)
times(df$Time)

dfClean <- subset(df, Date>="2007-02-01" & Date <= "2007-02-02")
dfClean$DT <- as.POSIXct(paste(dfClean$Date, dfClean$Time, sep = " "))

#Plot 3
png(filename="plot3.png")
plot(dfClean$DT, dfClean$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab ="")
lines(dfClean$DT, dfClean$Sub_metering_2, col = "red")
lines(dfClean$DT, dfClean$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lwd = 2)
dev.off()