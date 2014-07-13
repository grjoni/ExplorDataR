
# Extrat data

data_ex <- read.csv("./Dataex1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_ex$Date <- as.Date(data_ex$Date, format="%d/%m/%Y")

# Take subset of data

data_pow <- subset(data_ex, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Change the date format

datetime <- paste(as.Date(data_pow$Date), data_pow$Time)
data_pow$Datetime <- as.POSIXct(datetime)

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_pow, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Save to local to png format
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()