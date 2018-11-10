#get data
readdata <- read.table("C:/Users/Joachim/Desktop/exploraty data project/household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE, na.strings = "?")
#vairable with dates and time together 
dataww <- strptime(paste(readdata$Date, readdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
datawithti <- cbind(readdata,dataww)
#convert to date
datawithti$Date <- as.Date(datawithti$Date, "%d/%m/%Y")
#subsetting the data to the to dates that will be used 
subdata <- subset(datawithti, Date == "2007/2/1"| Date == "2007/2/2")
#convertng the variable for the historgram in to a numeric variable
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

#creating the plot
png("plot3.png", width = 480, height = 480)
with(subdata,plot(dataww, Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = ""))
lines(subdata$dataww, subdata$Sub_metering_2, col = "red", type = "l")
lines(subdata$dataww, subdata$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
