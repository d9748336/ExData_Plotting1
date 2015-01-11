data <- read.csv("household_power_consumption.txt", skip = 66637, nrows = 2880, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = FALSE)
headings <- read.csv("household_power_consumption.txt", nrows = 1, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE )

names(data) <- names(headings)


data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
data$Time <- NULL
data$Date <- NULL

#Plot 2
par(mfrow = c(1, 1))
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.8,  cex.axis = 0.8, cex.main = 0.8)
png(file = "plot2.png", width = 480, height = 480 )
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.8,  cex.axis = 0.8, cex.main = 0.8)
dev.off()
