README
================

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- --> \# Course
Project 2 Fine particulate matter (PM2.5) is an ambient air pollutant
for which there is strong evidence that it is harmful to human health.
In the United States, the Environmental Protection Agency (EPA) is
tasked with setting national ambient air quality standards for fine PM
and for tracking the emissions of this pollutant into the atmosphere.
Approximatly every 3 years, the EPA releases its database on emissions
of PM2.5. This database is known as the National Emissions Inventory
(NEI). You can read more information about the NEI at the [EPA National
Emissions Inventory web
site](https://www3.epa.gov/ttn/chief/eiinformation.html). For each year
and for each type of PM source, the NEI records how many tons of PM2.5
were emitted from that source over the course of the entire year. The
data that you will use for this assignment are for 1999, 2002, 2005, and
2008. \> Review criteria

For each question 1. Does the plot appear to address the question being
asked? 2. Is the submitted R code appropriate for construction of the
submitted plot? \> Data

The data for this assignment are available from the course web site as a
single zip file: [Data for Peer
Assessment 29Mb](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)
The zip file contains two files:

PM2.5 Emissions Data (summarySCC\_PM25.rds): This file contains a data
frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and
2008. For each year, the table contains number of tons of PM2.5 emitted
from a specific type of source for the entire year. Here are the first
few rows.

``` r
head(NEI)
```

    ##     fips      SCC Pollutant Emissions  type year
    ## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
    ## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
    ## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
    ## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
    ## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
    ## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
