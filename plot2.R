fileName <- "household_power_consumption.txt"
db <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
db$Date <- strptime(db$Date, "%d/%m/%Y")
db$Date <- as.Date(db$Date)
db1 <- filter(db, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
db1$datetime = with(db1, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
png(filename = "plot2.png", width = 480, height = 480)
plot(db1$datetime, db1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = NULL)
dev.off()