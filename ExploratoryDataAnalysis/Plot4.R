#read the data
d = read.table("household_power_consumption.txt",sep=";",fill=FALSE,header=TRUE)

#Convert column date from factor to Date
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

#Subset for the dates that we care about
data <- subset(d, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Facor to int for Global Active Power
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
data$Voltage = as.numeric(as.character(data$Voltage))
#convert datetime field
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))


#print plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", breaks=6)


#Plot 2
#png(filename="plog2.png", width=480,height=480)
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()


#Plot 3 Print Graphy
plot(data$Datetime,data$Sub_metering_1, type="l",xlab="",ylab="Energy Sub metering")
lines(data$Datetime,data$Sub_metering_2, type="l",col="red")
lines(data$Datetime,data$Sub_metering_3, type="l",col="blue")
legend("topright",lty = 1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#plot 4
par(mfcol = c(2,2))

#Quad 1
plot(data$Datetime,data$Global_active_power,type="l",xlab="",ylab="Global Acive Power (kilowatts)")

#Quad 2
plot(data$Datetime,data$Sub_metering_1, type="l",xlab="",ylab="Energy Sub metering")
lines(data$Datetime,data$Sub_metering_2, type="l",col="red")
lines(data$Datetime,data$Sub_metering_3, type="l",col="blue")
legend("topright",lty = 1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Quad 3
plot(data$Datetime, data$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Quad 4
plot(data$Datetime,data$Global_reactive_power,type="l",xlab="datetime")

dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()
