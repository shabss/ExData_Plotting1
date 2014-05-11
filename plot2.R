source("plot_common.R")

#######################
#######################

#Plot2 function for multi frame
plot2Mf <- function(IsMf) {
    hpc <- plot.get_data()
    ylab <- if (IsMf) {
        "Global Active Power"
    } else {
        "Global Active Power (kilowatts)"
    }
    plot(hpc$Global_active_power, type="l", 
         ylab=ylab,
         xlab="",
         xaxt="n")
    axis(1, at=c(1, nrow(hpc)/2, nrow(hpc)), labels=c("Thu", "Fri", "Sat"))
    
    if (!IsMf) {
        plot.save_data("plot2.png")
    }    
}

#Plot2 function for single frame
plot2 <- function() {
    invisible(plot2Mf(FALSE))
}
