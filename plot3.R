#plot 3

# time series plot 
# x axis: Thu, Fri, Sat
# y axis - Energy sub metering 

library(tidyr)
library(dplyr)


#1 - load the dataset 

data <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".", colClasses=c("character", "character", rep("numeric",7)))

#2 - change date into R Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#subsetting the relevant dates
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#3 - changing time into POSIXlt - first need to merge the time and date columns so that R can assign 
# the correct date - otherwise it will falsely assign current date

united_data <- unite(data, Standard_Time, Date, Time, sep = " ", remove = FALSE)

united_data$Time <- strptime(united_data$Standard_Time, format = "%Y-%m-%d %H:%M:%S")

df <- na.omit(united_data)

#open graphing device

png(filename = "plot3.png", width = 480, height = 480, units = "px")


# plot empty graph 

plot(x = df$Time, y = df$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "n")

# add es1

lines(df$Time, df$Sub_metering_1)

#add es2

lines(df$Time, df$Sub_metering_2, col = "red")

#add es3

lines(df$Time, df$Sub_metering_3, col = "blue")


legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# close graphing device

dev.off()
