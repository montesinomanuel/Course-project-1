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

# Plot 1: Histogram
with(dataSub,
     hist(Global_active_power,
          main='Global Active Power',
          xlab='Global Active Power(kilowatts)',
          ylab='Frequency',
          col='red'))
# Export
dev.copy(png,file='plot1.png',height=480,width=480,units='px')
dev.off()