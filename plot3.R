# FileName: plot3.R
# Date: 4/4/17
# This assignment uses data from
# the UC Irvine Machine Learning Repository, a popular repository for machine learning
# datasets. In particular, we will be using the "Individual household electric power consumption Data Set"

# plot a line plot of Sub_metering_1, Sub_metering_2, Sub_metering_3 over the same plot and
# date and time (x-axis) for Feb. 1 and 2, 2007
# Include the legend

# rm(list=ls())
# 
# setwd("c:/WorkingR/Course4Week1/Project")
# 
# fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# 
# 
# if(!file.exists("data")) {dir.create("data")}
# 
# download.file(fileUrl, destfile = file.path("data", "exdataDataHousehold_power_consumption.zip"))
# 
# unzip(zipfile=file.path("data", "exdataDataHousehold_power_consumption.zip"),exdir="data")

initread <- read.table(file.path("data","household_power_consumption.txt"), header = TRUE, sep = ";", comment.char = "", na.strings = "?", nrows= 10, numerals = c("no.loss"), stringsAsFactors = FALSE)
initread

classes <- sapply(initread,class)
#classes[1:2] <- "character"  - no need if stringsAsFactors = FALSE
powerConsum <- read.table(file.path("data","household_power_consumption.txt"), header = TRUE, sep = ";", comment.char = "", colClasses = classes, na.strings = "?",  numerals = c("no.loss"),stringsAsFactors = FALSE )
powerSubSet <- powerConsum[(powerConsum$Date=="1/2/2007"|powerConsum$Date=="2/2/2007"),]

# convert character field: Date and Time to date time
powerSubSet$powerDtTm = strptime(paste(powerSubSet$Date,powerSubSet$Time),"%e/%m/%Y %H:%M:%S")

# class(powerSubSet$powerDtTm)
# [1] "POSIXlt" "POSIXt" 

#set up plot line color
plotCol <- c("gray","red", "blue")

png(filename = "Rplot3.png", width = 480, height = 480)

with(powerSubSet, plot(powerDtTm,Sub_metering_1, type="l", col=plotCol[1],ylab="Energy sub metering",xlab=""))
with(powerSubSet, points(powerDtTm,Sub_metering_2, type="l", col=plotCol[2]))
with(powerSubSet, points(powerDtTm,Sub_metering_3, type="l", col=plotCol[3]))
legend("topright", lwd = 3,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col= plotCol)

dev.off()
