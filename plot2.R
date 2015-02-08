plot2<-function(){

# Read data
rs <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

# use filter to percolate until the limitation is accurate
rs1<-filter(rs,year(dmy(Date))==2007 & month(dmy(Date))==2)
rs2<-filter(rs1,day(dmy(Date))==1 | day(dmy(Date))==2)

# convert the date and time to strptime type
time<-strptime(paste(rs2$Date,rs2$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# create the png file
png("plot2.png",width=480,height=480)


#copy the graph to the file
plot(time,as.numeric(rs2$Global_active_power),ylab="Global Active Power (kilowatts)", xlab="",type="l")
dev.off()
}