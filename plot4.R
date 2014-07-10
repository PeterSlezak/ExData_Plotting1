#it is assumed that the data file is in the working directory named "household_power_consumption.txt
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", colClasses=c("character","character", rep("numeric",7)))

#subset 
data<- data[(data$Date == "1/2/2007")|(data$Date == "2/2/2007"),]

#crate one Date Time variable
x <- paste(data$Date, data$Time)
data$DT <-strptime(x, "%d/%m/%Y %H:%M:%S")

#create plot
png(filename = "plot4.png", width = 480, height = 480)
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

	#1
	plot(data$Global_active_power, type = "l", ylab = "Global Active Power", xlab="", xaxt="n")
	axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
	#2
	plot(data$Voltage, xlab = "datetime", ylab="Voltage", type = "l", xaxt="n")
	axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
	#3
	plot(data$Sub_metering_1, type="l", col = "black", xlab= "", ylab = "Energy sub metering", xaxt="n")
	axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
	lines(data$Sub_metering_2, col = "red")
	lines(data$Sub_metering_3, col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
	#4
	plot(data$Global_reactive_power, type="l", , xlab = "datetime", ylab="Global_reactive_power", xaxt="n")
	axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
	dev.off()