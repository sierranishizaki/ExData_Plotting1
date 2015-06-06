###  plots 4 graphs diplaying 
### 1. Global Active Power over days
### 2. voltage v date time
### 3. energy sub metering v days
### 4. Global reactive power v date time
### between 2007-02-01 and 2007-02-02

#loads data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


#subsets dates to be examined
data <- data_full[(data_full$Date=="2007-02-01") | (data_full$Date=="2007-02-02"),]
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power <- <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# builds histogram
par(mfrow=c(2,2))

#1
plot(data$timestamp, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#2
plot(data$timestamp, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

#3
plot(data$timestamp, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data$timestamp, data$Sub_metering_2, col = "Red")
lines(data$timestamp, data$Sub_metering_3, col = "Blue")
legend("topright", c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), col=c("black","red","blue"), lty=c(1,1), bty="n", cex=.5)

#4
plot(data$timestamp, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = datetime, type = "l")

#creates pgn file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()