###  plots a histogram of global active power in kilowats
### between 2007-02-01 and 2007-02-02

#loads data
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")


#subsets dates to be examined
data <- data_full[(data_full$Date=="2007-02-01") | (data_full$Date=="2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


# builds histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "RED", ylim = c(0,1200))

#creates pgn file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()