# Exploratory data analysis course
# Assignement 1

library(sqldf)

setwd("Users/coursera")

filepath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(filepath, destfile = "powerconsumption.zip", method = "curl")
unzip("powerconsumption.zip")

# courtesy Syed Tariq - using a SQL method to extract specified data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'" # define SQL-search strategy
myData <- read.csv2.sql("household_power_consumption.txt",mySql)

# convert Date-variable to R date format
myData$Date <- as.Date(myData$Date)

# generate plot 3 and safe to png
png("plot3.png")
plot(myData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xaxt = "n", xlab = "")
points(myData$Sub_metering_1, type = "l")
points(myData$Sub_metering_2, type = "l", col = "red")
points(myData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))
axis(1, c(1, 1440, 2880), c("Thu","Fri","Sat"))
dev.off()
