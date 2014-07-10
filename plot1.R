#it is assumed that the data file is in the working directory named "household_power_consumption.txt
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", colClasses=c("character","character", rep("numeric",7)))

#subset 
data<- data[(data$Date == "1/2/2007")|(data$Date == "2/2/2007"),]

#create histogram in png file
png("plot1.png",width=480, height=480)
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

