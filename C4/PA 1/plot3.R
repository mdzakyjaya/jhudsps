data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?")

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

ftdt <- data[dateTime >= '2007-02-01' & dateTime < '2007-02-03']

png("plot3.png", width=480, height=480)

with(ftdt, plot(dateTime, Sub_metering_1, 
                type = 'l', xlab = '', ylab = 'Energy Sub Metering'))
with(ftdt, lines(dateTime, Sub_metering_2, col = 'red'))
with(ftdt, lines(dateTime, Sub_metering_3, col = 'blue'))
legend('topright', legend = c('Sub metering 1', 'sub metering 2',
                              'sub metering 3'),
       col = c(par('col'), 'red', 'blue'),
       lty = c(1,1), lwd = c(1,1), text.width = 0.01)

dev.off()