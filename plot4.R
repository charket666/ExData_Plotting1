#setwd to ExData_Plotting1 directory before running

#Read in entire file to hpc_all
hpc_all<-read.table("household_power_consumption.txt", sep=";", dec=",",header=TRUE)

#Get data for dates of interest
hpc<-hpc_all[hpc_all$Date=="1/2/2007" | hpc_all$Date=="2/2/2007",]

#Remove hpc_all as it is no longer needed
rm(hpc_all)

#Create png
png("plot4.png",height=480,width=480,unit="px")

max=length(hpc$Sub_metering_1)
days=c("Thu","Fri","Sat")

par(mfcol=c(2,2))

#ADD GLOBAL ACTIVE POWER PLOT
plot(as.numeric(as.vector(hpc$Global_active_power)),type='l',xaxt="n",xlab="",ylab="Global Active Power")
axis(1, at=c(0,max/2,max), labels=days)

#ADD SUB METERING PLOT
plot(as.numeric(as.vector(hpc$Sub_metering_1)),type='l',xaxt="n",xlab="",ylab="Energy sub metering",col="black")
lines(as.numeric(as.vector(hpc$Sub_metering_2)),type='l',col="red")
lines(as.numeric(as.vector(hpc$Sub_metering_3)),type='l',col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
axis(1, at=c(0,max/2,max), labels=days)

#ADD VOLTAGE PLOT
plot(as.numeric(as.vector(hpc$Voltage)),type='l',xaxt="n",xlab="datetime",ylab="Voltage")
axis(1, at=c(0,max/2,max), labels=days)

#ADD GLOBAL REACTIVE POWER PLOT
plot(as.numeric(as.vector(hpc$Global_reactive_power)),type='l',xaxt="n",xlab="datetime",ylab="Global_reactive_power")
axis(1, at=c(0,max/2,max), labels=days)

dev.off()