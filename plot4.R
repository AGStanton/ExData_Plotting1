## load in the data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset for just the relevant dates
asdf <- df[df[, "Date"] == "1/2/2007" | df[, "Date"] == "2/2/2007", ]

## combine date and time columns and convert to appropriate format
asdf$datetime <- strptime(paste(asdf$Date, asdf$Time), format = "%d/%m/%Y %H:%M:%S")

## launch the graphics device
png(filename = "plot4.png", width = 480, height = 480)

## construct the plots
par(mfcol = c(2,2))
## first plot
plot(asdf$datetime, asdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## second plot
plot(asdf$datetime, asdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(asdf$datetime, asdf$Sub_metering_2, col = "red")
lines(asdf$datetime, asdf$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## third plot
plot(asdf$datetime, asdf$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
## fourth plot
plot(asdf$datetime, asdf$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## close the png file device
dev.off()