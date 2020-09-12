#Downloading data if not exists
if(!file.exists(file="summarySCC_PM25.rds")||
   !file.exists(file="Source_Classification_Code.rds")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                destfile = "data.zip")
  unzip("data.zip")
}
#Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Have total emissions from PM2.5 decreased in the United States
#from 1999 to 2008? Using the base plotting system, make a plot
#showing the total PM2.5 emission from all sources for each 
#of the years 1999, 2002, 2005, and 2008.
p1 <- tapply(NEI$Emissions, NEI$year, sum)
#Opening png
png(filename = "plot1.png",width = 480, height = 480)
#Creating plot
plot(p1,x = names(p1),type = "l",main = "total PM2.5 emission",
     ylab = "Emissions (in tons)",xlab = "Year")
#Closing device
dev.off()