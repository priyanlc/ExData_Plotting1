# plot 1
library(sqldf)
fn <- "household_power_consumption.txt"
DF1 <- read.csv2.sql(fn, sql = "select * from file where Date in(\"1/2/2007\",\"2/2/2007\")", na.strings = "NA")
png(file="plot1.png",bg="transparent",width=480,height=480)
with(DF1, hist(Global_active_power, col = "red", xlab = "Global Active Power (killowats)", main = "Global Active Power"))
dev.off()







