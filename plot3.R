#it is assumed that the data file is in the working directory named "household_power_consumption.txt
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", colClasses=c("character","character", rep("numeric",7)))

#subset 
data<- data[(data$Date == "1/2/2007")|(data$Date == "2/2/2007"),]

#crate one Date Time variable
x <- paste(data$Date, data$Time)
data$DT <-strptime(x, "%d/%m/%Y %H:%M:%S")

#create plot
png("plot3.png",width=480, height=480)
plot(data$Sub_metering_1, type="l", col = "black", xlab= "", ylab = "Energy sub metering", xaxt="n")
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()