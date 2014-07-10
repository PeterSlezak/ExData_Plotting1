#it is assumed that the data file is in the working directory named "household_power_consumption.txt
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", colClasses=c("character","character", rep("numeric",7)))

#subset 
data<- data[(data$Date == "1/2/2007")|(data$Date == "2/2/2007"),]

#crate one Date Time variable
x <- paste(data$Date, data$Time)
data$DT <-strptime(x, "%d/%m/%Y %H:%M:%S")

#create plot in png file
#xaxt="n" is there because of the local language settings. Since I'm using non-english
#settings, the days labels are not in english, therefore I create plot without the 
#x-label and then I manually add the labels.
png("plot2.png",width=480, height=480)
plot(data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
