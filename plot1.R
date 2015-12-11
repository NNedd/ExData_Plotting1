library(dplyr)

data1 <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings = "?",stringsAsFactors = FALSE)
day1 <- filter(data1, Date =="1/2/2007")
day2 <- filter(data1, Date =="2/2/2007")

select_data <- merge(day1, day2, all=TRUE)

hist(select_data$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()