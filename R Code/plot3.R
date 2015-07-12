# Set working directory
setwd("C:/Users/tshadel/Documents")

# Directory Check
if(!file.exists('Plots')){
  dir.create('Plots')
}

# Retreive Data
source('Get_Data.R')

# Open Device
png(filename='Plots/plot3.png',width=480,height=480,units='px')

# Plot Data
lncol = c('black','red','blue')
lbls = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime, power.consumption$SubMetering1, type='l', col=lncol[1], xlab='', ylab='Energy sub metering')
lines(power.consumption$DateTime, power.consumption$SubMetering2, col=lncol[2])
lines(power.consumption$DateTime, power.consumption$SubMetering3, col=lncol[3])

# add legend
legend('topright', legend=lbls, col=lncol, lty='solid')

# close device
x = dev.off()