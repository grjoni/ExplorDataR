# Extract Data 

data_ex <- read.csv("./Dataex1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_ex$Date <- as.Date(data_ex$Date, format="%d/%m/%Y")

# Take subset of data

data_pow <- subset(data_ex, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_ex)

# Change date format

datetime <- paste(as.Date(data_pow$Date), data_pow$Time)
data$Datetime <- as.POSIXct(datetime)

# First plot

hist(data_pow$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save the plot to png format

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()