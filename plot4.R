library(dplyr)

data1 <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?",stringsAsFactors = FALSE)
day1 <- filter(data1, Date =="1/2/2007")
day2 <- filter(data1, Date =="2/2/2007")

select_data <- merge(day1, day2, all=TRUE)

library(lubridate)

new_data <- mutate(select_data, date_time = dmy_hms(paste(Date, Time)))
png(file="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(new_data, {
  plot(date_time, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
  plot(date_time, Voltage, type="l", xlab="datetime",ylab="Voltage")
  plot(date_time, Sub_metering_1, type="l", xlab="",ylab="Engergy Sub metering")
  lines(date_time, Sub_metering_2, col="red")
  lines(date_time, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
  plot(date_time, Global_reactive_power, type="l", xlab="datetime",ylab="Global_reative_power")

})

dev.off()