source("load_data.R")
df <- load.data()

png(filename="plot2.png",width = 480, height = 480)

plot(df$Time,df$Global_active_power,
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")

dev.off()