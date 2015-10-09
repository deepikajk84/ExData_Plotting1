library(lubridate)
data<- read.table("/Users/deepikakulkarni/Documents/RCourse/EDA/household_power_consumption.txt", sep=";", header=TRUE,na.strings = c("?",""))
data$NewDate <- as.Date(data$Date, format="%d/%m/%Y")
dataPlot<- subset(data, NewDate >= "2007-2-1" & NewDate <= "2007-2-2")
dataPlot$x<-strptime(paste(dataPlot$NewDate, dataPlot$Time), "%Y-%m-%d %H:%M:%S")
dataPlot$Day<-weekdays(as.Date(dataPlot$x))

##Plotting##
setwd("/Users/deepikakulkarni/Documents/RCourse/EDA"

#plot4.png#
png("Plot4.png", width = 480, height=480, type="quartz")
par(mfrow=c(2,2))
plot(dataPlot$x,dataPlot$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(dataPlot$x, dataPlot$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(dataPlot$x, dataPlot$Sub_metering_1, type="l",col="Black", ylab="Energy sub metering", xlab="")
lines(dataPlot$x, dataPlot$Sub_metering_2, type="l",col="red")
lines(dataPlot$x, dataPlot$Sub_metering_3, type="l",col="blue")
legend("topright", col=c("black","red", "blue"), lty=1,bty="n",cex=0.6,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataPlot$x,dataPlot$Global_reactive_power,type="l", xlab="datetime")

dev.off()
