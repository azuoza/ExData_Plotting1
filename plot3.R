
# Plot 3 for Coursera - Exploratory Data Analysis - Ex_Data_Plotting Project 1 

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

# 2. making Plot 3

# open PNG device
png(
    filename = "plot3.png", 
    width = 480,
    height = 480,
    bg = "transparent"
)


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
    bg = "transparent"
    )

# closing device
dev.off()

# reset Locale to default
Sys.setlocale(category = "LC_ALL", locale = "")