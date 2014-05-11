source("plot_common.R")

#######################
#######################

#Plot3 function for multi frame
plot3Mf <- function(IsMf) {
    hpc <- plot.get_data()
    
    box.bty <- if (IsMf) {"n"} else {"o"}
    inset <- if (IsMf) {c(-0.15, 0)} else {c(0,0)}
    plot(hpc$Sub_metering_1, type="l", col="black",
         ylab ="Energy sub metering",
         xlab = "",
         xaxt = "n")
    lines(hpc$Sub_metering_2, col="red")
    lines(hpc$Sub_metering_3, col="blue")
    legend("topright", lty=c(1,1,1), 
           bty = box.bty, 
           xjust = 0, yjust = 0, inset=inset,
           #adj=c(-0.3, 0),
           x.intersp = 0.7, y.intersp = 0.7,
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    axis(1, at=c(1, nrow(hpc)/2, nrow(hpc)), labels=c("Thu", "Fri", "Sat"))
    
    if (!IsMf){
        plot.save_data("plot3.png")
    }
}

#Plot3 function for single frame
plot3 <- function() {
    invisible(plot3Mf(FALSE))
}
