
# Plot 4 for Coursera - Exploratory Data Analysis - Ex_Data_Plotting Project 1 

# 1. reading data
# 1.1. column names of the data
nm <- read.table(
    file = "./data/household_power_consumption.txt",
    sep = ";",
    nrows = 1,
    stringsAsFactors = F)

# 1.2. reading only 2007-02-01 and 2007-02-02
dt <- read.table(
    file = "./data/household_power_consumption.txt",
    header = F,
    col.names = as.character(nm),
    sep = ";",
    na.strings = "?",
    nrows = 2880,
    skip = 66637
)

rm(nm)

# 1.3. converting Date and Time
dt$Date2 <- strptime(
    x = paste(as.character(dt$Date), as.character(dt$Time), sep = " "),
    format = "%d/%m/%Y %H:%M:%S",
    tz = "EST"
)

# change Locale
Sys.setlocale(category = "LC_TIME", locale = "C")

# 2. making Plot 4

# open PNG device
png(
    filename = "plot4.png", 
    width = 480,
    height = 480,
    bg = "transparent"
)

par(
    mfrow = c(2,2)
    )

# ploting Global Active Power (plot 2)
plot(
    x = dt$Date2, 
    y = dt$Global_active_power,
    type="l", 
    xlab = "",
    ylab = "Global Active Power",
    main = ""
)

# Ploting Voltage
plot(
    x = dt$Date2,
    y = dt$Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage",
    main = ""
    )


# ploting Energy Sub Meetering (plot 3)
plot(
    x = dt$Date2,
    y = dt$Sub_metering_1,
    ylab = "Energy sub metering",
    xlab = "",
    main ="",
    col = "black",
    type = "l"
)

lines(
    x = dt$Date2,
    y = dt$Sub_metering_2,
    col = "red",
    type = "l"
)

lines(
    x = dt$Date2,
    y = dt$Sub_metering_3,
    col = "blue",
    type = "l"
)

legend(
    x = "topright",
    legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1,
    bty = "n",
    bg = "transparent"
)


# ploting Global_reactive_power
plot(
    x = dt$Date2,
    y = dt$Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power",
    main = ""
)


# closing device
dev.off()

# reset Locale to default
Sys.setlocale(category = "LC_ALL", locale = "")