source("load_data.R")
df <- load.data()

png(filename="plot3.png",width = 480, height = 480)

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
       lty=1)

dev.off()