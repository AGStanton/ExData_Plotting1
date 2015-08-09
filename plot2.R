## load in the data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset for just the relevant dates
asdf <- df[df[, "Date"] == "1/2/2007" | df[, "Date"] == "2/2/2007", ]

## combine date and time columns and convert to appropriate format
asdf$datetime <- strptime(paste(asdf$Date, asdf$Time), format = "%d/%m/%Y %H:%M:%S")

## launch the graphics device
png(filename = "plot2.png", width = 480, height = 480)

## construct the plot
plot(asdf$datetime, asdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## close the png file device
dev.off()