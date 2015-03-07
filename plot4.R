
#setting time, reading the data and creating a PNG file "plot4" with 4 plots

Sys.setlocale("LC_TIME", "C")

data <- read.csv2("./household_power_consumption.txt", colClasses="character")

data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")


dates = as.Date(c("2007-02-01","2007-02-02")) #selecting the dates
sub_data = subset(data, data[,"Date"] %in% dates)

sub_data[,"Global_active_power"] <- as.numeric(sub_data[,"Global_active_power"])
sub_data[,"Voltage"] <- as.numericsub_data[,"Voltage"])
sub_data[,"Sub_metering_1"] <- as.numeric(sub_data[,"Sub_metering_1"])
sub_data[,"Sub_metering_2"] <- as.numeric(sub_data[,"Sub_metering_2"])
sub_data[,"Sub_metering_3"] <- as.numeric(sub_data[,"Sub_metering_3"])

sub_data[,"DateTime"] <- paste(sub_data[,"Date"], sub_data[,"Time"], sep=" ")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(as.POSIXct(sub_data[,"DateTime"]),sub_data[,"Global_active_power"], 
     type="l", 
     ylab="Global Active Power", xlab="")


plot(as.POSIXct(sub_data[,"DateTime"]),sub_data[,"Voltage"], 
     type="l", 
     ylab="Voltage", xlab="datetime")

plot(as.POSIXct(sub_data[,"DateTime"]), sub_data[,"Sub_metering_1"],
     type="l", 
     xlab="", ylab="Energy sub metering")
lines(as.POSIXct(sub_data[,"DateTime"]), sub_data[,"Sub_metering_2"], col="Red")
lines(as.POSIXct(sub_data[,"DateTime"]), sub_data[,"Sub_metering_3"], col="Blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), lwd=1, bty="n")

plot(as.POSIXct(sub_data[,"DateTime"]), sub_data[,"Global_reactive_power"],
     type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()