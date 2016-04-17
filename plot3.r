# plot 3
library(sqldf)
fn <- "household_power_consumption.txt"
DF1 <- read.csv2.sql(fn, sql = "select * from file where Date in(\"1/2/2007\",\"2/2/2007\")", na.strings = "NA")
DF1$DateTime <- apply(DF1[, c("Date", "Time")], 1, paste, collapse = " ")
DF1$DateTime = strptime(DF1$DateTime, "%d/%m/%Y %H:%M:%S")
#par(mfrow=c(1,1))
png(file="plot3.png",bg="transparent",width=480,height=480)
with(DF1, plot(DateTime ,Sub_metering_1, type="l", xlab="", ylab="Energy Submetering"))
with(DF1,lines(DateTime,Sub_metering_2,type="l", col="red"))
with(DF1,lines(DateTime,Sub_metering_3,type="l", col="blue"))
with(DF1,legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")))
dev.off()