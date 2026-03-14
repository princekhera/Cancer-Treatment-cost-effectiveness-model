ui_inputs <- function(){
  
  tagList(
    
    h4("Standard Treatment Assumptions"),
    verbatimTextOutput("standard_info"),
    
    h3("Treatment Parameters"),
    
    sliderInput("cost_new",
                "New Treatment Cost",
                min = 500,
                max = 10000,
                value = 5000),
    
    sliderInput("qaly_new",
                "New Treatment Utility (PFS)",
                min = 0.5,
                max = 0.95,
                value = 0.85,
                step = 0.01),
    
    sliderInput("hazard_new",
                "New Treatment Hazard Rate",
                min = 0.01,
                max = 0.1,
                value = 0.05,
                step = 0.01),
    
    hr(),
    sliderInput(
      "wtp",
      "Willingness To Pay Threshold",
      min = 0,
      max = 100000,
      value = 30000,
      step = 5000
    ),
    
    hr(),
    
    
    h3("Markov Transition Probabilities"),
    
    sliderInput("p_pfs_pd",
                "PFS → Disease Progressive",
                min = 0.01,
                max = 0.30,
                value = 0.08,
                step = 0.01),
    
    sliderInput("p_pfs_death",
                "PFS → Death",
                min = 0.01,
                max = 0.20,
                value = 0.02,
                step = 0.01),
    
    sliderInput("p_pd_death",
                "PD → Death",
                min = 0.01,
                max = 0.40,
                value = 0.15,
                step = 0.01)
    
  )
}