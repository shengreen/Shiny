library(shiny)

# options(expressions=10000)

shinyServer(function(input, output){
  data <- reactive({
    mydist <- switch(input$dist, norm = rnorm, unif = rlnorm, exp = rexp, rnorm)
    cat("input$dist: ", input$dist, "\n")
    cat("input$n: ", input$n, "\n")
    cat("typeof(mydist): ", typeof(mydist), "\n")
    cat("mydist(input$n): ", mydist(input$n), "\n")
    mydist(input$n)
  })
  
  output$plot <- renderPlot({
    mydist <- input$dist
    n <- input$n
    
    cat("main: ", paste('r', mydist, '(', n, ')', sep=''), "\n")
    temp <- data()
    cat("temp: ", temp, "\n")
    
    hist(data(), 
         main=paste('r', mydist, '(', n, ')', sep=''))
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
})
