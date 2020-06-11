# plot 4 

#composite of 4 graphs 

#common stem 

data <- read.csv2("household_power_consumption.txt", na.strings = "?", dec = ".", colClasses=c("character", "character", rep("numeric",7)))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
united_data <- unite(data, Standard_Time, Date, Time, sep = " ", remove = FALSE)
united_data$Time <- strptime(united_data$Standard_Time, format = "%Y-%m-%d %H:%M:%S")
df <- na.omit(united_data)

# open graphing device 

png(filename = "plot4.png", width = 480, height = 480, units = "px")

#setting order of graphs on page

par(mfcol = c(2, 2))


# graph 4.1 = plot 2 

plot(df$Time, df$Global_active_power, type = "l", xlab = " "  , ylab = "Global Active Power")

# graph 4.2 = plot 3

plot(x = df$Time, y = df$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "n")
lines(df$Time, df$Sub_metering_1)
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# graph 4.3 - date ~ voltage 

plot(df$Time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# graph 4.4 - date ~ Global_reactive_power

plot(df$Time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()




