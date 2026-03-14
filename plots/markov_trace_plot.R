markov_trace_plot <- function(p_pfs_pd, p_pfs_death, p_pd_death){
  
  trace_res <- markov_model(
    p_pfs_pd,
    p_pfs_death,
    p_pd_death,
    cost_pfs = 2000,
    cost_pd = 4000,
    qaly_pfs = 0.85,
    qaly_pd = 0.65
  )
  
  trace <- trace_res$trace
  
  matplot(
    trace$cycle,
    trace[,2:4],
    type="l",
    lwd=2,
    lty=1,
    col=c("blue","orange","black"),
    xlab="Cycle",
    ylab="Proportion",
    main="Markov State Trace"
  )
  
  legend(
    "right",
    legend=c("Progression Free Survival","Progressive Disease","Death"),
    col=c("blue","orange","black"),
    lwd=2
  )
}