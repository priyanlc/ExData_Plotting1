#plot 2
library(sqldf)
fn <- "household_power_consumption.txt"
DF1 <- read.csv2.sql(fn, sql = "select * from file where Date in(\"1/2/2007\",\"2/2/2007\")", na.strings = "NA")
DF1$DateTime <- apply(DF1[, c("Date", "Time")], 1, paste, collapse = " ")
DF1$DateTime = strptime(DF1$DateTime, "%d/%m/%Y %H:%M:%S")
#par(mfrow=c(1,1))
png(file="plot2.png",bg="transparent",width=480,height=480)
with(DF1, plot(DateTime ,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") )
dev.off()