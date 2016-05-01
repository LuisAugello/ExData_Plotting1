setwd("C:/Users/luisalfonso/Music/Documents/Cursera/Exploratory Data Analysis")

Data<-read.table("household_power_consumption.txt",header=TRUE,sep= ";", na.strings = "?")
Data$DateAndTime<-with(Data,paste(Date,Time))
Data$DateAndTime<-strptime(Data$DateAndTime, "%d/%m/%Y %H:%M:%S")

#Preparing the date of interes (We will only be using data from the dates 2007-02-01 and 2007-02-02)
where_start<-which(Data$DateAndTime==strptime("2007-02-01", "%Y-%m-%d"))
where_finish<-which(Data$DateAndTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-Data[where_start:where_finish,]
png(file="plot1.png",width=480,height=480,units="px") #open the png device
#HISTOGRAM 1
with(data2,hist(Global_active_power,col="red",main="Global Active Power",ylab="Frecuency", xlab="Global Active Power (Kilowatts)"))
dev.off() #closing the png device




