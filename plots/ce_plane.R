ce_plane_plot <- function(psa, wtp = 30000){
  
  x <- psa$inc_qaly
  y <- psa$inc_cost
  
  ce <- y < wtp * x
  cols <- ifelse(ce, "darkgreen", "grey")
  
  plot(
    x,
    y,
    col = adjustcolor(cols, alpha = 0.5),
    pch = 16,
    xlab = "Incremental QALY",
    ylab = "Incremental Cost",
    main = "Cost-Effectiveness Plane"
  )
  
  # axis lines
  abline(h = 0, v = 0, lty = 2)
  
  # WTP decision boundary
  abline(a = 0, b = wtp, col = "red", lwd = 2)
  
  # quadrant labels
  text(max(x)*0.7, max(y)*0.8, "More effective\nMore costly", cex=0.9)
  text(min(x)*0.7, max(y)*0.8, "Less effective\nMore costly", cex=0.9)
  text(max(x)*0.7, min(y)*0.8, "More effective\nLess costly", cex=0.9)
  text(min(x)*0.7, min(y)*0.8, "Less effective\nLess costly", cex=0.9)
  
  # legend
  legend(
    "top",
    legend = c("Cost-effective", "Not cost-effective", "WTP threshold"),
    col = c("darkgreen", "grey", "red"),
    pch = c(16,16,NA),
    lty = c(NA,NA,1),
    lwd = c(NA,NA,2),
    bty = "n"
  )
}