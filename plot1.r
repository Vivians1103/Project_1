setwd("C:/Users/6601051/Desktop/course/Data Plotting/Project_1")
##one possible means to load data
#q1<-read.table("household_power_consumption.txt",sep=";", header=T,nrows=7000,na.string="?")
#head(q1)
#attributes(q1$Date)
#dat<-subset(q1,Date=="1/2/2007"&Date=="2/2/2007")


#second means:
#myFile<-"SELECT*FROM file WHERE Date='01/02/2007' OR Date='02/02/2007'"
#dat<-read.csv2.sql("household_power_consumption.txt",myFile)


#third means
dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';',na.string="?")
#About the options /B /R:
#/B         Matches pattern if at the beginning of a line.
#/R         Uses search strings as regular expressions.
head(dat)
dateTime<-paste(dat$V1,dat$V2)
head(dateTime)
datetime<- strptime(dateTime,format ="%d/%m/%Y %H:%M:%S")
Dat<-data.frame(datetime,dat)
colnames(Dat)<-c("datetime","Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(Dat)

#plot1
hist(Dat$Global_active_power,main="Global Active Power", xlab = "Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()


