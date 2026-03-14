ui_outputs <- function(){
  
  tagList(
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h4("Total Cost"),
          textOutput("total_cost")
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Total QALY"),
          textOutput("total_qaly")
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("ICER"),
          textOutput("icer")
        )
      )
      
    ),
    
    br(),
    tableOutput("icer_table"),
    tabsetPanel(
      
      tabPanel(
        "Survival",
        
        br(),
        h3("Treatment Survival Curves"),
        plotOutput("survival"),
        
        br(),
        h3("Markov State Trace"),
        plotOutput("markov_trace")
      ),
      
      tabPanel(
        "PSA",
        
        br(),
        h3("Cost Effectiveness Plane"),
        textOutput("ce_probability"),
        plotOutput("ce_plane"),
        
        br(),
        h3("Cost Effectiveness Acceptability Curve"),
        plotOutput("ceac"),
        
      ),
      
      tabPanel(
        "Sensitivity",
        
        br(),
        h3("Tornado Sensitivity Analysis"),
        plotOutput("tornado")
      )
      
    )
    
  )
  
}