## Get the dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              'C:/Users/Kathy/Documents/GitHub/ExData_Plotting1/data.zip')
data_full <- read.csv("C:/Users/Kathy/Documents/GitHub/ExData_Plotting1/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subset the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Convert the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="C:/Users/Kathy/Documents/GitHub/ExData_Plotting1/plot2.png", height=480, width=480)
dev.off()