#setwd to ExData_Plotting1 directory before running

#Read in entire file to hpc_all
hpc_all<-read.table("household_power_consumption.txt", sep=";", dec=",",header=TRUE)

#Get data for dates of interest
hpc<-hpc_all[hpc_all$Date=="1/2/2007" | hpc_all$Date=="2/2/2007",]

#Remove hpc_all as it is no longer needed
rm(hpc_all)

#Create png
png("plot3.png",height=480,width=480,unit="px")

#Plot Sub_metering_1 in black
plot(as.numeric(as.vector(hpc$Sub_metering_1)),type='l',xaxt="n",xlab="",ylab="Energy sub metering",col="black")

#Add Sub_metering_2 in red
lines(as.numeric(as.vector(hpc$Sub_metering_2)),type='l',col="red")

#Add Sub_metering_3 in blue
lines(as.numeric(as.vector(hpc$Sub_metering_3)),type='l',col="blue")

#Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#Add days at appropriate locations on x axis
max=length(hpc$Sub_metering_1)
axis(1, at=c(0,max/2,max), labels=c("Thu","Fri","Sat"))

dev.off()