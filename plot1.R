## load in the data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset for just the relevant dates
asdf <- df[df[, "Date"] == "1/2/2007" | df[, "Date"] == "2/2/2007", ]

## launch the graphics device
png(filename = "plot1.png", width = 480, height = 480)

## construct the plot
hist(asdf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## close the png file device
dev.off()