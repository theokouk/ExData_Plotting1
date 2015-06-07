# load the data of the particular dates (1/2/2007 - 2/2/2007)
# the variables are imported with a generic name (V1,V2,...)
# the "?" character is interpreted as NA value
# the last argument keep any character variable as it is and not convert it to factor
Hpc<-read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                 sep=";",na.strings="?",stringsAsFactors=FALSE)

# rename variables to their appropriate names
colnames(Hpc) <- c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# check if there are any missing values in the data for each variable
sum(is.na(Hpc$Date))
sum(is.na(Hpc$Time)) 
sum(is.na(Hpc$Sub_metering_1))
sum(is.na(Hpc$Sub_metering_2))
sum(is.na(Hpc$Sub_metering_3))

# merge the "Date" and "Time" variables to one new variable displaying both date and time
Hpc$Date.Time <- paste(Hpc$Date,Hpc$Time)

# remove the Date and Time variables from the data frame
Hpc$Date<-NULL
Hpc$Time<-NULL

# convert the character vector Date.Time to class "POSIXlt"
Hpc$Date.Time <- strptime(Hpc$Date.Time, "%d/%m/%Y %H:%M:%S")

# open device
png(filename="plot3.png",width=480,height=480,bg = "transparent")

# generate plot 3
plot( Hpc$Date.Time,Hpc$Sub_metering_1,type="l",col="grey",xlab=NA,ylab="Energy sub metering")  
lines( Hpc$Date.Time,Hpc$Sub_metering_2,type="l",col="red")
lines( Hpc$Date.Time,Hpc$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
                    col=c("grey", "red", "blue"))

# close device
dev.off()


