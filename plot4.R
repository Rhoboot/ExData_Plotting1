#Limpieza
datos<-read.table("./household_power_consumption.txt",sep=";",header=T,
                  colClasses =c(rep("character",2),rep("numeric",7)),na="?")
datos$Time <- strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
filfecha <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datos <- subset(datos, Date %in% filfecha)

#Plot 4
par(mfrow=c(2,2))
with(datos,plot(Time,Global_active_power,
                type="l",
                ylab="Global Active Power",
                xlab=""))
with(datos,plot(Time,Voltage,
                type="l",
                ylab="Voltage",
                xlab="datetime"))
with(datos,{plot(Time,Sub_metering_1,
                 type="l",
                 ylab="Energy sub metering",
                 xlab="")
  lines(Time,Sub_metering_2,col="red")
  lines(Time,Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","blue","red"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
with(datos,plot(Time,Global_reactive_power,
                type="l",
                ylab="Global_reactive_power",
                xlab="datetime"))
dev.copy(png,file="plot4.png")
dev.off() 