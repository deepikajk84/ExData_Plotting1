library(lubridate)
data<- read.table("/Users/deepikakulkarni/Documents/RCourse/EDA/household_power_consumption.txt", sep=";", header=TRUE,na.strings = c("?",""))
data$NewDate <- as.Date(data$Date, format="%d/%m/%Y")
dataPlot<- subset(data, NewDate >= "2007-2-1" & NewDate <= "2007-2-2")
dataPlot$x<-strptime(paste(dataPlot$NewDate, dataPlot$Time), "%Y-%m-%d %H:%M:%S")
dataPlot$Day<-weekdays(as.Date(dataPlot$x))

##Plotting##
setwd("/Users/deepikakulkarni/Documents/RCourse/EDA")
#Plot1.png#
png("Plot1.png", width = 480, height=480, type="quartz")
hist(dataPlot$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
