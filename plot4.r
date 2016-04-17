# plot 4
library(sqldf)
fn <- "/Users/priyanchandrapala/Documents/DataScienceCourse/Rworkspace/household_power_consumption.txt"
DF1 <- read.csv2.sql(fn, sql = "select * from file where Date in(\"1/2/2007\",\"2/2/2007\")", na.strings = "NA")
DF1$DateTime <- apply(DF1[, c("Date", "Time")], 1, paste, collapse = " ")
DF1$DateTime = strptime(DF1$DateTime, "%d/%m/%Y %H:%M:%S")

png(file="plot4.png",bg="transparent",width=480,height=480)
par(mfrow=c(2,2))
with(DF1, plot(DateTime ,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)",cex=0.2))
with(DF1, plot(DateTime ,Voltage, type="l", xlab="Datetime", ylab="Voltage"))
with(DF1, plot(DateTime ,Sub_metering_1, type="l", xlab="", ylab="Energy Submetering"))
with(DF1,lines(DateTime,Sub_metering_2,type="l", col="red"))
with(DF1,lines(DateTime,Sub_metering_3,type="l", col="blue"))
with(DF1,legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")))
with(DF1, plot(DateTime ,Global_reactive_power, type="l", xlab="Datetime", ylab="Global Reactive Power (kilowatts)",cex=0.2))
dev.off()
