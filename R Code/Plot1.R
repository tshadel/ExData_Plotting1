# Set working directory
setwd("C:/Users/tshadel/Documents")

# Directory Check
if(!file.exists('Plots')){
  dir.create('Plots')
}

# Retrieve Data
source('Get_Data.R')

# Open Device
png(filename = 'Plots/plot1.png', width=480, height=480, units='px')

# Plot Data
hist(power.consumption$GlobalActivePower, main='Global Active Power', xlab = 'Global Activity Power (kilowatts)',col='red')

# Turn off device
x = dev.off()
