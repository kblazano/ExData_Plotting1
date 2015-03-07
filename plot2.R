
#setting time, reading the data and creating a PNG file "plot2"

Sys.setlocale("LC_TIME", "C")

data <- read.csv2("./household_power_consumption.txt", colClasses="character")

data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

dates = as.Date(c("2007-02-01","2007-02-02")) #selecting the dates

sub_data = subset(data, data[,"Date"] %in% dates)

sub_data[,"Global_active_power"] <- as.numeric(sub_data[,"Global_active_power"])

sub_data[,"DateTime"] <- paste(sub_data[,"Date"], sub_data[,"Time"], sep=" ")

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(as.POSIXct(sub_data[,"DateTime"]), sub_data[,"Global_active_power"], type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()