
# Plot 2 for Coursera - Exploratory Data Analysis - Ex_Data_Plotting Project 1 

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

# 2. making Plot 2

# open PNG device
png(
    filename = "plot2.png", 
    width = 480,
    height = 480,
    bg = "transparent"
)

# making plot

plot(
    x = dt$Date2, 
    y = dt$Global_active_power,
    type="l", 
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
    )

# closing device
dev.off()
