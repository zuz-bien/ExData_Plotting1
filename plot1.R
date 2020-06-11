# plot 1 


# Title: Global Active Power
# axes: Global Active Power (kilowatts) (x) ~ Frequency (y)
# Type: Histogram 
# no of bins- ?15
# colour: red 

#step 1 - load the dataset 

data <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".", colClasses=c("character", "character", rep("numeric",7)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Time <- strptime(data$Time, "%H:%M:%S")

sdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(sdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()