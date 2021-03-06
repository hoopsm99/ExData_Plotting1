
#Plot 2

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

#create plot 2
png("plot2.png")
with(data,
     plot(datetime, 
          as.numeric(Global_active_power),
          type='l', 
          xlab='',
          ylab='Global Active Power (kilowatts)'))
dev.off()