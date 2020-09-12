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
#Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County,
#California (fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?
library(ggplot2)
library(reshape2)
library("dplyr")
#Both cities
both <- NEI[NEI$fips=="24510"|NEI$fips=="06037",]
#Filter emissions from motor vehicle sources
index <- c()
for(i in 1:length(names(SCC))){
  index <- union(index,grep("vehicle",ignore.case = TRUE,SCC[,i]))
}
vehicle <- NEI[index,"SCC"]
vehicleFilt <- filter(both, both$SCC %in% vehicle )
bothMelt <-
  melt(vehicleFilt, id = c("fips", "SCC", "Pollutant", "type", "year"))
endBoth <- dcast(bothMelt, fips + year ~ variable, sum)
endBoth$fips <- as.factor(endBoth$fips)
#Changing levels for the legend
levels(endBoth$fips) <- c("Los Angeles County","Baltimore City")
names(endBoth)[1] <- "city"
#Opening png
png(filename = "plot6.png",width = 480, height = 480)
#Creating graph
a <- ggplot(endBoth,aes(year,Emissions,col=city))
a+geom_line(size=2)+ labs(title = "total PM2.5 emission",
                                       subtitle = "from motor vehicle sources",
                                       y = "Emissions (in tons)",
                                       x = "Year")

#Closing device
dev.off()