
#reading the data and creating a PNG file "plot1"

data <- read.csv2("./household_power_consumption.txt", colClasses="character")

data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

dates = as.Date(c("2007-02-01","2007-02-02")) #selecting the dates

sub_data = subset(data, data[,"Date"] %in% dates)

sub_data[,"Global_active_power"] <- as.numeric(sub_data[,"Global_active_power"])

png("plot1.png", width=480, height=480)
hist(sub_data[,"Global_active_power"], col="Red", main="Global Active Power", 
     ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()

