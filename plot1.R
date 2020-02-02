fileName <- "household_power_consumption.txt"
db <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
db$Date <- strptime(db$Date, "%d/%m/%Y")
db$Date <- as.Date(db$Date)
db1 <- filter(db, between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))
png(filename = "plot1.png", width = 480, height = 480)
hist(db1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 2)
dev.off()