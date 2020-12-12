### Load and subset raw data into "my_data"
all_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(all_data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                     "Voltage","Global_intensity","Sub_metering_1",
                     "Sub_metering_2","Sub_metering_3")
my_data <- subset(all_data,all_data$Date=="1/2/2007" | all_data$Date =="2/2/2007")

### Transform Date and Time variables
datetime <- strptime(paste(my_data$Date, my_data$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 
#change used data from text to numeric
globalActivePower <- as.numeric(my_data$Global_active_power)
globalReactivePower <- as.numeric(my_data$Global_reactive_power)
voltage <- as.numeric(my_data$Voltage)
submetering1 <- as.numeric(my_data$Sub_metering_1)
submetering2 <- as.numeric(my_data$Sub_metering_2)
submetering3 <- as.numeric(my_data$Sub_metering_3)


### make the plot and PNG creation
# open PNG graphic device and set parameters
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
# plot 4.1
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power",
     cex=0.2)
# plot 4.2
plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")
# plot 4.3
plot(datetime,submetering1,type="l",ylab="Energy Submetering",xlab="")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,
       lwd=2.5,col=c("black","red","blue"),bty="o")
# plot 4.4
plot(datetime,globalReactivePower,type="l",xlab="datetime",
     ylab="Global_reactive_power")
# close PNG graphic device
dev.off()