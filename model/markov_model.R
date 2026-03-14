markov_model <- function(p_pfs_pd, p_pfs_death, p_pd_death,
                         cost_pfs, cost_pd,
                         qaly_pfs, qaly_pd,
                         cycles = 60,
                         discount_rate = 0.035){
  
  
  pfs <- rep(0, cycles)
  pd <- rep(0, cycles)
  death <- rep(0, cycles)
  
  costs <- rep(0, cycles)
  qalys <- rep(0, cycles)
  
  pfs[1] <- 1
  
  for(i in 2:cycles){
    
    pfs[i] <- pfs[i-1] * (1 - p_pfs_pd - p_pfs_death)
    
    pd[i] <- pd[i-1] * (1 - p_pd_death) +
      pfs[i-1] * p_pfs_pd
    
    death[i] <- 1 - pfs[i] - pd[i]
    
    df <- discount_factor(discount_rate, i)
    
    costs[i] <- (pfs[i] * cost_pfs + pd[i] * cost_pd) * df
    qalys[i] <- (pfs[i] * qaly_pfs + pd[i] * qaly_pd) * df
  }
  
  total_cost <- sum(costs)
  total_qaly <- sum(qalys)
  
  list(trace=data.frame(cycle=1:cycles,pfs,pd,death),
       cost=total_cost,
       qaly=total_qaly)
}