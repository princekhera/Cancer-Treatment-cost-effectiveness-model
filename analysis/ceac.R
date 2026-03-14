ceac_analysis <- function(psa_results,
                          wtp_range = seq(0,100000,1000)){
  
  ceac <- data.frame(
    wtp = wtp_range,
    prob_ce = rep(0,length(wtp_range))
  )
  
  for(i in 1:length(wtp_range)){
    
    lambda <- wtp_range[i]
    
    nmb <- psa_results$inc_qaly * lambda - psa_results$inc_cost
    
    ceac$prob_ce[i] <- mean(nmb > 0, na.rm = TRUE)
    
  }
  
  ceac
}