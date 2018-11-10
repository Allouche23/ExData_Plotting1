#get data
readdata <- read.table("C:/Users/Joachim/Desktop/exploraty data project/household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE, na.strings = "?")
#convert to date
readdata$Date <- as.Date(readdata$Date, "%d/%m/%Y")
#subsetting the data to the to dates that will be used 
subdata <- subset(readdata, Date == "2007/2/1"| Date == "2007/2/2")
#convertng the variable for the historgram in to a numeric variable
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
#creating the histogram and making sure that the data comes out in the correct size 
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)") 
#closing the output connection 
dev.off()