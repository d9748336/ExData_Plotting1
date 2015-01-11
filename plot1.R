data <- read.csv("household_power_consumption.txt", skip = 66637, nrows = 2880, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = FALSE)
headings <- read.csv("household_power_consumption.txt", nrows = 1, stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE )

names(data) <- names(headings)


data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
data$Time <- NULL
data$Date <- NULL

#Plot 1
par(mfrow = c(1, 1))
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2)
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2)
dev.off()

