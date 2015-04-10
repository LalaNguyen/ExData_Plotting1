# Script 3 Mission - Plot multiple lines

# Load the cleaned data
sys_path1 <- "Development/R-studio/ExploratoryGraph/ExData_Plotting1/"
cleanFile <- paste(sys_path1,"scripts/get_and_clean_data.R",sep="/")
source(cleanFile)
figuresDir <- paste(sys_path1, "figures", sep ="/")
fileName <- paste(figuresDir,"plot3.png", sep ="/")

# Use PNG device to write png file
png(file = fileName, width = 480, height = 480, units = "px")
plot(Sub_metering_1 ~ DateTime , data = subset, type = "l",ylab='Energy sub metering', xlab = "")
lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
dev.off()
