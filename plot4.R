library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' or Date == '2/2/2007')", header = TRUE, sep = ";")
sqldf()

epc$DateTime <- strptime(paste(epc$Date, epc$Time),  format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(x = epc$DateTime, y = epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(x = epc$DateTime, y = epc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x = epc$DateTime, y = epc$Sub_metering_1, type = "new", xlab = "", ylab = "Energy sub metering")
lines(x = epc$DateTime, y = epc$Sub_metering_1)
lines(x = epc$DateTime, y = epc$Sub_metering_2, col = "red")
lines(x = epc$DateTime, y = epc$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.5,
       lty = 1,
       col = c("black", "red", "blue"),
       bty = "n",
       yjust = 0.5
       )
plot(x = epc$DateTime, y = epc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,filename="plot4.png", height = 480, width = 480);
dev.off ();


