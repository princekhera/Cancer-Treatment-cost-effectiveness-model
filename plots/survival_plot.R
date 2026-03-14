survival_plot <- function(hazard_new){
  
  hazard_standard <- 0.08
  
  x <- 1:100
  
  survival_standard <- exp(-hazard_standard*x)
  survival_new <- exp(-hazard_new*x)
  
  plot(x, survival_standard,
       type="l",
       col="red",
       lwd=2,
       ylim=c(0,1),
       xlab="Time",
       ylab="Survival Probability",
       main="Treatment Survival Comparison")
  
  lines(x, survival_new,
        col="blue",
        lwd=2)
  
  legend("topright",
         legend=c("Standard","New Treatment"),
         col=c("red","blue"),
         lwd=2)
  
}