## set working directory to course project
setwd("C:/Users/miab blu/Desktop/copied/Coursera/exploratory data analysis/course project")

## installed data.table
library(data.table)

##imported the data and named it consumption
consumption <- fread("household_power_consumption.txt")

##filtered dates 
consumption <- consumption[Date=="1/2/2007"|Date=="2/2/2007"]

##combined time and date column into one
consumption[,time_date:=paste(Time,Date)]

##applied formatting for time_date 
consumption[,time_date:=as.POSIXct(time_date,format="%H:%M:%S %d/%m/%Y")]

##convert other columns to numeric
consumption[,Global_active_power:=as.numeric(Global_active_power)]
consumption[,Global_reactive_power:=as.numeric(Global_reactive_power)]
consumption[,Voltage:=as.numeric(Voltage)]
consumption[,Global_intensity:=as.numeric(Global_intensity)]
consumption[,Sub_metering_1:=as.numeric(Sub_metering_1)]
consumption[,Sub_metering_2:=as.numeric(Sub_metering_2)]
consumption[,Sub_metering_3:=as.numeric(Sub_metering_3)]

##Creating the histogram for the Global Active Power and the png file
png(filename="plot1.png",width=480,height=480)
par(mar=c(4,4,2,2))
hist(consumption$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

