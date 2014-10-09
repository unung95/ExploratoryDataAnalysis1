##################################
##   Course Project 1 COURSERA  ##
##   Exploratory Data Analysis  ##
##   PLOT 4                     ##
##   08 10 2014                 ##
##################################

## Load library sqldf
library(sqldf)

## reading selected file 
myfile <- "household_power_consumption.txt"
mydata <- read.csv.sql(myfile, sql = "SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007' ",sep=";",header=TRUE,comment.char="")

## Formatting Date Time
mydata$Date -> myDate
mydata$Time -> myTime
mydata$datetime <- paste(as.Date(myDate,format="%d/%m/%Y"),myTime)
as.POSIXct(mydata$datetime) -> mydata$datetime

## Creating plot and saving in png device
png("plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))
with(mydata, {
  plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
  plot(datetime,Voltage,type="l",ylab="Voltage",main="")
  plot(datetime,Sub_metering_1,type='l',xlab='',ylab='',col='black')
  lines(datetime,Sub_metering_2,col='red')
  lines(datetime,Sub_metering_3,col='blue')
  title(ylab='Energy sub metering')
  legend("topright", lty = 1, bty="n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(datetime,Global_reactive_power,type="l",ylab="Global_reactive_power",main="")
})
dev.off()
