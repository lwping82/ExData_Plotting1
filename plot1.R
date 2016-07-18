# This program is to examine and reconstruct plots based on how household energy usage varies over a 2-day period in February, 2007 using
# data obtained from UC Irvine Machine Learning Repository (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
#
# The objectives of this program is to:
# 1. Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# 2. Name each of the plot files as plot1.png, plot2.png, etc.
# 3. Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
#    Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
# 4. Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

library(lubridate)

# common variables for this program
dataSet <- NULL

# function to load the data set into momery for processing
loadData <- function() {
  # 1. Loading data sets
  tempSet <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", comment.char="", stringsAsFactors = FALSE)

  # 2. Subsetting required data from the loaded data set
  dataSet <<- subset(tempSet, tempSet$Date=="1/2/2007"|tempSet$Date=="2/2/2007")
  
  # 3. Change the data type for the variables Date and Time
  dataSet$Date <<- dmy(dataSet$Date)
  dataSet$Time <<- hms(dataSet$Time)  
  
  # 4. Remove the unwanted data set
  rm(tempSet)
}

# function to plot and generate the graph into png image file
plotGraph <- function() {
  png(filename="plot1.png", width=480, height=480, units="px")
  hist(dataSet$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")
  dev.off()  
}

# function to kick start the whole program
main <- function() {
  # Step 1: load the data set into momery for processing
  loadData()
  
  # Generate the graph into png image file
  plotGraph()
}

# function to test this solution
# directory - set the directory up until the extracted data set's root level (EG. "c:\\UCI HAR Dataset" in Windows).
test <- function(directory) {
  setwd(directory)
  
  main()
}