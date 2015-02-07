library(sqldf)
epc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date == '1/2/2007' or Date == '2/2/2007')", header = TRUE, sep = ";")
sqldf()

epc$DateTime <- strptime(paste(epc$Date, epc$Time),  format = "%d/%m/%Y %H:%M:%S")

hist(epc$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png,filename="plot1.png");
dev.off ();