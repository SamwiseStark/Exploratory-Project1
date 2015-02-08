plot4<-function(){

# Read data
rs <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

# use filter to percolate until the limitation is accurate
rs1<-filter(rs,year(dmy(Date))==2007 & month(dmy(Date))==2)
rs2<-filter(rs1,day(dmy(Date))==1 | day(dmy(Date))==2)

# convert date and time to strptime type
time<-strptime(paste(rs2$Date,rs2$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# create the png file
png("plot4.png",width=480,height=480)

# the graph device is going to fill column first, with 4 graphs being drawn
par(mfcol=c(2,2))

# copy graphs to file
# figure1
plot(time,as.numeric(rs2$Global_active_power),ylab="Global Active Power (kilowatts)", xlab="",type="l")

#figure2
plot(time,as.numeric(rs2$Sub_metering_1),,ylab="Energy sub metering",xlab="",type="n")
lines(time,as.numeric(rs2$Sub_metering_1),col="black",type="l")
lines(time,as.numeric(rs2$Sub_metering_2),col="red",type="l")
lines(time,as.numeric(rs2$Sub_metering_3),col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)

# figure3
plot(time,as.numeric(rs2$Voltage),ylab="Voltage", xlab="date time",type="l",col="black")

# figure4
plot(time,as.numeric(rs2$Global_reactive_power),ylab="Global_reactive_power", xlab="date time",type="l",col="black")
dev.off()
}