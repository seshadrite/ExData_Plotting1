# Read the file
mycsv <- read.csv("household_power_consumption.txt", header=T, sep=';',stringsAsFactors=F)

# Set the Date Column as data type
mycsv$Date <- as.Date(mycsv$Date, format="%d/%m/%Y")

# Filter the date range & Append the date
filterrow <- subset(mycsv, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
newtime <- paste(filterrow$Date, filterrow$Time)
filterrow$Newtime <- as.POSIXct(newtime)

# Plotting...
plot(filterrow$Global_active_power~filterrow$Newtime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=400, width=400)
dev.off()
