library(shiny)

source("modules/ui_inputs.R")
source("modules/ui_outputs.R")

source("model/icer_calculation.R")
source("model/psa_simulation.R")
source("model/markov_model.R")
source("model/tornado_analysis.R")
source("model/discount.R")

source("analysis/ceac.R")

source("plots/survival_plot.R")
source("plots/ce_plane.R")
source("plots/ceac_plot.R")
source("plots/tornado_plot.R")
source("plots/markov_trace_plot.R")

ui <- fluidPage(
  
  titlePanel("Cancer Treatment Cost Effectiveness Model"),
  
  sidebarLayout(
    
    sidebarPanel(
      ui_inputs()
    ),
    
    mainPanel(
      ui_outputs()
    )
  )
)


server <- function(input, output){
  
  standard_params <- list(
    p_pfs_pd = 0.08,
    p_pfs_death = 0.02,
    p_pd_death = 0.15,
    cost_pfs = 2000,
    cost_pd = 4000,
    qaly_pfs = 0.85,
    qaly_pd = 0.65
  )
  
  
  icer_results <- reactive({
    
    icer_calculation(
      input$p_pfs_pd,
      input$p_pfs_death,
      input$p_pd_death,
      input$cost_new,
      input$qaly_new
    )
    
  })
  
  psa_results <- reactiveVal()
    observe({
      set.seed(123)
      psa_results(psa_simulation(500))
  })
    
  output$standard_info <- renderText({
      
    paste(
      "Standard Treatment Assumptions\n",
      "\nCost in PFS (Per Cycle): £", standard_params$cost_pfs,
      "\nCost in PD (Per Cycle): £", standard_params$cost_pd,
      "\nUtility in PFS:", standard_params$qaly_pfs,
      "\nUtility in PD:", standard_params$qaly_pd,
      "\nPFS → PD:", standard_params$p_pfs_pd,
      "\nPFS → Death:", standard_params$p_pfs_death,
      "\nPD → Death:", standard_params$p_pd_death
    )
      
  })  
  
  output$total_cost <- renderText({
    round(input$cost_new,2)
  })
  
  output$total_qaly <- renderText({
    round(input$qaly_new,2)
  })
  
  output$survival <- renderPlot({
    survival_plot(input$hazard_new)
  })
  
  output$ce_plane <- renderPlot({
    ce_plane_plot(psa_results(), input$wtp)
  })
  
  output$ce_probability <- renderText({
    
    psa <- psa_results()
    wtp <- input$wtp
    
    prob <- mean(psa$inc_cost < wtp * psa$inc_qaly)
    
    paste0("Probability cost-effective: ", round(prob*100,1), "%")
    
  })
  
  output$ceac <- renderPlot({
    ceac_plot(psa_results(), input$wtp)
  })
  
  output$tornado <- renderPlot({
    tornado_plot()
  })
  
  output$markov_trace <- renderPlot({
    markov_trace_plot( 
      input$p_pfs_pd,
      input$p_pfs_death,
      input$p_pd_death)
  })
  
  output$icer <- renderText({
    
    res <- icer_results()
    paste(round(res$icer,2), "£ per QALY")
    
  })
  
  output$icer_table <- renderTable({
    
    res <- icer_results()
    
    standard <- markov_model(
      standard_params$p_pfs_pd,
      standard_params$p_pfs_death,
      standard_params$p_pd_death,
      cost_pfs = standard_params$cost_pfs,
      cost_pd = standard_params$cost_pd,
      qaly_pfs = standard_params$qaly_pfs,
      qaly_pd = standard_params$qaly_pd
    )
    
    new <- markov_model(
      input$p_pfs_pd,
      input$p_pfs_death,
      input$p_pd_death,
      cost_pfs = input$cost_new,
      cost_pd = 4500,
      qaly_pfs = input$qaly_new,
      qaly_pd = 0.70
    )
    
    data.frame(
      Treatment = c("Standard", "New Treatment", "Incremental"),
      
      Cost = c(
        round(standard$cost,2),
        round(new$cost,2),
        round(res$inc_cost,2)
      ),
      
      QALY = c(
        round(standard$qaly,3),
        round(new$qaly,3),
        round(res$inc_qaly,3)
      ),
      
      ICER = c(
        NA,
        NA,
        round(res$icer,2)
      )
    )
    
  })
    
}

shinyApp(ui = ui, server = server)