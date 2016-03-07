
#Plot 3

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

#create plot 3
png("plot3.png")
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
       col=c(1,2,4))
dev.off()