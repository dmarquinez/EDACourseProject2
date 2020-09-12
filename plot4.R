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
#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999–2008?
library(ggplot2)
library(reshape2)
library("dplyr")
indexCoal <- grep("Coal",SCC$EI.Sector,ignore.case = TRUE)
indexCoal2 <- grep("coal",SCC$Short.Name,ignore.case = TRUE)
indexSCC <- SCC[union(indexCoal,indexCoal2),"SCC"]
coal <- filter(NEI, NEI$SCC %in% indexSCC )
p1 <- tapply(coal$Emissions, coal$year, sum)
#Opening png
png(filename = "plot4.png",width = 480, height = 480)
#Creating plot
a <- ggplot(df,aes(year,Emissions,group=1))
a+geom_line(size=2,col="brown")+ labs(title = "total PM2.5 emission in US",
                                      subtitle = "from coal combustion-related sources",
                                      y = "Emissions (in tons)",
                                      x = "Year")
#Closing device
dev.off()
