#Generating the Plot 2
Data<-read.table("household_power_consumption.txt",header=TRUE,sep= ";", na.strings = "?")
Data$DateAndTime<-with(Data,paste(Date,Time))
Data$DateAndTime<-strptime(Data$DateAndTime, "%d/%m/%Y %H:%M:%S")

#Preparing the date of interes (We will only be using data from the dates 2007-02-01 and 2007-02-02)
where_start<-which(Data$DateAndTime==strptime("2007-02-01", "%Y-%m-%d"))
where_finish<-which(Data$DateAndTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-Data[where_start:where_finish,]
png(file="plot2.png",width=480,height=480,units="px") #open the png device
#HISTOGRAM 2
par(mar=c(2,4,2,2))
with(data2,plot(DateAndTime,Global_active_power,type="l" ,xlab=" ",ylab="Global Active Power (Kilowatts)"))
dev.off() #closing the png device
