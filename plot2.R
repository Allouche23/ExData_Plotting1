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

#creating the plot
png("plot2.png", width = 480, height = 480)
with(subdata,plot(dataww, Global_active_power, ylab = "Global_active_power (Killowatts)", type = "l", xlab = ""))
dev.off()
