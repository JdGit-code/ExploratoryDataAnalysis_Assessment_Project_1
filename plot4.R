source("load_data.R")
df <- load.data()

png(filename="plot4.png",width = 480, height = 480)

par(mfcol=c(2,2))
plot(df$Time,df$Global_active_power,
     main="",
     xlab="",
     ylab="Global Active Power",
     type="l")
plot(df$Time,as.numeric(df$Sub_metering_1),
     main="",
     xlab="",
     ylab="Energy sub metering",
     type="l")
lines(df$Time,as.numeric(df$Sub_metering_2), col="red")
lines(df$Time,as.numeric(df$Sub_metering_3), col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")
plot(df$Time,df$Voltage,
     main="",
     xlab="datetime",
     ylab="Voltage",
     type="l")
plot(df$Time,df$Global_reactive_power,
     main="",
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")

dev.off()

