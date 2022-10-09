# reading data
df <- read.table(
    "household_power_consumption.txt",
    header = TRUE, nrow = 70000, sep = ";")

# Data Pre-processing
df$Time <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting data
df <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]

# plot
png(filename = "plot3.png", width = 480, height = 480)
plot(df$Time, as.numeric(df$Sub_metering_1), type = "l", ylab = "Energy Submetering", xlab = "")
lines(df$Time, as.numeric(df$Sub_metering_2), col = "red")
lines(df$Time, as.numeric(df$Sub_metering_3), col = "blue")
legend(
    "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1,
    lwd = 2.5
)
dev.off()
