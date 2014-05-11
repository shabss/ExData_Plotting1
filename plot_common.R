#This file contains helper functions that are used for
#rest of the plotting files

library(data.table)


#plot.get_data : Downlods house power consumption data from the url
#                and locally and unzips. Then subsets the data to return
#                only the rows corresponding to dates 01-Feb-2007 &
#                02-Feb-2007. Converts values to their numeric equivalents
plot.get_data <- function() {
    
    file.name <- "household_power_consumption.txt"
    if (!file.exists(file.name)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        print(sprintf("File %s does not exist.\nDownloading from %s", file.name, url))
        
        download.file(url, "hpc.zip", mode="wb")
        unzip("hpc.zip")
        if (!file.exists(file.name)) {
            stop("Unable to download or unzip. Exitting ....")
        }
    }
    
    #prepare numeric dates to be used for subsetting later
    d1 <- as.numeric(as.Date("01/02/2007", format="%d/%m/%Y"))
    d2 <- as.numeric(as.Date("02/02/2007", format="%d/%m/%Y"))
    
    #read file. #due to a na.strings bug in fread, reading all cols as "character"
    #cls <- c(rep("character", 2), rep("numeric", 7))
    data.hpc <- fread(file.name, sep=";", na.strings=c("?"), colClasses="character")
    
    #subset based on dates between 01/Feb/2007 to 02/Feb/2007 
    data.hpc[, Date.numeric := as.numeric(as.Date(Date, format="%d/%m/%Y"))]
    data.hpc <- data.hpc[Date.numeric >= d1 & Date.numeric <= d2, ]

    #Convert columns 3 and onwards to numeric
    data.hpc.numeric <- data.hpc[, lapply(.SD, as.numeric), .SDcols = 3:ncol(data.hpc)]
    
    #Add numeric time column back and set names properly
    data.hpc <- cbind(data.hpc.numeric, Time.numeric=as.numeric(strptime(data.hpc$Time, format="%H:%M:%S")))
    setnames(data.hpc, tail(colnames(data.hpc), 2), c("Date", "Time"))
    data.hpc
}


#plot.save_data : Saves the plot from video graphics device to png device

plot.save_data <- function(filename){
    dev.copy(png, file=filename, width = 480, height = 480)
    dev.off()
}

#plot.set_par : Sets values for par
plot.set_par <- function(){
    
    par(cex = 0.7)
}
