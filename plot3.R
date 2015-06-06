###  plots energy sub mentoring by days
### between 2007-02-01 and 2007-02-02

#loads data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


#subsets dates to be examined
data <- data_full[(data_full$Date=="2007-02-01") | (data_full$Date=="2007-02-02"),]
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# builds plot
plot(data$timestamp, data$Sub_metering_1, ylab = "Energy sub metering)", xlab = "", type = "l")
lines(data$timestamp, data$Sub_metering_1, col = "Red")
lines(data$timestamp, data$Sub_metering_2, col = "Blue")

#creates pgn file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()