install.packages('tidyverse')
library(readr)
data <- read_csv(file.choose())

head(data)
colnames(data)
data[47,]
summary(data)
sum(is.na(data$Ozone))
which(is.na(data$Ozone))
summary(data)
summary(data, na.rm = TRUE)

mean(data$Ozone, na.rm = TRUE)

mean(data[which(data$Ozone>31 & data$Temp>90),]$Solar.R)

mean(data[which(data$Month == 6),]$Temp)

max(data[which(data$Month == 5),]$Ozone, na.rm = TRUE)

x[x %in% 10:12] <- 3
