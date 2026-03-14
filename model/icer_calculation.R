icer_calculation <- function(p_pfs_pd,
                           p_pfs_death,
                           p_pd_death,
                           cost_new,
                           qaly_new
  ){
  
  standard <- markov_model(
    0.08,0.02,0.15,
    cost_pfs=2000,
    cost_pd=4000,
    qaly_pfs=0.85,
    qaly_pd=0.65)
  
  new <- markov_model(
    p_pfs_pd,
    p_pfs_death,
    p_pd_death,
    cost_pfs=cost_new,
    cost_pd=4500,
    qaly_pfs=qaly_new,
    qaly_pd=0.70
    )
  
  inc_cost <- new$cost - standard$cost
  inc_qaly <- new$qaly - standard$qaly
  
  icer <- inc_cost / inc_qaly
  
  list(
    inc_cost = inc_cost,
    inc_qaly = inc_qaly,
    icer = icer
  )
  
}