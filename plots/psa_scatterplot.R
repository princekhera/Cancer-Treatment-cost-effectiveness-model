psa_plot <- function(){
  
  psa <- psa_simulation()
  
  plot(psa$qaly,
       psa$cost,
       pch=16,
       col="blue",
       xlab="QALYs",
       ylab="Costs",
       main="Probabilistic Sensitivity Analysis")
  
}