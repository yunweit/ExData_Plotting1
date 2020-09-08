library(sqldf)
household <- read.csv.sql("household_power_consumption.txt",
                          sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                          sep = ";")
household$Date_Time <- paste(household$Date, household$Time)
household$Date_Time <- strptime(household$Date_Time, "%d/%m/%Y %H:%M:%S")


with(household, plot(Date_Time, Global_active_power, type = 'l',
                     xlab = '', ylab = 'Global Active Power (kilowatts)'))

