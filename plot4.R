source("plot_common.R")
source("plot2.R")
source("plot3.R")

#######################
#######################

plot4_1 <- function() {
    plot2Mf(TRUE)
}

plot4_2 <- function() {
    hpc <- plot.get_data()
    
    plot(hpc$Voltage, type="l", col="black",
         xlab = "datetime", ylab ="Voltage", 
         xaxt = "n",
         lwd = 1)
    axis(1, at=c(1, nrow(hpc)/2, nrow(hpc)), labels=c("Thu", "Fri", "Sat"))    
}

plot4_3 <- function() {
    plot3Mf(TRUE)
}

plot4_4 <- function() {
    hpc <- plot.get_data()
    
    plot(hpc$Global_reactive_power, type="l", col="black",
         xlab = "datetime", ylab ="Global_reactive_power", 
         xaxt = "n",
         lwd = 1)
    axis(1, at=c(1, nrow(hpc)/2, nrow(hpc)), labels=c("Thu", "Fri", "Sat"))    
}

plot4 <- function() {
    par(mfrow = c(2,2))
    plot4_1()
    plot4_2()
    plot4_3()
    plot4_4()
    par(mfrow = c(1,1))
    invisible(plot.save_data("plot4.png"))    
}
