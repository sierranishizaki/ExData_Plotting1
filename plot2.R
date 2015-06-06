###  plots global active power in kilowats by days
### between 2007-02-01 and 2007-02-02

#loads data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


#subsets dates to be examined
data <- data_full[(data_full$Date=="2007-02-01") | (data_full$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# builds plot
plot(data$timestamp, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#creates pgn file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()