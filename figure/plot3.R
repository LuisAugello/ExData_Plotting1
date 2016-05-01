#Generating the Plot 3
Data<-read.table("household_power_consumption.txt",header=TRUE,sep= ";", na.strings = "?")
Data$DateAndTime<-with(Data,paste(Date,Time))
Data$DateAndTime<-strptime(Data$DateAndTime, "%d/%m/%Y %H:%M:%S")

#Preparing the date of interes (We will only be using data from the dates 2007-02-01 and 2007-02-02)
where_start<-which(Data$DateAndTime==strptime("2007-02-01", "%Y-%m-%d"))
where_finish<-which(Data$DateAndTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-Data[where_start:where_finish,]
png(file="plot3.png",width=480,height=480,units="px") #open the png device
#HISTOGRAM 3
par(mar=c(2,4,2,2))
with(data2,plot(DateAndTime,Sub_metering_1,type="l" ,xlab=" ",ylab="Energy Sub Metering"))
with(data2,lines(DateAndTime,Sub_metering_2,type="l",col="red" ))
with(data2,lines(DateAndTime,Sub_metering_3,type="l",col="blue" ))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off() #closing the png device
