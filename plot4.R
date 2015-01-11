data <- read.csv("household_power_consumption.txt", skip = 66637, nrows = 2880, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = FALSE)
headings <- read.csv("household_power_consumption.txt", nrows = 1, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE )

names(data) <- names(headings)


data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
data$Time <- NULL
data$Date <- NULL

#Plot 4
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.85,  cex.axis = 0.85, cex.main = 0.85)

plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.lab = 0.85,  cex.axis = 0.85, cex.main = 0.85)

plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", cex.lab = 0.85,  cex.axis = 0.85, cex.main = 0.8)
lines(data$DateTime, data$Sub_metering_2, type = "l", col = 2)
lines(data$DateTime, data$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n", cex = 0.7)

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime",  cex.lab = 0.85, cex.axis = 0.85, cex.main = 0.85)
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.9,  cex.axis = 0.9, cex.main = 0.9)

plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.lab = 0.9,  cex.axis = 0.9, cex.main = 0.9)

plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", cex.lab = 0.9,  cex.axis = 0.9, cex.main = 0.9)
lines(data$DateTime, data$Sub_metering_2, type = "l", col = 2)
lines(data$DateTime, data$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n", cex = 0.9)

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime",  cex.lab = 0.9, cex.axis = 0.9, cex.main = 0.9)
dev.off()
