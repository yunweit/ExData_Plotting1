library(sqldf)
household <- read.csv.sql("household_power_consumption.txt",
                          sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                          sep = ";")
household$Date_Time <- paste(household$Date, household$Time)
household$Date_Time <- strptime(household$Date_Time, "%d/%m/%Y %H:%M:%S")


with(household, hist(Global_active_power, col = "red", main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

