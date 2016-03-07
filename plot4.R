
#Plot 4

#get data if needed
file<-"data.zip"
if(!file.exists(file)){
      url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url,file)
}

if (!file.exists("household_power_consumption")) { 
      unzip(file) 
}

#read in data
data<-read.table("household_power_consumption.txt", stringsAsFactors=F, header=T, sep=";")
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#create plot 4
png("plot4.png")
par(mfcol=c(2, 2), mar=c(4, 4, 2, 1), oma=c(2,0,3,2))

with(data,
     plot(datetime, 
          Global_active_power,
          type='l', 
          xlab='',
          ylab='Global Active Power (kilowatts)'))
with(data, 
     plot(datetime, 
          as.numeric(Sub_metering_1), 
          type='l',
          xlab="",
          ylab="Energy sub metering"))
with(data, 
     lines(datetime, 
           as.numeric(Sub_metering_2),
           type='l', 
           col='red'))
with(data, 
     lines(datetime,
           as.numeric(Sub_metering_3), 
           type='l', 
           col='blue'))
legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c(1,2,4),
       bty="n")
with(data,
     plot(datetime,
          as.numeric(Voltage),
          type='l',
          xlab='datetime',
          ylab='Voltage'))
with(data,
     plot(datetime,
          as.numeric(Global_reactive_power),
          type='l',
          xlab='datetime',
          ylab='Global_reactive_power'))
dev.off()