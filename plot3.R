data <- read.csv("household_power_consumption.txt", skip = 66637, nrows = 2880, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = FALSE)
headings <- read.csv("household_power_consumption.txt", nrows = 1, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE )

names(data) <- names(headings)


data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
data$Time <- NULL
data$Date <- NULL

#Plot 3
par(mfrow = c(1, 1))
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", cex.lab = 0.85,  cex.axis = 0.85, cex.main = 0.85)
lines(data$DateTime, data$Sub_metering_2, type = "l", col = 2)
lines(data$DateTime, data$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="y")
png(file = "plot3.png", width = 480, height = 480 )
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", cex.lab = 0.9,  cex.axis = 0.9, cex.main = 0.9)
lines(data$DateTime, data$Sub_metering_2, type = "l", col = 2)
lines(data$DateTime, data$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="y")
dev.off()