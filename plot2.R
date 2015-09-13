epc <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
epc_plot <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

epc_plot <- transform(epc_plot, Date = as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %T"))
epc_plot[,3:8] <- lapply(epc_plot[,3:8], as.numeric)

png("plot2.png")
with(epc_plot, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))
dev.off()