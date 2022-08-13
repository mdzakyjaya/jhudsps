data <- read.delim('household_power_consumption.txt', sep = ';', na.strings = '?')

head(data)
str(data)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

dt <- data.table::as.data.table(data)

ftdt <- dt[Date >= '2007-02-01' & Date <= '2007-02-02']

png('plot1.png', width = 480, height = 480)
with(ftdt, hist(Global_active_power,
                col = 'red',
                xlab = 'Global Active Power (kilowatts)', 
                main = 'Global Active Power'))

dev.off()