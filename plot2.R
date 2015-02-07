library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' or Date == '2/2/2007')", header = TRUE, sep = ";")
sqldf()

epc$DateTime <- strptime(paste(epc$Date, epc$Time),  format = "%d/%m/%Y %H:%M:%S")

plot(x = epc$DateTime, y = epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,filename="plot2.png");
dev.off ();
