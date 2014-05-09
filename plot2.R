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

# generate plot 2 and safe to png
png("plot2.png")
plot(myData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
axis(1, c(1, 1440, 2880), c("Thu","Fri","Sat"))
dev.off()