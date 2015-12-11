library(dplyr)

data1 <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?",stringsAsFactors = FALSE)
day1 <- filter(data1, Date =="1/2/2007")
day2 <- filter(data1, Date =="2/2/2007")

select_data <- merge(day1, day2, all=TRUE)

library(lubridate)

new_data <- mutate(select_data, date_time = dmy_hms(paste(Date, Time)))

png(file="plot3.png", width = 480, height = 480)
with(new_data, plot(date_time, Sub_metering_1, type="l", xlab="",ylab="Engergy Sub metering"))
with(new_data, lines(date_time, Sub_metering_2, col="red"))
with(new_data, lines(date_time, Sub_metering_3, col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))


dev.off()