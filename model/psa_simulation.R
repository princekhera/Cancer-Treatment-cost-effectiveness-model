psa_simulation <- function(n = 500){
  
  results <- data.frame(
    inc_cost = numeric(n),
    inc_qaly = numeric(n)
  )
  
  for(i in 1:n){
    
    # sample parameters
    p_pfs_pd <- rbeta(1,8,92)
    p_pfs_death <- rbeta(1,2,98)
    p_pd_death <- rbeta(1,15,85)
    
    cost_pfs <- rgamma(1,shape=10,scale=500)
    cost_pd <- rgamma(1,shape=12,scale=700)
    
    qaly_pfs <- rbeta(1,80,20)
    qaly_pd <- rbeta(1,60,40)
    
    standard <- markov_model(
      0.08,0.02,0.15,
      cost_pfs,cost_pd,
      qaly_pfs,qaly_pd
    )
    
    new <- markov_model(
      p_pfs_pd,p_pfs_death,p_pd_death,
      cost_pfs*1.5,cost_pd,
      qaly_pfs*1.05,qaly_pd
    )
    
    results$inc_cost[i] <- new$cost - standard$cost
    results$inc_qaly[i] <- new$qaly - standard$qaly
  }
  
  results
}