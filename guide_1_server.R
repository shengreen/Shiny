library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output){
  cat("[shinyServer.function]...\n")
  formulaText <- reactive({
    cat("[shinyServer.function.reactive]...\n")
    # browser(text="Stop browser...", expr = identical(input$variable, "am"))
    paste("mpg ~", input$variable) 
  })
  
  output$caption <- renderText({
    cat("[shinyServer.function.renderText]...\n")
    formulaText()
  })
  
  output$mpgPlot <- renderPlot({
    cat("[shinyServer.function.renderPlot]...\n")
    boxplot(as.formula(formulaText()), data=mpgData, outline=input$outliers)
  })
  
  output$mytable = renderDataTable({
    cat("[shinyServer.function.renderDataTable]...\n")
    mtcars
  })
})

