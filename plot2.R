##################################
##   Course Project 1 COURSERA  ##
##   Exploratory Data Analysis  ##
##   PLOT 2                     ##
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
png("plot2.png",width=480,height=480,bg="transparent")
with(mydata, plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main=""))
dev.off()
