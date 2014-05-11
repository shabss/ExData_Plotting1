
source("plot_common.R")

plot1Mf <- function(IsMf) {
    
    hpc <- plot.get_data()
    
    hist(hpc$Global_active_power, col="red",
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    
    if (!IsMf) {
        plot.save_data("plot1.png")
    }
}

plot1 <- function() {
    invisible(plot1Mf(FALSE))
}


