
# FileName: plot2.R
# Date: 4/4/17
# This assignment uses data from
# the UC Irvine Machine Learning Repository, a popular repository for machine learning
# datasets. In particular, we will be using the "Individual household electric power consumption Data Set"

# plot a line plot of Global Active Power and date and time (x-axis) for Feb. 1 and 2, 2007


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

png(filename = "Rplot2.png", width = 480, height = 480)
plot(powerSubSet$powerDtTm,powerSubSet$Global_active_power, type="l",ylab= "Global Active Power (kilowatts)", xlab ="")

dev.off()
