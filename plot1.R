# Read the file
mycsv <- read.csv("household_power_consumption.txt", header=T, sep=';',stringsAsFactors=F)

# Set the Date Column as data type
mycsv$Date <- as.Date(mycsv$Date, format="%d/%m/%Y")

# Filter the date range
filterrow <- subset(mycsv, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Histogram plot
hist(as.numeric(filterrow$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

## Save to file
dev.copy(png, file="plot1.png", height=500, width=400)
dev.off()
