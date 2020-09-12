#Downloading data if not exists
if (!file.exists(file = "summarySCC_PM25.rds") ||
    !file.exists(file = "Source_Classification_Code.rds")) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                destfile = "data.zip")
  unzip("data.zip")
}
#Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Of the four types of sources indicated by the type
#(point, nonpoint, onroad, nonroad) variable, which of these
#four sources have seen decreases in emissions from
#1999–2008 for Baltimore City? Which have seen increases
#in emissions from 1999–2008? Use the ggplot2 plotting system
library(ggplot2)
library(reshape2)
baltimore <- NEI[NEI$fips == "24510", ]
baltMelt <-
  melt(baltimore, id = c("fips", "SCC", "Pollutant", "type", "year"))
endBalt <- dcast(baltMelt, type + year ~ variable, sum)
#Opening png
png(filename = "plot3.png",width = 480, height = 480)
#Creating plot
c <- ggplot(endBalt , aes(year, Emissions,col=type))
c + geom_line(size = 2)+ labs(title = "total PM2.5 emission",
  subtitle = "in the Baltimore City, Meriland",
  y = "Emissions (in tons)",
  x = "Year")
#Closing device
dev.off()