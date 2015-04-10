# Script 2 Mission - Plot the line

# Load the cleaned data
sys_path1 <- "Development/R-studio/ExploratoryGraph/ExData_Plotting1/"
cleanFile <- paste(sys_path1,"scripts/get_and_clean_data.R",sep="/")
source(cleanFile)
fileName <- paste(figuresDir,"plot2.png", sep ="/")
figuresDir <- paste(sys_path1, "figures", sep ="/")

# Use PNG device to write png file
png(file = fileName, width = 480, height = 480, units = "px")
plot( x = subset$DateTime, y = subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
