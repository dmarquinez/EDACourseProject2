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
#Have total emissions from PM2.5 decreased in the Baltimore 
#City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question
baltimore <- NEI[NEI$fips=="24510",]
p2 <- tapply(baltimore$Emissions, baltimore$year, sum)
#Opening png
png(filename = "plot1.png",width = 480, height = 480)
#Creating plot
plot(p2,x = names(p2),type = "l",main = "total PM2.5 emission",
     ylab = "Emissions (in tons)",xlab = "Year")
#Closing device
dev.off()

