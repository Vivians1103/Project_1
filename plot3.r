setwd("C:/Users/6601051/Desktop/course/Data Plotting/Project_1")
dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';',na.string="?")
dateTime<-paste(dat$V1,dat$V2)
datetime<- strptime(dateTime,format ="%d/%m/%Y %H:%M:%S")
Dat<-data.frame(datetime,dat)
colnames(Dat)<-c("datetime","Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(Dat)

with(Dat,plot(datetime,Sub_metering_1,type="l",pch=20,xlab=" ",ylab="Energy sub metering"))
with(Dat,lines(datetime,Sub_metering_2,pch=20,col="red"))
with(Dat,lines(datetime,Sub_metering_3,pch=20,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()
