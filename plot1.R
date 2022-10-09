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
png(filename = "plot1.png", width = 480, height = 480)
hist(
    as.numeric(df$Global_active_power),
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Freuency",
    col = "red"
)
dev.off()
