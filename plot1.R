
source("plot_common.R")

#Plot1 function for multi frame
plot1Mf <- function(IsMf) {
    
    hpc <- plot.get_data()
    
    hist(hpc$Global_active_power, col="red",
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    
    if (!IsMf) {
        plot.save_data("plot1.png")
    }
}

#Plot1 function for single frame
plot1 <- function() {
    invisible(plot1Mf(FALSE))
}


