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

##Creating the plot 4 and the png file
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,2),cex=0.8)

## topleft graph (plot2)
plot(consumption$time_date, consumption$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

##top-right graph
plot(consumption$time_date, consumption$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

##bottom-left graph (plot3)
plot(consumption$time_date, consumption$Sub_metering_1,
     type="l",     
     xlab="",
     ylab="Energy sub metering",
)
points(consumption$time_date, consumption$Sub_metering_2,
       type="l", 
       col="red")
points(consumption$time_date, consumption$Sub_metering_3,
       type="l", 
       col="blue")
legend("topright",
       legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       pch=NA,
       bty="n")

##bottom-right graph
plot(consumption$time_date, consumption$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
