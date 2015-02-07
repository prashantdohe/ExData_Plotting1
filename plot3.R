library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' or Date == '2/2/2007')", header = TRUE, sep = ";")
sqldf()

epc$DateTime <- strptime(paste(epc$Date, epc$Time),  format = "%d/%m/%Y %H:%M:%S")

plot(x = epc$DateTime, y = epc$Sub_metering_1, type = "new", xlab = "", ylab = "Energy sub metering")
lines(x = epc$DateTime, y = epc$Sub_metering_1)
lines(x = epc$DateTime, y = epc$Sub_metering_2, col = "red")
lines(x = epc$DateTime, y = epc$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1,
       col = c("black", "red", "blue"))
dev.copy(png,filename="plot3.png", height = 480, width = 480);
dev.off ();
