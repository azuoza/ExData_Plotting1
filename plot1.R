
# Plot 1 for Coursera - Exploratory Data Analysis - Ex_Data_Plotting Project 1 

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

# 2. making Plot 1

# open PNG device
png(
    filename = "plot1.png", 
    width = 480,
    height = 480,
    bg = "transparent"
    )

# making histogram

hist(
    x = dt$Global_active_power,
    main = "Global Actice Power", 
    xlab = "Global Active Power (kilowatts)",
    col = "red"
    )

# closing device
dev.off()