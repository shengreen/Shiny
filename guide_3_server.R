library(shiny)

shinyServer(function(input, output){
  data <- reactive({
    dist <- switch(input$dist, norm = rnorm, unif = rlnorm, exp = rexp, rnorm)
    cat("dist: ", dist, "\n")
    cat("input$n", input$n, "\n")
    dist(input$n)
    
    hist(data(), main=paste('r', dist, '(', n, ')', sep=''))
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
})
