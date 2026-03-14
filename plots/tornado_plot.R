tornado_plot <- function(){
  
  tornado <- tornado_analysis()
  
  barplot(
    tornado$high - tornado$low,
    names.arg = tornado$parameter,
    horiz = TRUE,
    col = "skyblue",
    main = "Tornado Sensitivity Analysis",
    xlab = "ICER Range"
  )
  
}