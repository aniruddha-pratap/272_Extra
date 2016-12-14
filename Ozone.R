setwd('C:/Users/Aniruddha/Desktop')
data<-read.csv('272_Ozone_DailyData.csv')
data_file<-read.csv('272_Ozone_DailyData.csv')
head(data)
head(data_file)
install.packages('ggplot2')
library(ggplot2)
install.packages('colorspace')
library(colorspace)
y=c(1:length(data_file$DAILY_AQI_VALUE))
newDate<-as.Date(data_file$Date, "%m/%d/%Y")
date<-strftime(newDate, "%m")
ggplot(data_file) + geom_point(aes(x = date, y = data_file$DAILY_AQI_VALUE, colour =  data_file$DAILY_AQI_VALUE<50)) + 
	scale_colour_manual(name= 'Ozone > 50', values = setNames(c('green','red'), c(T, F))) + xlab('Month') + ylab('Ozone')

n<-data_file[with(data_file, order(-DAILY_AQI_VALUE)),][1:5,]
print(n)
aqi<-n$DAILY_AQI_VALUE
aqiDate<-as.Date(n$Date, "%m/%d/%Y")
print(aqiDate)
n$Date
barplot(aqi, names.arg = aqiDate, xlab="Date", ylab="AQI", col="brown")


