# Set the working directory
setwd('/Users/montesco86/Desktop/Exploratory Data Analysis/Course project 1')
# Load data
data<-read.csv('household_power_consumption.txt',
         header=TRUE,sep=';',na.string='?',
         colClasses=c("character","character","numeric",
                      "numeric","numeric","numeric",
                      "numeric","numeric","numeric"))
# Convert Date format
dataF<-data
dataF[,1]<-as.Date(data[,1],format='%d/%m/%Y')
)
# Subset data
dataSub<-subset(dataF,dataF[,1]<="2007-02-02")
dataSub<-subset(dataSub,dataSub[,1]>="2007-02-01")
time<-strptime(paste(dataSub[,1],dataSub[,2]),
               format="%Y-%m-%d %H:%M:%S")
# Plot 4: pannel
par(mfrow=c(2,2))
# ** Plot 4.1.
with(dataSub,
     plot(time,Global_active_power,
          type='l',
          main="",
          xlab="",
          ylab="Global Active Power(kilowatts)"))
# ** Plot 4.2.
with(dataSub,
     plot(time,Voltage,type='l',
          xlab='datetime',ylab='Voltage'))
# ** Plot 4.3.
with(dataSub,
     plot(time,Sub_metering_1,xlab="",ylab="Energy sub metering",main="",type="l"))
with(dataSub,lines(time,Sub_metering_2,col='red'))
with(dataSub,lines(time,Sub_metering_3,col='blue'))
legend("topright",lty=c(1,1,1),col=c('black','red','blue'),
     c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
# ** Plot 4.4.
with(dataSub,
     plot(time,Global_reactive_power,type='l',
          xlab='datetime',ylab='Global_reactive_power'))
# Export
dev.copy(png,'plot4.png',height=480,width=480,units='px')
dev.off()