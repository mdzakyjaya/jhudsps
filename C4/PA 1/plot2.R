data <- read.delim('household_power_consumption.txt', sep = ';', na.strings = '?')

head(data)
str(data)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

dt <- data.table::as.data.table(data)

ftdt <- dt[Date >= '2007-02-01' & Date <= '2007-02-02']

ftdt$datetime <- as.POSIXct(paste(ftdt$Date, ftdt$Time),
                            format = '%d/%m/%Y %H:%M:%S')

png('plot2.png', width = 480, height = 480)
with(ftdt, plot(datetime, Global_active_power,
                type = 'l',
                xlab = '', 
                ylab = 'Global Active Power (kilowatts)'))

dev.off()