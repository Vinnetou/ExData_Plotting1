### Load and subset raw data into "my_data"
all_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(all_data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                     "Voltage","Global_intensity","Sub_metering_1",
                     "Sub_metering_2","Sub_metering_3")
my_data <- subset(all_data,all_data$Date=="1/2/2007" | all_data$Date =="2/2/2007")

###historam and PNG creation
#change used data from text to numeric
globalActivePower <- as.numeric(my_data$Global_active_power)
# open PNG graphic device and set parameters
png("plot1.png", width=480, height=480)
# make the histogram
hist(globalActivePower, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
#close PNG graphic device
dev.off()