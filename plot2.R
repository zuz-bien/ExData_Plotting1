#plot 2 

# time series plot 
# x axis: Thu, Fri, Sat
# y axis - Global Active Power 

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

#create plot graphic device

png(filename = "plot2.png", width = 480, height = 480, units = "px")

# create time series plot 

plot(df$Time, df$Global_active_power, type = "l", xlab = " "  , ylab = "Global Active Power (kilowatts)")

#close the graphic device 

dev.off()