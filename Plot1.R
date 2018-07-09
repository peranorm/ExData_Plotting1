library(tidyverse)

#Read data
df = read.table("R:/Projects/Data Science Specialization/4. Exploratory Data Analysis/4. Exploratory Data Analysis/Week 1/household_power_consumption.txt", 
                header = T, sep =";", stringsAsFactors = F, dec=".") %>% 
        filter(Date %in% c("1/2/2007","2/2/2007")) %>% 
        as.data.frame()

df$Global_active_power = as.numeric(df$Global_active_power)
setwd("R:/Projects/Data Science Specialization/4. Exploratory Data Analysis/4. Exploratory Data Analysis/Week 1/Assignment/")
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts")
dev.off()