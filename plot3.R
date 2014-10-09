##################################
##   Course Project 1 COURSERA  ##
##   Exploratory Data Analysis  ##
##   PLOT 3                     ##
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
png("plot3.png",width=480,height=480,bg="transparent")
with(mydata, {
  plot(datetime,Sub_metering_1,type='l',xlab='',ylab='',col='black')
  lines(datetime,Sub_metering_2,col='red')
  lines(datetime,Sub_metering_3,col='blue')
  title(ylab='Energy sub metering')
  legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})
dev.off()
