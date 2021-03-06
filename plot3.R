library(tidyverse)

#Read data
df = read.table("R:/Projects/Data Science Specialization/4. Exploratory Data Analysis/4. Exploratory Data Analysis/Week 1/household_power_consumption.txt", 
                header = T, sep =";", stringsAsFactors = F, dec=".") %>% 
        filter(Date %in% c("1/2/2007","2/2/2007")) %>% 
        as.data.frame()

datetime = strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower = as.numeric(df$Global_active_power)
subMetering1 = as.numeric(df$Sub_metering_1)
subMetering2 = as.numeric(df$Sub_metering_2)
subMetering3 = as.numeric(df$Sub_metering_3)

setwd("R:/Projects/Data Science Specialization/4. Exploratory Data Analysis/4. Exploratory Data Analysis/Week 1/Assignment/")
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
