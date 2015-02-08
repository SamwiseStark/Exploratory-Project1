plot1<-function(){

# Read data
rs <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

# use filter to percolate until the limitation is accurate
rs1<-filter(rs,month(dmy(Date))==2&year(dmy(Date))==2007)
rs2<-filter(rs1,day(dmy(Date))==1 | day(dmy(Date))==2)

rs3<-select(rs2,Global_active_power)

# create the png file
png("plot1.png",width=480,height=480)

#copy the graph to the file
hist(as.numeric(rs3$Global_active_power),col="red",main="Global Active Power"
,xlab="Global Active Power (kilowatts)")
dev.off()
}