# load the data of the particular dates (1/2/2007 - 2/2/2007)
# the variables are imported with a generic name (V1,V2,...)
# the "?" character is interpreted as NA value

Hpc<-read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                 sep=";",na.strings="?")

# rename variables to their appropriate names

colnames(Hpc) <- c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# check if there are any missing values

sum(is.na(Hpc$Global_active_power))

# generate the plot

hist(Hpc$Global_active_power,xlab="Global Active Power (kilowatts)",
main="Global Active Power",breaks=11, col="red",bg = "transparent") 

# save the plot to disk 

dev.copy(png,"Plot1.png",width = 480, height = 480, bg = "transparent")

# close device

dev.off()