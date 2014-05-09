# Exploratory data analysis course
# Assignement 1 - plot 1

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

# generate plot 1 and safe to png
png("plot1.png")
hist(myData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()