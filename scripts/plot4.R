# Script 4 Mission - Plot multiple graph in one screen

# Load the cleaned data
sys_path1 <- "Development/R-studio/ExploratoryGraph/ExData_Plotting1/"
cleanFile <- paste(sys_path1,"scripts/get_and_clean_data.R",sep="/")
source(cleanFile)
figuresDir <- paste(sys_path1, "figures", sep ="/")
fileName <- paste(figuresDir,"plot4.png", sep ="/")

# Use PNG device to write png file
png(file = fileName, width = 480, height = 480, units = "px")
# Setup display
par(mfrow = c(2,2), mar = c(4,5,0,1))
# Plot 1
plot( x = subset$DateTime, y = subset$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
# Plot 2
plot(Voltage~DateTime, data = subset, xlab = "datetime", ylab = "Voltage", type = "l")
# Plot 3
plot(Sub_metering_1 ~ DateTime , data = subset, type = "l",ylab='Energy sub metering', xlab = "")
lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
# Plot 4
plot(Global_reactive_power~DateTime, data = subset, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()