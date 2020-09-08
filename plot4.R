library(sqldf)
household <- read.csv.sql("household_power_consumption.txt",
                          sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                          sep = ";")
household$Date_Time <- paste(household$Date, household$Time)
household$Date_Time <- strptime(household$Date_Time, "%d/%m/%Y %H:%M:%S")


with(household, {par(mfrow = c(2,2))
    plot(Date_Time, Global_active_power, type = 'l', xlab = '',
         ylab = 'Global Active Power')
    plot(Date_Time, Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
    plot(Date_Time, Sub_metering_1, type = 'l',
         xlab = '', ylab = 'Energy Sub metering')
    lines(Date_Time, Sub_metering_2, type = 'l', col = 'red')
    lines(Date_Time, Sub_metering_3, type = 'l', col = 'blue')
    legend("topright", lty = 1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c('black', 'red', 'blue'), cex = 0.6)
    plot(Date_Time, Global_reactive_power, type = 'l', xlab = 'datetime',
         ylab = "Global_reactive_power")})

