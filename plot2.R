# Extract Data

data_ex <- read.csv("./Dataex1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_ex$Date <- as.Date(data_ex$Date, format="%d/%m/%Y")

# Take subset of data

data_pow <- subset(data_ex, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_ex)

# Change date format

datetime <- paste(as.Date(data_pow$Date), data_pow$Time)
data_pow$Datetime <- as.POSIXct(datetime)

# Plot 2

plot(data_pow$Global_active_power~data_pow$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
