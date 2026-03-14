ceac_plot <- function(psa, wtp_current){
  
  wtp <- seq(0,100000,1000)
  
  prob_ce <- sapply(wtp, function(k){
    mean(psa$inc_cost <= k * psa$inc_qaly)
  })
  
  plot(
    wtp,
    prob_ce,
    type = "l",
    lwd = 2,
    xlab = "Willingness To Pay",
    ylab = "Probability Cost Effective",
    main = "Cost Effectiveness Acceptability Curve"
  )
  
  # mark the selected threshold
  prob_current <- mean(psa$inc_cost <= wtp_current * psa$inc_qaly)
  
  points(wtp_current, prob_current, pch = 19, col = "red", cex = 1.5)
  
  abline(v = wtp_current, col = "red", lty = 2)
  
}