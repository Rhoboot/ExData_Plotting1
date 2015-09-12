#Limpieza
datos<-read.table("./household_power_consumption.txt",sep=";",header=T,
                  colClasses =c(rep("character",2),rep("numeric",7)),na="?")
datos$Time <- strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
filfecha <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datos <- subset(datos, Date %in% filfecha)

#Plot 1
with(datos,hist(Global_active_power,
                col="red",
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power"))
dev.copy(png,file="plot1.png")
dev.off()