epc <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
epc_plot <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

epc_plot <- transform(epc_plot, Date = as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %T"))
epc_plot[,3:8] <- lapply(epc_plot[,3:8], as.numeric)

png("plot3.png")
with(epc_plot, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(epc_plot, points(Time, Sub_metering_1, type="l", col="black", xlab="", ylab=""))
with(epc_plot, points(Time, Sub_metering_2, type="l", col="red", xlab="", ylab=""))
with(epc_plot, points(Time, Sub_metering_3, type="l", col="blue", xlab="", ylab=""))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()