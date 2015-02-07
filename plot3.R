# Read the file
mycsv <- read.csv("hpc.txt", header=T, sep=';',stringsAsFactors=F)

# Set the Date Column as data type
mycsv$Date <- as.Date(mycsv$Date, format="%d/%m/%Y")

# Filter the date range & Append the date
filterrow <- subset(mycsv, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
newtime <- paste(filterrow$Date, filterrow$Time)
filterrow$Newtime <- as.POSIXct(newtime)

# Plotting...

plot(filterrow$Sub_metering_1~filterrow$Newtime, type="l",ylab="Energy sub metering", xlab="")
lines(filterrow$Sub_metering_2~filterrow$Newtime, col="red")
lines(filterrow$Sub_metering_3~filterrow$Newtime, col="blue")
legend("topright",col=c("black", "red", "blue"),lty=1,lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=400, width=400)
dev.off()