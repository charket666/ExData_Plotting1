#setwd to ExData_Plotting1 directory before running

#Read in entire file to hpc_all
hpc_all<-read.table("household_power_consumption.txt", sep=";", dec=",",header=TRUE)

#Get data for dates of interest
hpc<-hpc_all[hpc_all$Date=="1/2/2007" | hpc_all$Date=="2/2/2007",]

#Remove hpc_all as it is no longer needed
rm(hpc_all)

#Create png
png("plot1.png",height=480,width=480,unit="px")

#Draw histogram of Global active power 
hist(as.numeric(as.vector(hpc$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()