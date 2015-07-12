# Set working directory
setwd("C:/Users/tshadel/Documents")

# Directory Check
if(!file.exists('Plots')){
  dir.create('Plots')
}

# Retreive Data
source('Get_Data.R')

# Open Device
png(filename = 'Plots/plot2.png', width=480, height=480, units='px')

# Plot Data
plot(power.consumption$DateTime, power.consumption$GlobalActivePower, ylab='Global Active Power (kilowatts)', xlab = '',type='l')

# Turn off Device
x = dev.off()
