##################################
##   Course Project 1 COURSERA  ##
##   Exploratory Data Analysis  ##
##   PLOT 1                     ##
##   08 10 2014                 ##
##################################

## load library sqldf
library(sqldf)

## reading selected file 
myfile <- "household_power_consumption.txt"
mydata <- read.csv.sql(myfile, sql = "SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007' ",sep=";",header=TRUE,comment.char="")

## creating plot and saving in png device
png("plot1.png",width=480,height=480,bg="transparent")
with(mydata,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()
