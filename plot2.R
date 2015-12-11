library(dplyr)

data1 <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?",stringsAsFactors = FALSE)
day1 <- filter(data1, Date =="1/2/2007")
day2 <- filter(data1, Date =="2/2/2007")

select_data <- merge(day1, day2, all=TRUE)

library(lubridate)

new_data <- mutate(select_data, date_time = dmy_hms(paste(Date, Time)))

with(new_data, plot(date_time, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()