# Set your system path and relevant setting
sys_path <- "Development/R-studio/ExploratoryGraph/ExData_Plotting1/data"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipName <- "household_power_consumption.zip"
fileName <- "household_power_consumption.txt"
destZipPath <- paste(sys_path, zipName, sep = "/")
destFilePath <- paste(sys_path, fileName, sep = "/")
# Load up library
require(data.table)

# If data is not exist, we download the file and unzip
if(dir.create(path = sys_path )){
        download.file(fileUrl, destfile = destZipPath, method = "curl") 
}
unzip(destZipPath,exdir = sys_path)

# Load the data using fread, warning will raise as data contains NA values
# It's ok to ignore it since our range of data will not have any NA
data <- fread(input = destFilePath, sep = ";", header = TRUE, na.strings = '?')

# Clean data and convert data
data$Date <- as.Date(data[,data$Date],"%d/%m/%Y")
data$Global_active_power <- as.numeric(data[,data$Global_active_power])
data$Voltage <- as.numeric(data[,data$Voltage])
data$Global_reactive_power <- as.numeric(data[,data$Global_reactive_power])
data$Sub_metering_1 <- as.numeric(data[,data$Sub_metering_1])
data$Sub_metering_2 <- as.numeric(data[,data$Sub_metering_2])
data$Sub_metering_3 <- as.numeric(data[,data$Sub_metering_3])
startDate <- as.Date("2007/02/01","%Y/%m/%d")
endDate <- as.Date("2007/02/02","%Y/%m/%d")
inRange <- data$Date >= startDate & data$Date <= endDate
subset <- data[inRange]
# Create a datetime and merge 
subset$DateTime <- as.POSIXct(paste(subset$Date, subset$Time, sep = " "), format="%Y-%m-%d %H:%M:%S")
# Check if there is na in subset
# > any(is.na(subset))
# [1] FALSE

# Remove data
unlink(sys_path, recursive = TRUE, force = TRUE)
