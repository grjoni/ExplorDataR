
# Extract data

data_ex <- read.csv("./Dataex1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_ex$Date <- as.Date(data_ex$Date, format="%d/%m/%Y")

# Take Subset of Data
data_pow <- subset(data_ex, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_ex)

# Change the time format
datetime <- paste(as.Date(data_pow$Date), data$Time)
data_pow$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data_pow, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()