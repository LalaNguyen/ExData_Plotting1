# Script 1 Mission - Plot the histogram

# Load the cleaned data
sys_path1 <- "Development/R-studio/ExploratoryGraph/ExData_Plotting1/"
cleanFile <- paste(sys_path1,"scripts/get_and_clean_data.R",sep="/")
source(cleanFile)
figuresDir <- paste(sys_path1, "figures", sep ="/")
fileName <- paste(figuresDir,"plot1.png", sep ="/")

# Use PNG device to write png file
png(file = fileName, width = 480, height = 480, units = "px")
hist(subset$Global_active_power,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
