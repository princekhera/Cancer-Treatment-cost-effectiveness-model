tornado_analysis <- function(){
  
  base <- calculate_icer(
    0.08,0.02,0.15,
    cost_new = 5000,
    qaly_new = 0.9
  )$icer
  
  drug_low <- calculate_icer(
    0.08,0.02,0.15,
    cost_new = 4000,
    qaly_new = 0.9
  )$icer
  
  drug_high <- calculate_icer(
    0.08,0.02,0.15,
    cost_new = 6000,
    qaly_new = 0.9
  )$icer
  
  utility_low <- calculate_icer(
    0.08,0.02,0.15,
    cost_new = 5000,
    qaly_new = 0.8
  )$icer
  
  utility_high <- calculate_icer(
    0.08,0.02,0.15,
    cost_new = 5000,
    qaly_new = 1.0
  )$icer
  
  data.frame(
    parameter = c("Drug Cost","Utility PFS"),
    low = c(drug_low,utility_low),
    high = c(drug_high,utility_high)
  )
}