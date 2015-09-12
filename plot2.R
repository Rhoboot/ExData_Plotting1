#Limpieza
datos<-read.table("./household_power_consumption.txt",sep=";",header=T,
                  colClasses =c(rep("character",2),rep("numeric",7)),na="?")
datos$Time <- strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
filfecha <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datos <- subset(datos, Date %in% filfecha)

#Plot 2
with(datos,plot(Time,Global_active_power,
                type="l",
                ylab="Global Active Power (kilowatts)",
                xlab=""))
dev.copy(png,file="plot2.png")
dev.off()