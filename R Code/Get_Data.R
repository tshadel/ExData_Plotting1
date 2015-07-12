# Set working directory
setwd("C:/Users/tshadel/Documents")

# Required packages
library(data.table)
library(lubridate)

# Directory Check
if (!file.exists('ExplorData')) {
  dir.create('ExplorData')
}

# File Check and Generation if necessary
if (!file.exists('ExplorData/power_consumption.txt')) {
  
  # Download and Unzip File
  file.url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url, destfile='ExplorData/power_consumption.zip')
  unzip('ExplorData/power_consumption.zip', exdir='ExplorData', overwrite=TRUE)
  
  # Read Table and Specify the 2 Days
  variable.class = c(rep('character',2), rep('numeric',7))
  power.consumption = read.table('ExplorData/household_power_consumption.txt', header=TRUE,
                                sep=';', na.strings='?', colClasses=variable.class)
  power.consumption = power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
  # Assign Variable Names and Date/Time Fields
  cols = c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  colnames(power.consumption) = cols
  power.consumption$DateTime = dmy(power.consumption$Date) + hms(power.consumption$Time)
  power.consumption = power.consumption[,c(10,3:9)]
  
  # Write Data File to Directory
  write.table(power.consumption, file='ExplorData/power_consumption.txt', sep='|', row.names=FALSE)
} else {
  
  power.consumption = read.table('ExplorData/power_consumption.txt', header=TRUE, sep='|')
  power.consumption$DateTime = as.POSIXlt(power.consumption$DateTime)
  
}

# Remove the Raw Data File 
if (file.exists('ExplorData/household_power_consumption.txt')) {
  x = file.remove('ExplorData/household_power_consumption.txt')
}